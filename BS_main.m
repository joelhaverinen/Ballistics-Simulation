
function BS_main

 main


end
function  main % kun ilmanvastusta ei oteta huomioon

v0   = 50;     % (m/s) Initial velocity
alfa = 20;     % (deg) Angle
m    = 0.01;   % (kg)  Mass
k    = 0.055;  % drag
g    = 9.81;   % (m/s'2) Gravitaatiovakio aka putoamiskiihtyvyys
t    = 1;


% muutetaan asteet radiaaneiksi
%alfarad = deg2rad(alfa);

% kutsutaan toisia funktioita
%kitkaton(v0,alfa,m,g)
kitkallinen(v0,alfa,m,g,k,t)

end

function kitkaton(v0,alfa,m,g)

% lasketaan nopeuden x ja y komponentit
v0x = v0 * cosd(alfa)
v0y = v0 * sind(alfa)


% Lasketaan nousuaika tn, kun vy = 0 ,eli kappale kääntyy laskuun lakikorkeudella.
% v0y-g*tn = 0
% tn = v0y/g
%---> tn = (v0*sind(alfa))/g

tn = (v0*sind(alfa))/g

% kappaleen lento aika = tn * 2
t = 2 * tn

% kappaleen liike x suunnassa

sx = v0x * t


end
function kitkallinen(v0,alfa,m,g,k,t)



%xcom = v0 * cosd(alfa) * e^(k*t);
%ycom = (g/k + v0 * sind(alfa)) * e^(k*t) - g/k;  testailua
%plot(xcom, ycom)




v = v0
x = 0
y = 0

while  y > -1


vx1 = v*cosd(alfa);             %nopeuden x komponentti 0
vy1 = v*sind(alfa);             %nopeuden y komponentti 0

x = x + vx1;
y = y + vy1;

ax1 = -k*vx1*sqrt(vx1^2+vy1^2);   % kiihtyvyyden x komponentit
ay1 = -g-k*vy1*sqrt(vx1^2+vy1^2); % kiihtyvyyden y komponentit


vx1 = vx1 + ax1 /100;            %nopeuden x komponentti sekunnin jälkeen
vy1 = vy1 + ay1 /100;            %nopeuden y komponentti sekunnin jälkeen


x = x + vx1;
y = y + vy1;

%v = sqrt(vx1^2+vy1^2)          % nopeus


%alfa = acosd(vx1/v)            % kumpikin toimii
alfa = atand(vy1/vx1);

hold on
%plot(vx1,vy1)
plot(x,y)
%plot(t,ay1)
t = t + 1;

axis([-10 40000 0 40000])

end

end
