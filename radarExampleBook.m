clear all; close all;

L=30; % time slot to transform
n=512; % number of Fourier modes 2^9
t2=linspace(-L,L,n+1); t=t2(1:n); % time discretization
k=(2*pi/(2*L))*[0:(n/2-1) -n/2:-1]; % frequency components of FFT
u=sech(t); % ideal signal in the time domain 
figure(1), subplot(3,1,1), plot(t,u,'k'), hold on
%adding white noise
noise=10;
ut=fft(u); 
%utn=ut+noise*(randn(1,n)+i*randn(1,n));
%un=ifft(utn);
%figure(1), subplot(3,1,2), plot(t,abs(un),'k'), hold on
unt=ut+noise*(randn(1,n)+i*randn(1,n)); 
un=ifft(unt);

%then apply the filter
filter=exp(-0.2*(k).^2); 
unft=filter.*unt; unf=ifft(unft);

subplot(2,1,1), plot(t,abs(un),'k')
axis([-30 30 0 2])
xlabel('time (t)'), ylabel('|u|')
subplot(2,1,2) 
plot(fftshift(k),abs(fftshift(unt))/max(abs(fftshift(unt))),'k') 
axis([-25 25 0 1])
xlabel('wavenumber (k)', ylabel('|ut|/max(|ut|)'));