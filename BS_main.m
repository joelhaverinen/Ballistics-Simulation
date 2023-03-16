
function BS_main

 main

end
function  main

v0   = 930;    % (m/s) Initial velocity (K9 Thunder 155 mm)
alfa = 35      % (deg) Angle
m    = 46.4    % (kg)  Mass (K307, BB/HE 155 mm)
k    = 0.1;  % drag ohje arvo oli 0.055 jossain
g    = 9.81;   % (m/s'2) Gravitaatiovakio aka putoamiskiihtyvyys
t    = 1;



% kutsutaan funktioita

kitkaton(v0,alfa,m,g)
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

sx = v0x * t;
kantama = sx / 1000;
disp ("Kitkaton kantama on:"),disp(kantama)
disp ("km")

%while v0y > -1
%plot(v0x,v0y)

%end

end
function kitkallinen(v0,alfa,m,g,k,t)


%xcom = v0 * cosd(alfa) * e^(k*t);
%ycom = (g/k + v0 * sind(alfa)) * e^(k*t) - g/k;  testailua
%plot(xcom, ycom)


v = v0
x = 0;
y = 0;
kantama_x_kitk = 0;
kantama_y_kitk = 0;

while  y > -1


vx1 = v*cosd(alfa);               % nopeuden x komponentti ajan hetkellä 0
vy1 = v*sind(alfa);               % nopeuden y komponentti ajan hetkellä 0

x = x + vx1;
y = y + vy1;

ax1 = -k*vx1*sqrt(vx1^2+vy1^2);   % kiihtyvyyden x komponentit
ay1 = -g-k*vy1*sqrt(vx1^2+vy1^2); % kiihtyvyyden y komponentit



vx1 = vx1 + ax1 /100;             % nopeuden x komponentti sekunnin jälkeen        miks vitus tää jaetaan huntil??
vy1 = vy1 + ay1 /100;             % nopeuden y komponentti sekunnin jälkeen

%vx1 = vx1 + ax1;                 % nopeuden x komponentti sekunnin jälkeen
%vy1 = vy1 + ay1;                 % nopeuden y komponentti sekunnin jälkeen


x = x + vx1;
y = y + vy1;

kantama_x_kitk = kantama_x_kitk + vx1;    % kantama metreinä nopeude x komponentit laskettuna yhteen
kantama_y_kitk = kantama_y_kitk + vy1;    % kantama metreinä nopeude x komponentit laskettuna yhteen
%v = sqrt(vx1^2+vy1^2)            % nopeus


%alfa = acosd(vx1/v)              % kumpikin toimii
alfa = atand(vy1/vx1);

hold on
  %plot(vx1,vy1)
%plot(x,y)
plot(kantama_x_kitk,kantama_y_kitk)
  %plot(t,ay1)
t = t + 1;

axis([-10 40000 -5000 40000])       % kuvaajan skaalaus/lukitus

end
kantama_x_kitk = kantama_x_kitk/1000;
disp("Kitkallinen kantama on:(km)")
disp(kantama_x_kitk)

end
