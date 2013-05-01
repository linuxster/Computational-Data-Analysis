clear all; close all; clc;

T=30;
n=512;

t2=linspace(-T/2,T/2,n+1); t=t2(1:n);

%below tells you the frequency components
k=(2*pi/T)*[0:n/2-1 -n/2:-1];
ks=fftshift(k);
u=sech(t);

%now lets fft this sucka
ut=fft(u);
%add to every frequency component a little noise, to real and complex part.
noise=20;
utn=ut+noise*(randn(1,n)+i*randn(1,n));
%look at it in time domain
un=ifft(utn);

%build our Guissian filter
filter=exp(-k.^2);
%shift my filter
%filter=exp(-(k+15).^2);
utnf=filter.*utn;
unf=ifft(utnf);




%subplot(2,1,1), plot(t,u,'k',t,abs(un),'m', t, abs(unf),'g');
subplot(2,1,1), plot(t,abs(unf),'g',t,0*t+0.5,'k:');
axis([-15 15 0 1]);
subplot(2,1,2), plot(ks,abs(fftshift(ut))/max(abs(fftshift(ut))),'k',...
    ks,abs(fftshift(utn))/max(abs(fftshift(utn))),'m', ...
    ks,fftshift(filter),'b',...
    ks,abs(fftshift(utnf))/max(abs(fftshift(utnf))),'g')
axis([-25 25 0 1]);