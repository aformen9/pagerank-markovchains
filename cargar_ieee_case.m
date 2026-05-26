% cargar_ieee_case.m
% Descarga y parsea un caso de prueba IEEE desde MATPOWER (GitHub) en runtime
% Alumno: Agustin Formenti
% Materia: Metodos y Computos Numericos - UCA Rosario 2025
% Datos: IEEE Power System Test Cases (MATPOWER) - datos reales

% =========================================================================
% DESCRIPCION:
%   Descarga un archivo de caso IEEE Power System Test Case desde el
%   repositorio oficial de MATPOWER en GitHub, extrae los datos de buses
%   (tipo) y ramas (conexiones), construye la matriz de adyacencia sparse
%   y devuelve la informacion para su uso en experimentos.
%
% ENTRADAS:
%   nombre_caso : string, 'case30' o 'case57' (o cualquier caso MATPOWER)
%
% SALIDAS:
%   G     : matriz sparse n x n (bidireccional: fbus<->tbus en ambas dir.)
%   tipos : cell array 1 x n con tipo de cada bus:
%             'slack'     (type = 3)
%             'generator' (type = 2)
%             'load'      (type = 1)
%   info  : struct con metadatos de la red
%
% USO:
%   [G, tipos, info] = cargar_ieee_case('case30')
%   [G, tipos, info] = cargar_ieee_case('case57')
%
% FUENTE:
%   MATPOWER - https://github.com/MATPOWER/matpower
%   Christie, R. (1993). Power Systems Test Case Archive.
%   University of Washington. https://www2.ee.washington.edu/research/pstca/
%
% REFERENCIA MATEMATICA:
%   Redes electricas son NO DIRIGIDAS: la corriente puede fluir en ambas
%   direcciones dependiendo del estado del sistema. Para modelar esto en
%   PageRank se agregan ambas direcciones de cada linea (fbus->tbus y
%   tbus->fbus), lo que produce una matriz de adyacencia simetrica.
%   Moler (2004), pp. 74-81.
% =========================================================================

function [G, tipos, info] = cargar_ieee_case(nombre_caso)

  %% Descarga del archivo desde el repositorio oficial de MATPOWER
  % Se usa urlread() (compatible con Octave) o webread() (MATLAB R2014b+).
  % Los datos viven en el branch master del repositorio publico de MATPOWER.
  % No se cachean: siempre se descarga la version mas reciente del repositorio.

  url_base = 'https://raw.githubusercontent.com/MATPOWER/matpower/master/data/';
  url      = [url_base, nombre_caso, '.m'];

  texto = '';
  try
    % Intentar con urlread (Octave y MATLAB clasico)
    texto = urlread(url);
  catch
    try
      % Fallback: webread (MATLAB R2014b+)
      texto = webread(url);
    catch
      error('cargar_ieee_case: No se pudo descargar %s.\nVerificar conexion a internet y que el caso existe.\nURL intentada: %s', ...
            nombre_caso, url);
    end
  end

  if isempty(texto)
    error('cargar_ieee_case: Descarga de %s exitosa pero contenido vacio.', nombre_caso);
  end

  %% Parseo del bloque mpc.bus
  % El archivo MATPOWER tiene el siguiente formato para los datos de bus:
  %   mpc.bus = [
  %     bus_i  type  Pd  Qd  Gs  Bs  area  Vm  Va  baseKV  zone  Vmax  Vmin;
  %     ...
  %   ];
  % Extraemos bus_i (columna 1) y type (columna 2).
  %
  % Estrategia de parseo:
  %   1. Encontrar la linea que contiene 'mpc.bus = ['
  %   2. Leer lineas de datos hasta encontrar '];'
  %   3. Cada linea de datos tiene numeros separados por whitespace y termina en ';'

  lineas = strsplit(texto, '\n');
  n_lineas = length(lineas);

  % Extraer bloque mpc.bus
  [bus_i_vec, tipo_vec] = extraer_bloque(lineas, n_lineas, 'mpc.bus');

  if isempty(bus_i_vec)
    error('cargar_ieee_case: No se encontro el bloque mpc.bus en %s.', nombre_caso);
  end

  %% Parseo del bloque mpc.branch
  % Formato del bloque mpc.branch:
  %   mpc.branch = [
  %     fbus  tbus  r  x  b  rateA  rateB  rateC  ratio  angle  status  angmin  angmax;
  %     ...
  %   ];
  % Extraemos fbus (columna 1) y tbus (columna 2).

  [fbus_vec, tbus_vec] = extraer_bloque(lineas, n_lineas, 'mpc.branch');

  if isempty(fbus_vec)
    error('cargar_ieee_case: No se encontro el bloque mpc.branch en %s.', nombre_caso);
  end

  %% Construccion de la matriz de adyacencia bidireccional
  % Las redes electricas son NO DIRIGIDAS: la corriente puede fluir en
  % cualquier sentido. Para modelar esta simetria en PageRank, agregamos
  % AMBAS direcciones de cada linea.
  % Resultado: G es una matriz simetrica donde G(i,j) = G(j,i) = 1
  % si existe una linea entre los buses i y j.

  n = length(bus_i_vec);   % numero total de buses

  % Verificar que los indices de bus son 1-indexados y contiguos
  % (MATPOWER usa bus_i que puede no ser contiguo en casos generales,
  % pero en case30 y case57 son 1..n consecutivos)
  if max(bus_i_vec) ~= n || min(bus_i_vec) ~= 1
    % Remapear indices a 1..n si no son contiguos
    [~, fbus_remap] = ismember(fbus_vec, bus_i_vec);
    [~, tbus_remap] = ismember(tbus_vec, bus_i_vec);
    fbus_vec = fbus_remap;
    tbus_vec = tbus_remap;
  end

  % Agregar ambas direcciones para modelar red no dirigida
  origen  = [fbus_vec; tbus_vec]';   % vector fila: fbus->tbus y tbus->fbus
  destino = [tbus_vec; fbus_vec]';   % vector fila correspondiente

  % Construir la matriz sparse usando construir_red
  % construir_red hace G(destino, origen) = 1
  [G, info_red] = construir_red(origen, destino, n);

  %% Construccion del cell array de tipos de bus
  % type = 3 -> slack bus (referencia del sistema, nodo mas critico fisicamente)
  % type = 2 -> generator bus (PV bus, tiene generacion activa)
  % type = 1 -> load bus (PQ bus, solo demanda)
  tipos = cell(1, n);
  for k = 1:n
    switch tipo_vec(k)
      case 3
        tipos{k} = 'slack';
      case 2
        tipos{k} = 'generator';
      otherwise
        tipos{k} = 'load';
    end
  end

  %% Construccion del struct de informacion
  info.nombre     = nombre_caso;
  info.n_buses    = n;
  info.n_lineas   = length(fbus_vec);   % antes de duplicar para bidireccionalidad
  info.n_slack    = sum(tipo_vec == 3);
  info.n_gen      = sum(tipo_vec == 2);
  info.n_load     = sum(tipo_vec == 1);
  info.fuente     = 'MATPOWER/IEEE Power System Test Cases';
  info.referencia = 'https://github.com/MATPOWER/matpower';

  %% Reporte de la red cargada
  fprintf('Red IEEE %s cargada:\n', nombre_caso);
  fprintf('  Buses      : %d\n', info.n_buses);
  fprintf('  Lineas     : %d\n', info.n_lineas);
  fprintf('  Slack      : %d\n', info.n_slack);
  fprintf('  Generadores: %d\n', info.n_gen);
  fprintf('  Cargas     : %d\n', info.n_load);
  fprintf('\n');

end


% =========================================================================
% FUNCION LOCAL: extraer_bloque
% =========================================================================
% Extrae las dos primeras columnas numericas de un bloque MATPOWER del tipo:
%   nombre_bloque = [
%     dato1  dato2  ...;
%     ...
%   ];
%
% ENTRADAS:
%   lineas       : cell array de strings (cada linea del archivo)
%   n_lineas     : longitud de lineas
%   nombre_bloque: string, ej. 'mpc.bus' o 'mpc.branch'
%
% SALIDAS:
%   col1, col2   : vectores columna con las dos primeras columnas del bloque

function [col1, col2] = extraer_bloque(lineas, n_lineas, nombre_bloque)

  col1 = [];
  col2 = [];

  % Patron de apertura del bloque: 'nombre_bloque = ['
  patron_apertura = [nombre_bloque, ' = ['];

  % Buscar la linea que abre el bloque
  idx_ini = 0;
  for k = 1:n_lineas
    if ~isempty(strfind(lineas{k}, patron_apertura))
      idx_ini = k;
      break;
    end
  end

  if idx_ini == 0
    return;   % bloque no encontrado
  end

  % Leer lineas de datos hasta encontrar el cierre '];'
  for k = idx_ini+1 : n_lineas
    linea = strtrim(lineas{k});

    % Detectar cierre del bloque
    if ~isempty(strfind(linea, '];'))
      break;
    end

    % Saltar lineas vacias o comentarios (empiezan con % o /)
    if isempty(linea) || linea(1) == '%' || linea(1) == '/'
      continue;
    end

    % Quitar el punto y coma al final (si existe)
    linea = strrep(linea, ';', '');

    % Convertir la linea a numeros
    % str2num es mas robusto que sscanf para lineas con tabs y espacios mixtos
    nums = str2num(linea);

    % Solo procesar si hay al menos 2 columnas
    if length(nums) >= 2
      col1(end+1) = nums(1);
      col2(end+1) = nums(2);
    end
  end

  % Convertir a vectores columna
  col1 = col1(:);
  col2 = col2(:);

end
