clear;%#codgen
close all;
clc;% BORRAMOS TODOS LOS DATO Y CERRAMOS TODO TAMBIEN LIMPIAMOS TERMINAL
r = raspi;%creamo el obejeto de conexion de la raspberry en este caso en nuestra red hay solo una por lo que no es necesario especificar
myserialdevice =serialdev(r,'/dev/ttyACM0',9600);%abrimos el com0 de la rapberry
q=figure(3);
txt1 = text(0.3,0.5,'INICIANDO RECONOCIMIENTO . . .');
%---------------------------INICIANDO EL CICLO DE RECOLECCION DE DATOS-------------------------------------------- 
load('red99_8.mat');
%---------------------------variables de contadores y base de datos -------------------------------------------- 
conjunto = zeros(1,45);
cont_break = 1;
dat=[];
cont1 = 1;
cont2 = 1;
cont3 = 1;
cont4 = 1;
cont5 = 1;
c=0;

while(true) 
    
    if c==1   
        ultra = read(myserialdevice,2,'char');%recolectamos lo que hay en el puerto serial de dos en dos
        x = str2num(ultra); %trasform2amos los datos de tipó str a numerico
        dat = [dat,x]; %guardamos el dato recolectado en un array
        
        if length(dat)==9 % cuando dato llegue a los 9 datos recolectados entrara en este if
            disp(dat)
            if cont_break==1     
                for e = 1:5:45
                    conjunto(1,e)=dat(1,cont1);% agregamos los primeros 9 datos a un conjunto , dejando 2 espacios entre dato y dato
                    cont1 = cont1 +1; 
                if cont1 >9 % cuando agregamos los 9 datos rompemos el ciclo y reiniciamos los contadores y la variable dat
                    disp('INICIANDO EL RECONOCIMIENTO . . .')
                    cont_break = cont_break +1;
                    cont1 = 0;
                    dat=[];
                end        	
                end
            elseif cont_break==2
                for f = 2:5:45
                    conjunto(1,f)=dat(1,cont2);% agregamos los primeros 9 datos a un conjunto , dejando 2 espacios entre dato y dato
                    cont2 = cont2 +1;
                    if cont2>9    % cuando agregamos los 9 datos rompemos el ciclo y reiniciamos los contadores y la variable dat                          
                        cont_break = cont_break +1;
                        cont2=0;
                        dat=[];
                    end
                end                    
            elseif cont_break==3
                for g = 3:5:45
                    conjunto(1,g)=dat(1,cont3);% agregamos los primeros 9 datos a un conjunto , dejando 2 espacios entre dato y dato
                    cont3 = cont3 +1;
                    if cont3>9  % cuando agregamos los 9 datos rompemos el ciclo y reiniciamos los contadores y la variable dat                    
                        cont_break = cont_break +1;
                        cont3=0;
                        dat=[];
                    end          
                end  
            elseif cont_break==4
                for h = 4:5:45
                    conjunto(1,h)=dat(1,cont4);% agregamos los primeros 9 datos a un conjunto , dejando 2 espacios entre dato y dato
                    cont4 = cont4 +1;
                    if cont4>9  % cuando agregamos los 9 datos rompemos el ciclo y reiniciamos los contadores y la variable dat                    
                        cont_break = cont_break +1;
                        cont4=0;
                        dat=[];
                    end          
                end
            elseif cont_break==5
                for i = 5:5:45
                    conjunto(1,i)=dat(1,cont5);% agregamos los primeros 9 datos a un conjunto , dejando 2 espacios entre dato y dato
                    cont5 = cont5 +1;
                    if cont5>9  % cuando agregamos los 9 datos rompemos el ciclo y reiniciamos los contadores y la variable dat                    
                        cont_break = cont_break +1;
                        cont5=0;
                        dat=[];                       
                    end          
                end         
            end
        if cont_break>=6 % cuando el cont_break llega a 4 o sea que hizo 3 iteraciones ya que lo iniciamos con el valor de 1         
            q = grafica2(conjunto)
            A = conjunto';
            x=red(A);
            if x(1,1)>=0.5
                w=1;%cilindro
                disp("detectamos un objeto de forma CILINDRICA");
            elseif x(2,1)>=0.5
                w=2;%caja
                disp("detectamos un objeto de forma cuadrada");
            elseif x(3,1)>=0.5
                w=3;%nada
                disp("NO DETECTAMOS NADA CERCANO");
            end
            conjunto = zeros(1,45);
            cont_break = 1;
            dat=[];
            cont1 = 1;
            cont2 = 1;
            cont3 = 1;
            cont4 = 1;
            cont5 = 1;
            c=0;
        end 
        end
    else
        c= input('introduce un 1 para iniciar --> ') ;
        if c==1
            write(myserialdevice,'1'); %envia un 1 al puerto serial
        end    
    end 
end