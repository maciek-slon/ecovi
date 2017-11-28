close all;

I=imread('door.jpg');
I=rgb2gray(I);

%F1=[1 0; 0 -1];
%F2=[0 1; -1 0];

%F1=[-3 0 3; -10 0 10; -3 0 3];
%F2=F1';

F1=[-1 0 1; -2 0 2; -1 0 1];
F2=F1';

Gx = conv2(I, F1);
Gy = conv2(I, F2);

G = sqrt( Gx.^2 + Gy.^2 );

figure;
imshow(rescale(Gx));

figure;
imshow(rescale(Gy));

figure;
imshow(rescale(G));

figure;
%%
BW=G>212;

imshow(BW);