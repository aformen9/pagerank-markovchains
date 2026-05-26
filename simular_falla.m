% simular_falla.m
% Simula la falla de nodos en una red eliminando sus conexiones y recalcula PageRank
% Alumno: Agustin Formenti
% Materia: Metodos y Computos Numericos - UCA Rosario 2025

function [pi_nuevo, n_desconectados] = simular_falla(G, nodos_a_remover)

%% Eliminar filas y columnas de los nodos removidos
% Falla de un nodo = cortar todos sus links entrantes y salientes
G_falla = G;
G_falla(nodos_a_remover, :) = 0;   % eliminar outlinks
G_falla(:, nodos_a_remover) = 0;   % eliminar inlinks

%% Contar nodos desconectados
% Un nodo queda desconectado si no tiene ningun link entrante ni saliente
% (excluimos los nodos que fueron removidos deliberadamente)
n = size(G, 1);
todos = 1:n;
activos = setdiff(todos, nodos_a_remover);

grado_total = full(sum(G_falla, 1) + sum(G_falla, 2)');
n_desconectados = sum(grado_total(activos) == 0);

%% Recalcular PageRank sobre la red modificada
[pi_nuevo, ~, ~] = pagerank(G_falla, 0.85, 1e-8, 200);

end