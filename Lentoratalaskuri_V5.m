
function  Lentoratalaskuri_V5

v   = 130;     % (m/s) Lähtönopeus
alfa = 45;     % (deg) Kappaleen liikeradan kulma ajanhetkellä 0
m    = 0.2;    % (kg)  Massa
b    = 0.5;    % Kappaleen ilmanvastuskerroin
g    = 9.81;   % (m/s^2) Gravitaatiovakio
e = 2.71828;   % Epsilon



% kutsutaan funktioita
kitkaton(v,alfa,m,g)
kitkallinen(v,alfa,g,b,e)

end

function kitkaton(v,alfa,m,g)

% lasketaan nopeuden x ja y komponentit
vx = v * cosd(alfa);
vy = v * sind(alfa);


% kappaleen nousuaika
tn = (v*sind(alfa))/g;

% kappaleen lento aika = tn * 2
t = 2 * tn;


% kappaleen liike x suunnassa
sx = vx * t;
kantama = sx;
disp ("Kitkaton kantama on:(m)"),disp(kantama)

end
function kitkallinen(v,alfa,g,b,e)

x = 0;                                                    %  Kappaleen sijainti x akselilla ajan hetkell 0
y = 0;                                                    %  Kappaleen sijainti y akselilla ajan hetkell 0
t = 0;                                                    % Aika laskuri

X = [0];                                                  % Luodaan matriisit X ja Y
Y = [0];
n = 1;                                                    % n laskuri matriisien solujen täyttämistä varten. Ensimmäinen solu on nolla koska kappale lähtee origosta.


while  y >=0                                              % kun kappale on y akselin positiivisella puolella, eli ilmassa.


t = t + 0.1;                                              % Aika laskuri

x = ((v*cosd(alfa))/b)*(1-e^(-b*t));                      % Kappaleen sijainti x akselilla ajan hetkellä t
y = ((g+b*v*sind(alfa))/b^2)*(1-e^(-b*t))-((g*t)/b);      % Kappaleen sijainti x akselilla ajan hetkellä t


n=n+1;                                                    % x ja y arvojen tallennus matriisien X ja Y rivien soluihin
X(1,n)=x;
Y(1,n)=y;



end


disp("Kitkallinen kantama on:(m)")
disp(x)
disp("Kappaleen kitkallinen lentoaika on:(s)")
disp(t)
hold on
plot(X,Y)
title ("Kappaleen lentorata ilmanvastuksen kanssa");
xlabel ("m");
ylabel ("m");
%disp(X)
%disp(Y)

axis([-10 300 -10 300])   % kuvaajan akselien skaalaus

end
