clear all; close all; clc

A=imread('myFace','jpeg');
Abw=rgb2gray(A);

Abw=double(Abw(600:-1:1,:)) %converts from uint8 to double
%add noise
Abwn=Abw+50*randn(600,1080);

figure(1)
pcolor(Abwn), shading interp, colormap(hot)

figure(2)
Abwt=fft2(Abwn);
pcolor(log(abs(fftshift(Abwt)))), shading interp, colormap(hot)
%pcolor(abs(fftshift(Abwt))), shading interp, colormap(hot)