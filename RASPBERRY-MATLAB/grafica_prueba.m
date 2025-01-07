function grafica_prueba()%#codegen
%creamo el obejeto de conexion de la raspberry 
%r = raspi;
rall = 1;% radio del circulo sensores
theta = linspace(0, 2*pi);
n=4.5; % grados entre giros de sensores;
data_base=[16	16	17	17	18	18	18	20	21	23	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;];
%--------------- circulo principal --------------------------
ra = 15.5;% radio del circulo
xc = 0; %posicion del circulo central en x
yc = 0; %posicion del circulo central en y
x = xc+cos(theta)' *ra;
y = yc+sin(theta)' *ra;

cla %limpia los ejes de la grafica

%figure(3); %crea una vebnta con el numero
%subplot(1, 1, 1) ;%subplot(i, j, k)– i,j dividen la ventana en sectores (filas y columnas) - k indica el sector donde se coloca el gráfico
hold on; %para dibujar más de una curva, superficie o línea (o combinación de éstos) en un mismo gráfico, se debe usar
lol= plot(x,y,'k');

end
