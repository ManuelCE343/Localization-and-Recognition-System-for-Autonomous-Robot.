function grafica2()%#codegen
    rall = 1;% radio del circulo sensores
    ras = raspi;%creamo el obejeto de conexion de la raspberry en este caso en nuestra red hay solo una por lo que no es necesario especificar
    theta = linspace(0, 2*pi);
    n=4.5; % grados entre giros de sensores;
    data_base=[16	16	17	17	18	18	18	20	21	23	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	40	;];
    %--------------- circulo principal --------------------------
    r = 15.5;% radio del circulo
    xc = 0; %posicion del circulo central en x
    yc = 0; %posicion del circulo central en y
    x = xc+cos(theta)' *r;
    y = yc+sin(theta)' *r;
    %-------------------------------------------------------------
    %--------------- circulo donde posicionaremos los sensores --------------------------
    rr = 16.5;% radio del circulo
    xcr = 0; %posicion del circulo central en x
    ycr = 0; %posicion del circulo central en y
    xr = xcr+cos(theta)' *rr;
    yr = ycr+sin(theta)' *rr;

    %############################### SENSOR 1 #############################
    xc1 =data_base(1)* (cosd(9));%-16.1687; %posicion del circulo central en x)
    yc1 = data_base(1)* (sind(9)); %-3.3569; %posicion del circulo central en y
    xc1=(16.2969)+xc1;
    yc1=(2.5812)+yc1;
    x_1 = -xc1+cos(theta)' *rall;
    y_1 = -yc1+sin(theta)' *rall;
    %############################### SENSOR 2 #############################
    xc2 = (data_base(2)* (cosd(4.5)));% %posicion del circulo central en x)
    yc2 = (data_base(2)* (sind(4.5))); % %posicion del circulo central en y
    xc2= 16.4491+xc2;
    yc2=1.2946+yc2;
    x2 = -xc2+cos(theta)' *rall;
    y2 = -yc2+sin(theta)' *rall;
    %############################### SENSOR 3 #############################
    xc3 = data_base(3)* cosd(0);%posicion del circulo central en x)
    yc3 = data_base(3)* sind(0);%posicion del circulo central en
    xc3= xc3+16.5000 ;
    yc3= yc3+0;
    x3 = -xc3+cos(theta)' *rall;
    y3 = -yc3+sin(theta)' *rall;
    %############################### SENSOR 4 #############################
    xc4 = (data_base(4)* (cosd(0+n))); %posicion del circulo central en x)
    yc4 = (data_base(4)* (sind(0+n))); %posicion del circulo central en 
    xc4=xc4 +16.4491 ;
    yc4=yc4 + 1.2946;
    x4 = -xc4+cos(theta)' *rall;
    y4 = yc4+sin(theta)' *rall;
    %############################### SENSOR 5 #############################
    num=4.5+n;
    xc5 = (data_base(5)* (cosd(num))); %posicion del circulo central en x)
    yc5 = (data_base(5)* (sind(num))); %posicion del circulo central en y
    xc5=xc5+ 16.2969;
    yc5=yc5 + 2.5812;
    x5 = -xc5+cos(theta)' *rall;
    y5 = yc5+sin(theta)' *rall;
    %############################### SENSOR 6 #############################
    num=num+n;
    xc6 = (data_base(6)* (cosd(num))); %posicion del circulo central en x)
    yc6 = (data_base(6)* (sind(num))); %posicion del circulo central en 
    xc6=xc6+ 16.0441;
    yc6=yc6 + 3.8518;
    x6 = -xc6+cos(theta)' *rall;
    y6 = yc6+sin(theta)' *rall;
    %############################### SENSOR 7 #############################
    num=num+n;
    xc7 = (data_base(7)* (cosd(num))); %posicion del circulo central en x)
    yc7 = (data_base(7)* (sind(num))); %posicion del circulo central en y
    xc7=xc7+ 15.6924;
    yc7=yc7+ 5.0988;
    x7 = -xc7+cos(theta)' *rall;
    y7 = yc7+sin(theta)' *rall;
    %############################### SENSOR 8 #############################
    num=num+n;
    xc8 = (data_base(8)* (cosd(num))); %posicion del circulo central en x)
    yc8 = (data_base(8)* (sind(num))); %posicion del circulo central en y
    xc8=xc8+ 15.2440;
    yc8= yc8+ 6.3143;
    x8 = -xc8+cos(theta)' *rall;
    y8 = yc8+sin(theta)' *rall;
    %############################### SENSOR 9 #############################
    num=num+n;
    xc9 = (data_base(9)* (cosd(num))); %posicion del circulo central en x)
    yc9 = (data_base(9)* (sind(num))); %posicion del circulo central en y
    xc9=xc9+ 14.7016 ;
    yc9= yc9+ 7.4908;
    x9= -xc9+cos(theta)' *rall;
    y9 = yc9+sin(theta)' *rall;
    %############################### SENSOR 10 #############################
    num=num+n;
    xc10 = (data_base(10)* (cosd(num))); %posicion del circulo central en x)
    yc10 = (data_base(10)* (sind(num))); %posicion del circulo central en y
    xc10= xc10+ 14.0686;
    yc10= yc10+ 8.6212 ;
    x10= -xc10+cos(theta)' *rall;
    y10 = yc10+sin(theta)' *rall;
    %############################### SENSOR 11 #############################
    num=num+n;
    xc11 = (data_base(11)* (cosd(num))); %posicion del circulo central en x)
    yc11 = (data_base(11)* (sind(num))); %posicion del circulo central en y
    xc11= xc11 +13.3488 ;
    yc11=yc11 +9.6985 ;
    x11 = -xc11+cos(theta)' *rall;
    y11 = yc11+sin(theta)' *rall;
    %############################### SENSOR 12 #############################
    num=num+n;
    xc12 = (data_base(12)* (cosd(num))); %posicion del circulo central en x)
    yc12 = (data_base(12)* (sind(num))); %posicion del circulo central en y
    xc12 = xc12+ 12.5467;
    yc12 = yc12 + 10.7159;
    x12 =  -xc12+cos(theta)' *rall;
    y12 = yc12+sin(theta)' *rall;
    %############################### SENSOR 13 #############################
    num=num+n;
    xc13 = (data_base(13)* (cosd(num))); %posicion del circulo central en x)
    yc13 = (data_base(13)* (sind(num))); %posicion del circulo central en y
    xc13=xc13 + 11.6673 ;
    yc13=yc13+ 11.6673 ;
    x13 = -xc13+cos(theta)' *rall;
    y13 = yc13+sin(theta)' *rall;
    %############################### SENSOR 14 #############################
    num=num+n;
    xc14 = (data_base(14)* (cosd(num))); %posicion del circulo central en x)
    yc14 = (data_base(14)* (sind(num))); %posicion del circulo central en y
    xc14 = xc14+ 10.7159 ;
    yc14= yc14 + 12.5467;
    x14 = -xc14+cos(theta)' *rall;
    y14 = yc14+sin(theta)' *rall;
    %############################### SENSOR 15 #############################
    num=num+n;
    xc15 = (data_base(15)* (cosd(num))); %posicion del circulo central en x)
    yc15 = (data_base(15)* (sind(num))); %posicion del circulo central en y
    xc15 =xc15+ 9.6985;
    yc15= yc15+ 13.3488;
    x15= -xc15+cos(theta)' *rall;
    y15 = yc15+sin(theta)' *rall;
    %############################### SENSOR 16 #############################
    num=num+n;
    xc16 = (data_base(16)* (cosd(num))); %posicion del circulo central en x)
    yc16 = (data_base(16)* (sind(num))); %posicion del circulo central en y
    xc16=xc16+ 8.6212;
    yc16= yc16+ 14.0686;
    x16 = -xc16+cos(theta)' *rall;
    y16 = yc16+sin(theta)' *rall;
    %############################### SENSOR 17 #############################
    num=num+n;
    xc17 = (data_base(17)* (cosd(num))); %posicion del circulo central en x)
    yc17 = (data_base(17)* (sind(num))); %posicion del circulo central en y
    xc17=xc17 + 7.4908;
    yc17= yc17+ 14.7016;
    x17 = -xc17+cos(theta)' *rall;
    y17= yc17+sin(theta)' *rall;
    %############################### SENSOR 18 #############################
    num=num+n;
    xc18 = (data_base(18)* (cosd(num))); %posicion del circulo central en x)
    yc18 = (data_base(18)* (sind(num))); %posicion del circulo central en y
    xc18= xc18+ 6.3143;
    yc18=yc18+ 15.2440;
    x18 = -xc18+cos(theta)' *rall;
    y18= yc18+sin(theta)' *rall;
    %############################### SENSOR 19 #############################
    num=num+n;
    xc19 = (data_base(19)* (cosd(num))); %posicion del circulo central en x)
    yc19 = (data_base(19)* (sind(num))); %posicion del circulo central en y
    xc19= xc19 + 5.0988;
    yc19= yc19 + 15.6924;
    x19 = -xc19+cos(theta)' *rall;
    y19= yc19+sin(theta)' *rall;
    %############################### SENSOR 20 #############################
    num=num+n;
    xc20 = (data_base(20)* (cosd(num))); %posicion del circulo central en x)
    yc20 = (data_base(20)* (sind(num))); %posicion del circulo central en y
    xc20= xc20+ 3.8518;
    yc20=yc20 + 16.0441;
    x20 = -xc20+cos(theta)' *rall;
    y20= yc20+sin(theta)' *rall;
    %############################### SENSOR 21 #############################
    num=num+n;
    xc21 = (data_base(21)* (cosd(num))); %posicion del circulo central en x)
    yc21 = (data_base(21)* (sind(num))); %posicion del circulo central en y
    xc21=xc21 +2.5812 ;
    yc21= yc21+ 16.2969;
    x21= -xc21+cos(theta)' *rall;
    y21= yc21+sin(theta)' *rall;
    %############################### SENSOR 22 #############################
    num=num+n;
    xc22 = (data_base(22)* (cosd(num))); %posicion del circulo central en x)
    yc22 = (data_base(22)* (sind(num))); %posicion del circulo central en y
    xc22=xc22+ 1.2946;
    yc22=yc22+ 16.4491;
    x22= -xc22+cos(theta)' *rall;
    y22= yc22+sin(theta)' *rall;
    %############################### SENSOR 23 #############################
    num=num+n;
    xc23 = (data_base(23)* (cosd(num))); %posicion del circulo central en x)
    yc23 = (data_base(23)* (sind(num))); %posicion del circulo central en y
    xc23=xc23+ 0;
    yc23=yc23+ 16.5000;
    x23= -xc23+cos(theta)' *rall;
    y23= yc23+sin(theta)' *rall;
    %############################### SENSOR 24 #############################
    num=num+n;
    xc24 = (data_base(24)* (cosd(num))); %posicion del circulo central en x)
    yc24 = (data_base(24)* (sind(num))); %posicion del circulo central en y
    xc24=xc24 + -1.2946;
    yc24=yc24 + 16.4491 ;
    x24= -xc24+cos(theta)' *rall;
    y24= yc24+sin(theta)' *rall;
    %############################### SENSOR 25 #############################
    num=num+n;
    xc25 = (data_base(25)* (cosd(num))); %posicion del circulo central en x)
    yc25 = (data_base(25)* (sind(num))); %posicion del circulo central en y
    xc25=xc25 + -2.5812;
    yc25=yc25 + 16.2969;
    x25= -xc25+cos(theta)' *rall;
    y25= yc25+sin(theta)' *rall;
    %############################### SENSOR 26 #############################
    num=num+n;
    xc26 = (data_base(26)* (cosd(num))); %posicion del circulo central en x)
    yc26 = (data_base(26)* (sind(num))); %posicion del circulo central en y
    xc26=xc26 + -3.8518 ;
    yc26=yc26 + 16.0441 ;
    x26= -xc26+cos(theta)' *rall;
    y26= yc26+sin(theta)' *rall;
    %############################### SENSOR 27 #############################
    num=num+n;
    xc27 = (data_base(27)* (cosd(num))); %posicion del circulo central en x)
    yc27 = (data_base(27)* (sind(num))); %posicion del circulo central en y
    xc27=xc27 + -5.0988;
    yc27=yc27 + 15.6924 ;
    x27= -xc27+cos(theta)' *rall;
    y27= yc27+sin(theta)' *rall;
    %############################### SENSOR 28 #############################
    num=num+n;
    xc28 = (data_base(28)* (cosd(num))); %posicion del circulo central en x)
    yc28 = (data_base(28)* (sind(num))); %posicion del circulo central en y
    xc28=xc28 + -6.3143;
    yc28=yc28 + 15.2440;
    x28= -xc28+cos(theta)' *rall;
    y28= yc28+sin(theta)' *rall;
    %############################### SENSOR 29 #############################
    num=num+n;
    xc29 = (data_base(29)* (cosd(num))); %posicion del circulo central en x)
    yc29 = (data_base(29)* (sind(num))); %posicion del circulo central en y
    xc29=xc29 + -7.4908;
    yc29=yc29 + 14.7016;
    x29= -xc29+cos(theta)' *rall;
    y29= yc29+sin(theta)' *rall;
    %############################### SENSOR 30 #############################
    num=num+n;
    xc30 = (data_base(30)* (cosd(num))); %posicion del circulo central en x)
    yc30 = (data_base(30)* (sind(num))); %posicion del circulo central en y
    xc30=xc30 + -8.6212;
    yc30=yc30 + 14.0686;
    x30= -xc30+cos(theta)' *rall;
    y30= yc30+sin(theta)' *rall;
    %############################### SENSOR 31 #############################
    num=num+n;
    xc31 = (data_base(31)* (cosd(num))); %posicion del circulo central en x)
    yc31 = (data_base(31)* (sind(num))); %posicion del circulo central en y
    xc31=xc31+ -9.6985;
    yc31=yc31 + 13.3488;
    x31= -xc31+cos(theta)' *rall;
    y31= yc31+sin(theta)' *rall;
    %############################### SENSOR 32 #############################
    num=num+n;
    xc32 = (data_base(32)* (cosd(num))); %posicion del circulo central en x)
    yc32 = (data_base(32)* (sind(num))); %posicion del circulo central en y
    xc32=xc32+ -10.7159 ;
    yc32=yc32 + 12.5467;
    x32= -xc32+cos(theta)' *rall;
    y32= yc32+sin(theta)' *rall;
    %############################### SENSOR 33 #############################
    num=num+n;
    xc33 = (data_base(33)* (cosd(num))); %posicion del circulo central en x)
    yc33 = (data_base(33)* (sind(num))); %posicion del circulo central en y
    xc33=xc33 + -11.6673;
    yc33=yc33 +  11.6673 ;
    x33= -xc33+cos(theta)' *rall;
    y33= yc33+sin(theta)' *rall;
    %############################### SENSOR 34 #############################
    num=num+n;
    xc34 = (data_base(34)* (cosd(num))); %posicion del circulo central en x)
    yc34 = (data_base(34)* (sind(num))); %posicion del circulo central en y
    xc34=xc34+ -12.5467;
    yc34=yc34+ 10.7159;
    x34= -xc34+cos(theta)' *rall;
    y34= yc34+sin(theta)' *rall;
    %############################### SENSOR 35 #############################
    num=num+n;
    xc35 = (data_base(35)* (cosd(num))); %posicion del circulo central en x)
    yc35 = (data_base(35)* (sind(num))); %posicion del circulo central en y
    xc35=xc35 + -13.3488;
    yc35=yc35+ 9.6985;
    x35= -xc35+cos(theta)' *rall;
    y35= yc35+sin(theta)' *rall;
    %############################### SENSOR 36 #############################
    num=num+n;
    xc36 = (data_base(36)* (cosd(num))); %posicion del circulo central en x)
    yc36 = data_base(36)* sind(num); %posicion del circulo central en y
    xc36 = xc36 + -14.0686 ;
    yc36 = yc36  + 8.6212;
    x36= -xc36+cos(theta)' *rall;
    y36= yc36+sin(theta)' *rall;
    %############################### SENSOR 37 #############################
    num=num+n;
    xc37 = (data_base(37)* (cosd(num))); %posicion del circulo central en x)
    yc37 = (data_base(37)* (sind(num))); %posicion del circulo central en y
    xc37=xc37+ -14.7016;
    yc37=yc37 + 7.4908;
    x37= -xc37+cos(theta)' *rall;
    y37= yc37+sin(theta)' *rall;
    %############################### SENSOR 38 #############################
    num=num+n;
    xc38 = (data_base(38)* (cosd(num))); %posicion del circulo central en x)
    yc38 = (data_base(38)* (sind(num))); %posicion del circulo central en y
    xc38=xc38 + -15.2440;
    yc38=yc38 + 6.3143;
    x38= -xc38+cos(theta)' *rall;
    y38= yc38+sin(theta)' *rall;
    %############################### SENSOR 39 #############################
    num=num+n;
    xc39 = (data_base(39)* (cosd(num))); %posicion del circulo central en x)
    yc39 = (data_base(39)* (sind(num))); %posicion del circulo central en y
    xc39= xc39 + -15.6924 ;
    yc39= yc39 + 5.0988 ;
    x39= -xc39+cos(theta)' *rall;
    y39= yc39+sin(theta)' *rall;
    %############################### SENSOR 40 #############################
    num=num+n;
    xc40 = (data_base(40)* (cosd(num))); %posicion del circulo central en x)
    yc40 = (data_base(40)* (sind(num))); %posicion del circulo central en y
    xc40= xc40 + -16.0441;
    yc40= yc40+ 3.8518 ;
    x40= -xc40+cos(theta)' *rall;
    y40= yc40+sin(theta)' *rall;
    %############################### SENSOR 41 #############################
    num=num+n;
    xc41 = (data_base(41)* (cosd(num))); %posicion del circulo central en x)
    yc41 = (data_base(41)* (sind(num))); %posicion del circulo central en y
    xc41=xc41 + -16.2969 ;
    yc41= yc41 + 2.5812;
    x41= -xc41+cos(theta)' *rall;
    y41= yc41+sin(theta)' *rall;
    %############################### SENSOR 42 #############################
    num=num+n;
    xc42 = (data_base(42)* (cosd(num))); %posicion del circulo central en x)
    yc42 = (data_base(42)* (sind(num))); %posicion del circulo central en y
    xc42 = xc42 + -16.4491;
    yc42 = yc42 + 1.2946 ;
    x42= -xc42+cos(theta)' *rall;
    y42= yc42+sin(theta)' *rall;
    %############################### SENSOR 43 #############################
    num=0;
    xc43 = (data_base(43)* (cosd(num))); %posicion del circulo central en x)
    yc43 = (data_base(43)* (sind(num))); %posicion del circulo central en y
    xc43 = xc43 + 16.5000;
    yc43 =yc43 + 0;
    x43= xc43+cos(theta)' *rall;
    y43= -yc43+sin(theta)' *rall;
    %############################### SENSOR 44 #############################
    num=9-n;
    xc44 = (data_base(44)* (cosd(num))); %posicion del circulo central en x)
    yc44 = (data_base(44)* (sind(num))); %posicion del circulo central en y
    xc44 = xc44 + 16.4491;
    yc44 = yc44 + 1.2946;
    x44= xc44+cos(theta)' *rall;
    y44= -yc44+sin(theta)' *rall;
    %############################### SENSOR 45 #############################
    num=9;
    xc45 = (data_base(45)* (cosd(num))); %posicion del circulo central en x)
    yc45 = (data_base(45)* (sind(num))); %posicion del circulo central en y
    xc45 = xc45 + 16.2969;
    yc45 = yc45 + 2.5812;
    x45= xc45+cos(theta)' *rall;
    y45= -yc45+sin(theta)' *rall;
    %------------------------------------------------------------------
    cla %limpia los ejes de la grafica
   %figure(3); %crea una vebnta con el numero
    subplot(1, 1, 1) ;%subplot(i, j, k)– i,j dividen la ventana en sectores (filas y columnas) - k indica el sector donde se coloca el gráfico
    hold on; %para dibujar más de una curva, superficie o línea (o combinación de éstos) en un mismo gráfico, se debe usar
    plot(x,y,'k',xr,yr,'-- g')
    %----------sensores plot ------------
    X=[x_1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31 x32 x33 x34 x35 x36 x37 x38 x39 x40 x41 x42 x43 x44 x45];
    Y=[y_1 y2 y3 y4 y5 y6 y7 y8 y9 y10 y11 y12 y13 y14 y15 y16 y17 y18 y19 y20 y21 y22 y23 y24 y25 y26 y27 y28 y29 y30 y31 y32 y33 y34 y35 y36 y37 y38 y39 y40 y41 y42 y43 y44 y45];
    plot(X,Y,'b');
    displayImage(ras,figure(1),'Title','Edge Detection');
    
end