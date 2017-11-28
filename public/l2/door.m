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
imshow(I)
G = sqrt( Gx.^2 + Gy.^2 );


% figure;
% imshow(rescale(Gx));
% 
% figure;
% imshow(rescale(Gy));
% 
% figure;
% imshow(rescale(G));

figure;
BW=(G>250)*1;

imshow(BW);

figure;
[H,T,R] = hough(BW);
P  = houghpeaks(H,20, 'Threshold',350);
imshow(H,[0, 100],'XData',T,'YData',R,'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
plot(T(P(:,2)),R(P(:,1)),'s','color','red');

theta = T(P(:,2));
rho = R(P(:,1));

theta = theta * pi / 180;
a = -cot(theta);
b = rho ./ sin(theta);

y1 = b;
y2 = a*800 + b;

figure;
imshow(I);
hold on;
for i=1:size(theta,2)
    line([0 800], [y1(i) y2(i)], 'Color', 'red', 'LineWidth', 2);
end

% 
% lines = houghlines(BW,T,R,P,'FillGap',5,'MinLength',7);
% figure, imshow(I), hold on
% max_len = 0;
% for k = 1:length(lines)
%    xy = [lines(k).point1; lines(k).point2];
%    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
% 
%    % Plot beginnings and ends of lines
%    plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
%    plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
% 
%    % Determine the endpoints of the longest line segment
%    len = norm(lines(k).point1 - lines(k).point2);
%    if ( len > max_len)
%       max_len = len;
%       xy_long = xy;
%    end
% end