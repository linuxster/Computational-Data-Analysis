clear all; close all; clc;

T=30; %sample signal for 30 seconds
n=512; %how many points

t2=linspace(-T/2,T/2,n+1); t=t2(1:n); %512 + 1 points, last point is same as first

%below tells you the frequency components b/c fft things you are working on
%a 2pi periodic domain
k=(2*pi/T)*[0:n/2-1 -n/2:-1];
%fft shifts things so we have to shif back
ks=fftshift(k);
%here is our function
u=sech(t);

%now lets fft this sucka
ut=fft(u);
%add to every frequency component a little noise, to real and complex part.
noise=20;
utn=ut+noise*(randn(1,n)+i*randn(1,n));
%look at this noisy signal in time domain
un=ifft(utn);

subplot(2,1,1), plot(t,u,'r', t, abs(un),'k')
subplot(2,1,2), plot(ks, abs(fftshift(ut)),'r',ks,abs(fftshift(utn)))