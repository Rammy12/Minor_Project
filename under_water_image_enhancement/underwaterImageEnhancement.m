clc; clear; close all;

%% Read Image
% Read the input underwater image
img = imread('images/image1.jpg');
img = im2double(img); % Convert to double precision for processing
% Convert to YIQ and HSI color spaces
yiq_img = rgb2yiq(img);
hsi_img = rgb2hsi(img);

% Apply CLAHE to Y (luminance) in YIQ
yiq_img(:,:,1) = adapthisteq(yiq_img(:,:,1));

% Apply CLAHE to Intensity in HSI
hsi_img(:,:,3) = adapthisteq(hsi_img(:,:,3));

% Convert back to RGB
enhanced_rgb_yiq = yiq2rgb(yiq_img);
enhanced_rgb_hsi = hsi2rgb(hsi_img);

% Fusion of enhanced images (Weighted Averaging)
fused_img = (enhanced_rgb_yiq + enhanced_rgb_hsi) / 2;

%% Display Results
figure;
subplot(1,3,1); imshow(img); title('Original Image');
subplot(1,3,2); imshow(enhanced_rgb_yiq); title('Enhanced in YIQ');
subplot(1,3,3); imshow(enhanced_rgb_hsi); title('Enhanced in HSI');

figure;
imshow(fused_img); title('Final Enhanced Image');