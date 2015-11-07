function main  %invoke equalize_hist¡¢filter2d

input_img = imread('24.png');
equalize_img = equalize_hist(input_img);
imwrite(equalize_img, 'equalize_img.png', 'png');

filter_aver_3_3 = ones(3,3);
filter_aver_3_3 = filter_aver_3_3/9;
average_3_3_img = filter2d(input_img, filter_aver_3_3);
imwrite(average_3_3_img, 'average_3_3_img.png', 'png');

filter_aver_7_7 = ones(7,7);
filter_aver_7_7 = filter_aver_7_7/(7*7);
average_7_7_img = filter2d(input_img, filter_aver_7_7);
imwrite(average_7_7_img, 'average_7_7_img.png', 'png');

filter_aver_11_11 = ones(11,11);
filter_aver_11_11 = filter_aver_11_11/(11*11);
average_11_11_img = filter2d(input_img, filter_aver_11_11);
imwrite(average_11_11_img, 'average_11_11_img.png', 'png');

laplace_filter = [1,1,1,1,-8,1,1,1,1];
sharpen_img = filter2d(input_img, laplace_filter);
imwrite(sharpen_img, 'sharpen_img.png', 'png');

g_mask_img = input_img-average_3_3_img;
g_img = input_img+3*g_mask_img;
imwrite(g_img, 'g_img.png', 'png');



