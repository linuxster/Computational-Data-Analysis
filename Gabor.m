clear all; close all; clc;

%signal to analyze
%domain size
L=10; 
%number fourier modes 
n=2048;
%define linear space domain
%slice it into time slices, from 0 to L in n+1 points periodic boundary
t2=linspace(0,L,n+1); t=t2(1:n);
%k values normalize it in shifted space
k=(2*pi/L)*[0:n/2-1 -n/2:-1];
%unshifted domain
ks=ifftshift(k);

%signal up
S=(3*sin(2*t)+0.5*tanh(0.5*(t-3))+0.28*exp(-(t-4).^2) ...
    +1.5*sin(5*t)+4*cos(3*(t-6).^2))/10+(t/20).^3;
%fourier transform
St=fft(S);

subplot(2,1,1), plot(t,S);
subplot(2,1,2), plot(ks,abs(fftshift(St))/max(abs(fftshift(St))));