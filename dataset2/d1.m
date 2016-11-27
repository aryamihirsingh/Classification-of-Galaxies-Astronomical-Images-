clc;
clear all;
% imset = imageSet('./e1');
% for i=1:imset.Count
%     x = read(imset,i);
x = imread('./e1/e1_1.jpg');
x = rgb2gray(x);
se = strel('disk',5);
op = imopen(x,se);
opcl = imclose(op,se);
cl = imclose(x,se);
clop = imopen(cl,se);
occo = (opcl + clop)/2;
occo = imgaussfilt(occo);
% imshow(occo);
h = imhist(occo);
th = sum(h)/255;
% th = uint8(th);
level = th / 255;
bw = im2bw(occo,level);
bw = imopen(bw,se);
cc = bwconncomp(bw);
% cc = uint8(cc);
% cc = 255 .* cc;
ch = bwconvhull(bw,'objects',8);
imshow(bw);
% end