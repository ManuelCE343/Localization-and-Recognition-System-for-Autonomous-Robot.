
clear all; close all; clc;% BORRAMOS TODOS LOS DATO Y CERRAMOS TODO TAMBIEN LIMPIAMOS TERMINAL

%----------------------------configuracion indispensable para  iniciar la comunicacion con arduino--------------
 
if ~isempty(instrfind)% CIERRO LOS PUERTOS COM PARA QUE NO MARQUE ERRORES AL COMUNICARME CON ARUDINO
    fclose(instrfind);
     delete(instrfind);
end

dat=[];
cont = 1;

a = serial('COM8','BaudRate',9600);% creo el objeto para la comunicacion con arudino y lo configuro
fopen(a);% abrimos el puerto serial
flushinput(a);% limpiamos el puerto serial de entrada
fwrite(a,'1');%escribimos 1 en el puerto serial 
%---------------------------- loop infinito---------------------------------------------------------------------
while(true) 
   
    
   ultra = fscanf(a);
   x = str2num(ultra);
   dat = [dat,x]; 
       
    
    cont = cont + 1;
    
    if cont>27
        break;
    end
    disp(cont)
end
fclose(a);

