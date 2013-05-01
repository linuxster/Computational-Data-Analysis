%NOTES FROM LECTURE 1

clear all; close all; clc;

L=20;
n=128;

x2=linspace(-L/2, L/2,n+1); x=x2(1:n);

% Need to convert my 2pi fft domain into my x function domain
%wave number = k, need to get my L domain into 2pi domain
%k needs to be shifted when we plot it as well.
k=(2*pi/L)*[0:n/2-1 -n/2:-1];

%simple Gaussian function
%u=exp(-x.^2);
u=sech(x);
ud=-sech(x).*tanh(x);
ud2=sech(x)-2*sech(x).^3;

%plot gaussian
%plot(x,u);

%fast fourier transform of my Gaussian function, careful it shifts!
ut=fft(u);

%first dirivative
uds=ifft((i*k).*ut );

%second derivative
u2ds=ifft( (i*k).^2.*ut);



%plot(ut);
%shifts it back and change -1 to 1, butterfly algorithm, look at spectral
%value (frequency content) you need to shift and take abs value.
%plot now spectral & frequency content of the Gaussian, tells me the
%strength of all this frequency content.
ka=fftshift(k);
%plot(fftshift(k),abs(fftshift(ut)));
%plot approximation
plot(x,ud,'r',x,uds,'mo');



%differentiate a function.
