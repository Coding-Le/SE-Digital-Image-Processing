function main
%the down-scale to 192*128, 96*64, 48*32, 24*16 and 12*8, using the method
%of multiplying two matrix
origin_img = imread('24.png');
figure_192_128 = scale_size(origin_img, [192, 128]);
figure_96_64 = scale_size(origin_img, [96, 64]);
figure_48_32 = scale_size(origin_img, [48, 32]);
figure_24_16 = scale_size(origin_img, [24, 16]);
figure_12_8 = scale_size(origin_img, [12, 8]);
imwrite(figure_192_128, 'figure_192_128.jpg');
imwrite(figure_96_64, 'figure_96_64.jpg');
imwrite(figure_48_32, 'figure_48_32.jpg');
imwrite(figure_24_16, 'figure_24_16.jpg');
imwrite(figure_12_8, 'figure_12_8.jpg');

%the down-scale to 300*200, 450*300, 500*200 using the methods of the
%bilinear interpolation algorithm, this method can also be used to solve
%problem 1(like down-scale to 192*128)
figure_300_200 = scale_size3(origin_img, [300, 200]);
figure_450_300 = scale_size3(origin_img, [450, 300]);
figure_500_200 = scale_size3(origin_img, [500, 200]);
imwrite(figure_300_200, 'figure_300_200.jpg');
imwrite(figure_450_300, 'figure_450_300.jpg');
imwrite(figure_500_200, 'figure_500_200.jpg');

%the quantization part, generating the image with given gray level, reduce 
%gray level resolution to 128; 32; 8; 4 and 2 levels.
figure_128_level = quantize(origin_img,128);
figure_32_level = quantize(origin_img,32);
figure_8_level = quantize(origin_img,8);
figure_4_level = quantize(origin_img,4);
figure_2_level = quantize(origin_img,2);
imwrite(figure_128_level, 'figure_128_level.jpg');
imwrite(figure_32_level, 'figure_32_level.jpg');
imwrite(figure_8_level, 'figure_8_level.jpg');
imwrite(figure_4_level, 'figure_4_level.jpg');
imwrite(figure_2_level, 'figure_2_level.jpg');

