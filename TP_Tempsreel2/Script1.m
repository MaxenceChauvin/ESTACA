clc
close all
clear all

Force = 1250;
m = 1000;
b = 50;

sim("Part1.slx")


figure
hold on
plot(ans.tout,ans.V);
xlabel("Temps en s")
ylabel("Vitesse en km/h")

V = 90;

sim("Part1_2.slx")

plot(ans.tout,ans.V);

sim("Part1_3.slx")
figure
plot(ans.tout,ans.Force);
xlabel("Temps en s");
ylabel("Force en N");

figure
plot(ans.tout,ans.Power);
xlabel("Temps en s");
ylabel("Puissance en Watt");

numpi = [333.33 16.66];
denpi = [1 0];
C= tf(numpi,denpi);
Te = 3/5;

Cd = c2d(C,Te,'tustin')
bode(Cd,C);

num = [1];
den = [1000 50];
model = tf(num,den);

modeld = c2d(model,Te,'zoh');
step(model,modeld);

sim("Part2.slx")

figure
plot(ans.tout,ans.V);
xlabel("Temps en s")
ylabel("Vitesse en km/h")


