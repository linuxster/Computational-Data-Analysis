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

%create filter width
width=1;
slide=0:0.1:10;

for j=1:length(slide)
   %simple gaussian filter centered at 4
   f=exp(-width*(t-slide(j)).^2); 
   
   %signal time filter
   Sf=f.*S;
   %what is energy content I just filtered in my little window
   Sft=fft(Sf);
   
   
   %plot signal and filter
   subplot(3,1,1), plot(t,S,'k',t,f,'m');
   %plot filtered signal
   subplot(3,1,2), plot(t,Sf,'k');
   %plot fourier transform of that ks vs. 
   subplot(3,1,3), plot(ks,abs(fftshift(Sft))/max(abs(fftshift(Sft))))
   axis([-60 60 0 1])
   drawnow
   pause(0.1)
end
