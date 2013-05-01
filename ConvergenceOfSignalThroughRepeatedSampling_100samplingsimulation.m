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


%subplot(2,1,1), plot(t,u,'r', t, abs(un),'k')
%subplot(2,1,2), plot(ks, abs(fftshift(ut)),'r',ks,abs(fftshift(utn)))

noise=30;
ave=zeros(1,n);
%repeated sampling
realizations=100;
for j=1:realizations
    utn=ut+noise*(randn(1,n)+1i*randn(1,n));
    ave=ave+utn;
    ave2=abs(fftshift(ave))/j;
plot(ks,abs(fftshift(ut)),'r',ks,ave2,'k');
pause(0.5)

end

