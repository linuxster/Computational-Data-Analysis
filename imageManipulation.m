clear all; close all; clc

A=imread('myFace','jpeg');
Abw=rgb2gray(A);

Abw=double(Abw(600:-1:1,:)) %converts from uint8 to double

figure(1)
pcolor(Abw), shading interp, colormap(hot)

figure(2)
Abwt=fft2(Abw);
%pcolor(log(abs(fftshift(Abwt)))), shading interp, colormap(hot)
pcolor(abs(fftshift(Abwt))), shading interp, colormap(hot)