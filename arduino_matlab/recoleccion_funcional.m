clear all; close all; clc;% BORRAMOS TODOS LOS DATO Y CERRAMOS TODO TAMBIEN LIMPIAMOS TERMINAL

%----------------------------configuracion indispensable para  iniciar la comunicacion con arduino--------------
 
if ~isempty(instrfind)% CIERRO LOS PUERTOS COM PARA QUE NO MARQUE ERRORES AL COMUNICARME CON ARUDINO
    fclose(instrfind);
     delete(instrfind);
 end
%---------------------------variables de contadores y base de datos -------------------------------------------- 
conjunto = zeros(1,27);
cont_break = 1;
dat=[];
cont1 = 1;
cont2 = 1;
cont3 = 1;


%---------------------------configuracion de arduino------------------------------------------------------------

a = serial('COM8','BaudRate',9600);% creo el objeto para la comunicacion con arudino y lo configuro
q=input(' introduce el numero 1 para iniciar');


%---------------------------- loop infinito---------------------------------------------------------------------

fopen(a);% abrimos el puerto serial
flushinput(a);% limpiamos el puerto serial de entrada
fwrite(a,'1');%escribimos 1 en el puerto serial 
while(true) 
    ultra = fscanf(a);
    x = str2num(ultra);
    dat = [dat,x]; 
    disp(ultra)
     
    if length(dat)==9
        %disp('filtro 1 pasado')
        if cont_break==1     
            %disp('break 1')
            for e = 1:3:27
               % disp('for 1')
                conjunto(1,e)=dat(1,cont1);
                cont1 = cont1 +1;
            if cont1 >9
                %disp('if cont 1')
                cont_break = cont_break +1;
               % disp(cont_break) 
                cont1 = 0;
                dat=[];
            end        	
            end
        
        
    elseif cont_break==2
            %disp('break 2')
            for f = 2:3:27
                conjunto(1,f)=dat(1,cont2);
                cont2 = cont2 +1;
                if cont2>9                              
                    cont_break = cont_break +1;
                    %disp(cont_break)
                    cont2=0;
                    dat=[];
                end
            end                    
      
        
    elseif cont_break==3
             %disp('break 3')
            for g = 3:3:27
                conjunto(1,g)=dat(1,cont3);
                cont3 = cont3 +1;
                if cont3>9                      
                    cont_break = cont_break +1;
                   % disp(cont_break) 
                    cont3=0;
                    dat=[];
                end          
            end
        end
    if cont_break>=4
       %disp('break final')
       break;
    end
      
    end
     
        
end
fclose(a);
