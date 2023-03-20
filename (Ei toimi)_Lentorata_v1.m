
function  BS_main

v0   = 100;    % (m/s) Lähtönopeus 100ms jälkeen alkaa sekoileen
alfa = 35      % (deg) Kulma ajanhetkellä 0
m    = 46.4    % (kg)  Massa (K307, BB/HE 155 mm)
k    = 0.0055; % Kappaleen ilmanvastusvakio
g    = 9.81;   % (m/s^2) Gravitaatiovakio



% kutsutaan funktioita
%kitkaton(v0,alfa,m,g)
kitkallinen(v0,alfa,g,k)

end

function kitkaton(v0,alfa,m,g)

% lasketaan nopeuden x ja y komponentit
v0x = v0 * cosd(alfa)
v0y = v0 * sind(alfa)



% kappaleen nousuaika
tn = (v0*sind(alfa))/g

% kappaleen lento aika = tn * 2
t = 2 * tn


% kappaleen liike x suunnassa
sx = v0x * t;
kantama = sx / 1000;
disp ("Kitkaton kantama on:(km)"),disp(kantama)
disp ("km")



end
function kitkallinen(v0,alfa,g,k)


v = v0
x = 1;
y = 1;
kantama_x_kitk = 0;
kantama_y_kitk = 0;
tl=1;


while  y >0

vx1 = v*cosd(alfa)                           % nopeuden x komponentti ajan hetkellä 0
vy1 = v*sind(alfa)                           % nopeuden y komponentti ajan hetkellä 0

%x = x + vx1     % 0 + 26 = 26
%y = y + vy1     % 0 + 23 = 23

ax1 = (-k*vx1)*sqrt(vx1^2+vy1^2)   %-4.9     % kiihtyvyyden x komponentit 
ay1 = -g-(k*vy1)*sqrt(vx1^2+vy1^2) %-14      % kiihtyvyyden y komponentit

vx1 = vx1 + ax1
vy1 = vy1 + ay1

%vx1 = vx1 + ax1 /100;                      % nopeuden x komponentti sekunnin jälkeen
%vy1 = vy1 + ay1 /100;                      % nopeuden y komponentti sekunnin jälkeen

%vx1 = sqrt(vx1^2 + ax1^2); % 21            % nopeuden x komponentti sekunnin jälkeen
%vy1 = sqrt(vy1^2 + ay1^2); % 18


x = x + vx1
y = y + vy1
disp("Kierros")

kantama_x_kitk = kantama_x_kitk + vx1;    % kantama metreinä nopeude x komponentit laskettuna yhteen
kantama_y_kitk = kantama_y_kitk + vy1;    % kantama metreinä nopeude x komponentit laskettuna yhteen


alfa = atand(vy1/vx1);

% lento aika
tl = tl+1;

hold on
%plot(kantama_x_kitk,kantama_y_kitk)
plot(x,y)

%axis([-10 40000 -5000 40000])             % kuvaajan skaalaus
axis([-10 200 -0 200])
end

kantama_x_kitk = kantama_x_kitk/1000;
disp("Kitkallinen kantama on:(km)")
disp(kantama_x_kitk)
%tl = tl/60;
disp(tl)
%disp(y)
disp(x)
end
