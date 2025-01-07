clc; clear all; close all;
%cargamos una red neuronal de 5 capas ocultas  de 25,18,12,6,4 neuronas  en cada
%capa oculta respectivamente
load('red_99.9.mat');
%cargamos los datos recolectadops de la primera prueba para coroborar los
%avances o las diferencias con la pruimera red neuronal de 1 capa oculta a 18
%neur
caja1=[16	16	17	17	18	18	18	20	21	23	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
16	16	17	18	18	18	19	20	21	23	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
16	16	17	18	18	18	19	20	21	23	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	14	14	13	13	12	12	12	13	12	14	14	15	16	18	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	14	14	13	13	12	12	12	12	13	14	15	15	16	19	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	14	14	13	13	12	12	12	12	12	14	15	16	16	18	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	27	27	25	25	24	24	24	24	25	26	26	27	27	29	33	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	27	26	25	25	24	24	24	24	25	26	26	27	27	29	34	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	27	26	25	25	24	24	24	24	25	26	26	27	27	29	34	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	20	19	19	18	18	18	17	17	18	18	19	19	20	20	22	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	20	19	18	18	18	18	17	17	18	18	19	19	20	20	22	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	20	19	18	18	18	18	17	17	18	18	19	19	20	21	22	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	10	9	7	7	6	6	6	7	6	7	7	7	7	10	11	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	11	40	11	7	7	7	6	6	7	7	6	7	7	7	7	10	11	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	10	12	10	7	7	7	6	6	7	7	6	7	7	7	7	10	11	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	10	10	9	7	7	7	7	6	7	7	6	6	7	7	7	10	12	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	13	10	10	7	7	7	7	6	7	7	6	6	7	7	8	10	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	13	10	10	7	7	7	7	6	7	7	6	6	7	7	7	10	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	10	11	9	9	7	7	6	6	7	7	6	7	7	7	8	10	11	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	34	40	27	25	25	24	23	23	22	22	22	22	23	25	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	28	25	25	24	23	23	22	22	22	22	23	26	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	27	25	24	24	23	23	22	22	22	22	23	25	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	26	25	24	23	23	23	22	22	22	23	23	23	24	25	25	29	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	28	26	25	24	23	23	23	22	22	22	23	23	23	24	25	26	27	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	39	18	18	18	18	19	19	19	21	23	26	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	38	18	18	18	18	19	19	20	21	23	25	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	27	25	25	25	25	25	26	27	28	29	31	33	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	27	25	25	25	25	25	26	27	28	29	31	35	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	26	25	25	25	25	25	26	27	28	29	32	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	22	20	17	16	16	15	14	14	13	13	12	13	14	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	23	20	16	16	16	14	14	14	13	13	12	13	14	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	22	20	16	16	16	14	14	13	13	13	13	13	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	33	31	29	27	27	27	26	26	25	25	25	25	25	25	27	29	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	32	31	29	27	27	27	26	26	25	25	25	25	25	25	27	30	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	32	31	29	27	27	27	27	26	25	25	25	25	25	25	27	30	32	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	35	33	33	31	31	31	30	30	29	29	30	29	30	31	31	33	35	35	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	34	33	32	31	31	31	30	30	29	29	29	29	30	31	31	34	34	35	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	34	33	32	31	31	31	30	30	29	29	29	29	30	31	31	33	35	35	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	34	33	32	31	31	31	30	30	29	29	29	29	30	31	31	34	35	36	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	31	30	30	29	28	27	27	27	27	27	27	28	28	29	30	30	31	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	31	30	30	29	27	27	27	27	27	27	28	28	28	29	30	30	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	31	30	30	29	27	27	27	27	27	27	27	28	28	29	30	31	32	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	39	38	36	35	34	33	32	32	32	32	32	32	33	33	33	34	36	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	38	35	35	34	33	32	32	32	32	32	32	33	33	33	34	36	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	39	38	36	35	34	33	32	32	32	32	32	32	33	33	33	34	37	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	38	36	36	35	34	34	33	33	33	33	33	33	34	34	35	36	36	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	38	36	35	34	33	32	32	32	31	31	32	32	33	33	34	35	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	38	35	35	34	33	33	32	32	31	31	32	32	33	33	34	35	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
33	29	29	25	22	20	20	19	20	21	21	22	23	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
32	31	29	24	22	20	20	19	20	21	22	22	23	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
32	31	29	24	22	20	20	19	20	21	21	22	23	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
24	25	25	26	27	27	29	31	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
24	25	25	26	27	27	30	31	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
16	16	16	14	14	14	14	14	15	15	16	17	18	19	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	39	36	35	34	34	33	33	33	33	33	33	34	34	35	36	36	38	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	36	35	34	34	33	33	33	33	33	33	34	34	35	36	36	38	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	34	32	40	29	28	27	27	27	27	26	26	26	27	27	29	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	34	32	32	29	28	27	27	27	27	26	26	26	27	27	29	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	21	20	19	19	18	18	18	18	18	18	18	19	23	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
];
cilindro1=[
40	40	40	40	40	40	40	40	15	14	14	14	14	14	15	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	16	15	14	14	14	14	14	15	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	16	14	14	14	14	14	14	15	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	23	21	19	19	19	18	19	22	22	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	23	21	19	19	19	19	19	22	23	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	23	21	19	19	19	18	19	22	23	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
13	12	12	12	12	12	13	15	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
13	13	12	12	12	12	13	15	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
25	25	25	24	24	25	25	26	27	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
25	25	25	24	24	25	25	26	27	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
25	25	25	24	24	25	25	26	27	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	12	9	8	7	7	8	8	9	11	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	12	9	8	7	7	7	7	9	11	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	12	9	8	7	7	8	7	9	11	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	5	4	4	4	4	7	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	35	34	33	32	32	32	32	32	34	35	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	37	34	34	33	31	32	32	32	32	34	36	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	37	34	34	33	32	32	32	32	32	34	35	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	37	34	34	33	32	31	32	32	33	34	35	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	18	16	15	14	14	14	15	18	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	18	16	15	14	14	14	15	18	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	18	16	15	14	14	14	15	18	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	29	27	25	25	24	23	23	23	23	24	27	27	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	29	27	25	25	24	23	23	23	23	24	27	28	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	28	27	25	25	24	23	23	23	23	24	27	27	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	29	26	25	25	24	23	23	23	23	24	27	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	32	31	31	31	30	31	31	31	32	34	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	32	31	31	31	30	31	31	31	32	34	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	32	31	31	31	31	31	31	31	32	34	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	37	35	35	34	34	34	34	34	35	37	38	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	37	35	35	34	34	34	34	34	35	37	38	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	36	35	35	34	34	34	34	34	35	37	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	24	23	23	23	23	23	23	26	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	24	23	23	23	23	23	23	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	24	23	23	23	23	23	23	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	24	23	23	23	23	23	23	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	30	28	27	27	27	26	27	27	27	29	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	29	28	27	27	27	26	27	27	27	29	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	29	28	27	27	26	26	26	27	27	29	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	34	34	33	32	31	31	31	32	32	34	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	34	34	33	32	31	31	31	32	32	34	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	33	33	32	31	31	32	32	32	35	36	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	15	12	11	11	11	11	11	12	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	15	12	11	11	11	11	11	12	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	20	18	16	16	15	15	15	16	19	22	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	20	18	16	16	15	15	15	16	19	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	34	31	29	28	27	27	27	27	27	27	29	30	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	31	29	28	27	27	27	27	27	27	29	30	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	34	31	29	28	27	27	27	27	27	27	29	30	33	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	35	35	34	33	32	32	31	31	31	32	31	35	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	35	35	34	33	32	32	31	31	31	32	31	35	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	34	33	32	31	31	31	31	31	31	31	31	32	34	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	35	33	32	31	31	31	31	31	31	31	31	33	34	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	34	33	32	31	31	31	31	31	31	31	31	33	34	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	34	33	32	31	31	31	31	31	31	31	31	33	34	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	38	37	36	34	33	33	32	32	33	34	34	35	36	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	37	36	34	33	33	32	32	33	34	34	35	36	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	38	37	36	34	33	32	32	32	33	34	34	35	36	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	15	14	13	12	13	13	13	14	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
];

nad=[
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;
];

encabezado=["sensor_1","sensor_1.1","sensor_1.2","sensor_1.3","sensor_1.4","sensor_2","sensor_2.1","sensor_2.2","sensor_2.3","sensor_2.4","sensor_3","sensor_3.1","sensor_3.2","sensor_3.3","sensor_3.4","sensor_4","sensor_4.1","sensor_4.2","sensor_4.3","sensor_4.4","sensor_5","sensor_5.1","sensor_5.2","sensor_5.3","sensor_5.4","sensor_6","sensor_6.1","sensor_6.2","sensor_6.3","sensor_6.4","sensor_7","sensor_7.1","sensor_7.2","sensor_7.3","sensor_7.4","sensor_8","sensor_8.1","sensor_8.2","sensor_8.3","sensor_8.4","sensor_9","sensor_9.1","sensor_9.2","sensor_9.3","sensor_9.4"," ","cilindro","caja","nada"];
c=1;
c22=2;
filename = 'prueba de red neuronal 2_datos.xlsx';
d=1;
%%
c1_1=1;
c2_2=2;
e=1;

%%

while(true)
     
    for cuad=1:1:59
        d=d+1;
        DATA='cuadro';
        xlswrite(filename,encabezado,DATA,'A1');
        c222=num2str(c22);
        c2=strcat('A',c222);
        a=caja1(cuad,1:45);
        wen=caja1(cuad,1:45)';
        pira2=num2str(d);
        cilindro=strcat('AU',c222);
        caja=strcat('AV',c222);
        triangulo=strcat('AW',c222);
        nada=strcat('AX',c222);
        x=red(wen);% metemos los datos a la red que ya importamos al codigo
        xlswrite(filename,a,DATA,c222);
        
        if x(1,1)>=0.5
            disp('      escaneamos un CILINDRO cerca -->' )
            disp(d)
            xlswrite(filename,'1',DATA,cilindro);

        elseif x(2,1)>=0.5
            disp('      escaneamos UNA CAJA cerca -->') 
            disp(d)
            xlswrite(filename,'1',DATA,caja);

        
            
        elseif x(3,1)>=0.5     
            disp('      NO ESCANEAMOS NADA CERCA -->')
            disp(d)
            xlswrite(filename,'1',DATA,nada);
         
        
        end
        c22=c22+1; 
    end
    
    c=1;
    c22=2;
    d=1;
    
    for cili=1:1:59
        d=d+1;
        DATA='cilindro';
        xlswrite(filename,encabezado,DATA,'A1');
        c222=num2str(c22);
        c2=strcat('A',c222);
        a=cilindro1(cili,1:45);
        wen=cilindro1(cili,1:45)';
        pira2=num2str(d);
        cilindro=strcat('AU',c222);
        caja=strcat('AV',c222);
        triangulo=strcat('AW',c222);
        nada=strcat('AX',c222);
        x=red(wen);% metemos los datos a la red que ya importamos al codigo
        xlswrite(filename,a,DATA,c222);
        
        if x(1,1)>=0.5
            disp('      escaneamos un CILINDRO cerca -->' )
            disp(d)
            xlswrite(filename,'1',DATA,cilindro);

        elseif x(2,1)>=0.5
            disp('      escaneamos UNA CAJA cerca -->') 
            disp(d)
            xlswrite(filename,'1',DATA,caja);

       
            
        elseif x(3,1)>=0.5     
            disp('      NO ESCANEAMOS NADA CERCA -->')
            disp(d)
            xlswrite(filename,'1',DATA,nada);
         
        
        end
        c22=c22+1; 
    end
    
    c=1;
    c22=2;
    d=1;
    
    for nadaa=1:1:25
        d=d+1;
        DATA='nada';
        xlswrite(filename,encabezado,DATA,'A1');
        c222=num2str(c22);
        c2=strcat('A',c222);
        a=nad(nadaa,1:45);
        wen=nad(nadaa,1:45)';
        pira2=num2str(d);
        cilindro=strcat('AU',c222);
        caja=strcat('AV',c222);
        triangulo=strcat('AW',c222);
        nada=strcat('AX',c222);
        x=red(wen);% metemos los datos a la red que ya importamos al codigo
        xlswrite(filename,a,DATA,c222);
        
        if x(1,1)>=0.5
            disp('      escaneamos un CILINDRO cerca -->' )
            disp(d)
            xlswrite(filename,'1',DATA,cilindro);

        elseif x(2,1)>=0.5
            disp('      escaneamos UNA CAJA cerca -->') 
            disp(d)
            xlswrite(filename,'1',DATA,caja);

       
            
        elseif x(3,1)>=0.5     
            disp('      NO ESCANEAMOS NADA CERCA -->')
            disp(d)
            xlswrite(filename,'1',DATA,nada);
         
        
        end
        c22=c22+1; 
    end
    
    
   
    break;
 
end
