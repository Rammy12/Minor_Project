clc; clear all; close all;


%% Read Image
I=imread('DRIVE/training/images/40_training.tif');
%imshow(I)
% split image I in to 3 channel Red,Green,Blue R G B
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);

%% Show 3 channel RGB on screen
figure('Name','RGB','NumberTitle','off');
subplot(1,4,1);
imshow(I);
title('Original Image');
subplot(1,4,2);
imshow(R);
title('Red Channel Image');
subplot(1,4,3);
imshow(G);
title('Green Channel Image');
subplot(1,4,4);
imshow(B);
title('Blue Channel Image');

%% Read Mask Image and Multiply with Green channel
I_mask=imread('DRIVE/training/mask/40_training_mask.gif');
%imshow(I_mask)
I_mask=imbinarize(I_mask);
I_G_mask=G;
I_G_mask(~I_mask)=0; % Set pixels outside the mask to 0 (black)
%-------------------------------------------------------
figure('Name','Masked Image','NumberTitle','off');
subplot(1,3,1);
imshow(G);
title('Green Channel Image');
subplot(1,3,2);
imshow(I_mask);
title('Mask Image');
subplot(1,3,3);
imshow(I_G_mask);
title('Multiplyed Image');