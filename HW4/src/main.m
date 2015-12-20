function main
%task1
task_1_img = imread('task_1.png');
%arithmetic mean filter
filter_3_3 = 1/9*ones(3,3);
arithmetic_3_3_img = mean_filter(task_1_img, filter_3_3, 0);
imwrite(arithmetic_3_3_img,'arithmetic_3_3_img.png','png');

filter_9_9 = 1/81*ones(9,9);
arithmetic_9_9_img = mean_filter(task_1_img, filter_9_9, 0);
imwrite(arithmetic_9_9_img,'arithmetic_9_9_img.png','png');
%harmonic mean filter
harmonic_3_3_img = mean_filter(task_1_img, filter_3_3, 1);
imwrite(harmonic_3_3_img,'harmonic_3_3_img.png','png');

harmonic_9_9_img = mean_filter(task_1_img, filter_9_9, 1);
imwrite(harmonic_9_9_img,'harmonic_9_9_img.png','png');
%contraharmonic mean
contraharmonic_3_3_img = mean_filter(task_1_img, filter_3_3, 2);
imwrite(contraharmonic_3_3_img,'contraharmonic_3_3_img.png','png');

contraharmonic_9_9_img = mean_filter(task_1_img, filter_9_9, 2);
imwrite(contraharmonic_9_9_img,'contraharmonic_9_9_img.png','png');

%task2
task_2_img = imread('task_2.png');
%Gaussian noise
Gaussian_polluted_img = add_noise(task_2_img, 1, 0, 40);
imwrite(Gaussian_polluted_img, 'Gaussian_polluted_img.png','png');
r_polluted_img = Gaussian_polluted_img(:,:,1);
g_polluted_img = Gaussian_polluted_img(:,:,2);
b_polluted_img = Gaussian_polluted_img(:,:,3);
%denoise Gaussian with arithmetic filter
Gaussian_arithmetic_img(:,:,1) = mean_filter(r_polluted_img, filter_3_3, 0);
Gaussian_arithmetic_img(:,:,2) = mean_filter(g_polluted_img, filter_3_3, 0);
Gaussian_arithmetic_img(:,:,3) = mean_filter(b_polluted_img, filter_3_3, 0);
imwrite(Gaussian_arithmetic_img, 'Gaussian_arithmetic_img.png','png');
%denoise Gaussian with geometric filter
Gaussian_geometric_img(:,:,1) = mean_filter(r_polluted_img, filter_3_3, 3);
Gaussian_geometric_img(:,:,2) = mean_filter(g_polluted_img, filter_3_3, 3);
Gaussian_geometric_img(:,:,3) = mean_filter(b_polluted_img, filter_3_3, 3);
imwrite(Gaussian_geometric_img, 'Gaussian_geometric_img.png','png');
%denoise Gaussian with median filter
Gaussian_median_img(:,:,1) = mean_filter(r_polluted_img, filter_3_3, 4);
Gaussian_median_img(:,:,2) = mean_filter(g_polluted_img, filter_3_3, 4);
Gaussian_median_img(:,:,3) = mean_filter(b_polluted_img, filter_3_3, 4);
imwrite(Gaussian_median_img, 'Gaussian_median_img.png','png');
%only salt noise
salt_polluted_img = add_noise(task_2_img, 2, 0.2, 0);
imwrite(salt_polluted_img, 'salt_polluted_img.png','png');
r_salt_img = salt_polluted_img(:,:,1);
g_salt_img = salt_polluted_img(:,:,2);
b_salt_img = salt_polluted_img(:,:,3);
%denoise salt noise with harmonic filter
salt_harmonic_img(:,:,1) =  mean_filter(r_salt_img,filter_3_3,1);
salt_harmonic_img(:,:,2) =  mean_filter(g_salt_img,filter_3_3,1);
salt_harmonic_img(:,:,3) =  mean_filter(b_salt_img,filter_3_3,1);
imwrite(salt_harmonic_img, 'salt_harmonic_img.png','png');
%denoise salt noise with contraharmonic filter
salt_contraharmonic_img(:,:,1) =  mean_filter(r_salt_img,filter_3_3,2);
salt_contraharmonic_img(:,:,2) =  mean_filter(g_salt_img,filter_3_3,2);
salt_contraharmonic_img(:,:,3) =  mean_filter(b_salt_img,filter_3_3,2);
imwrite(salt_contraharmonic_img, 'salt_contraharmonic_img.png','png');
%salt-and-pepper noise
salt_perper_polluted_img = add_noise(task_2_img, 2, 0.2, 0.2);
imwrite(salt_perper_polluted_img, 'salt_perper_polluted_img.png','png');
r_salt_perper_img = salt_perper_polluted_img(:,:,1);
g_salt_perper_img = salt_perper_polluted_img(:,:,2);
b_salt_perper_img = salt_perper_polluted_img(:,:,3);
%denoise salt-and-pepper noise with arithmetic filter
salt_perper_arithmetic_img(:,:,1) = mean_filter(r_salt_perper_img, filter_3_3, 0);
salt_perper_arithmetic_img(:,:,2) = mean_filter(g_salt_perper_img, filter_3_3, 0);
salt_perper_arithmetic_img(:,:,3) = mean_filter(b_salt_perper_img, filter_3_3, 0);
imwrite(salt_perper_arithmetic_img, 'salt_perper_arithmetic_img.png','png');
%denoise salt-and-pepper noise with geometric filter
salt_perper_geometric_img(:,:,1) = mean_filter(r_salt_perper_img, filter_3_3, 3);
salt_perper_geometric_img(:,:,2) = mean_filter(g_salt_perper_img, filter_3_3, 3);
salt_perper_geometric_img(:,:,3) = mean_filter(b_salt_perper_img, filter_3_3, 3);
imwrite(salt_perper_geometric_img, 'salt_perper_geometric_img.png','png');
%denoise salt-and-pepper noise with median filter
salt_perper_median_img(:,:,1) = mean_filter(r_salt_perper_img, filter_3_3, 4);
salt_perper_median_img(:,:,2) = mean_filter(g_salt_perper_img, filter_3_3, 4);
salt_perper_median_img(:,:,3) = mean_filter(b_salt_perper_img, filter_3_3, 4);
imwrite(salt_perper_median_img, 'salt_perper_median_img.png','png');
%denoise salt-and-pepper noise with max filter
salt_perper_max_img(:,:,1) = mean_filter(r_salt_perper_img, filter_3_3, 5);
salt_perper_max_img(:,:,2) = mean_filter(g_salt_perper_img, filter_3_3, 5);
salt_perper_max_img(:,:,3) = mean_filter(b_salt_perper_img, filter_3_3, 5);
imwrite(salt_perper_max_img, 'salt_perper_max_img.png','png');
%denoise salt-and-pepper noise with min filter
salt_perper_min_img(:,:,1) = mean_filter(r_salt_perper_img, filter_3_3, 6);
salt_perper_min_img(:,:,2) = mean_filter(g_salt_perper_img, filter_3_3, 6);
salt_perper_min_img(:,:,3) = mean_filter(b_salt_perper_img, filter_3_3, 6);
imwrite(salt_perper_min_img, 'salt_perper_min_img.png','png');

%Histogram Equalization on Color Images
color_img = imread('24.png');
r_img = color_img(:,:,1);
g_img = color_img(:,:,2);
b_img = color_img(:,:,3);
histogram_r = equalize_hist(r_img);
histogram_g = equalize_hist(g_img);
histogram_b = equalize_hist(b_img);
separate_img = color_img;
separate_img(:,:,1) = histogram_r;
separate_img(:,:,2) = histogram_g;
separate_img(:,:,3) = histogram_b;
imwrite(separate_img,'separate_img.png','png');

total_img = equalize_total(color_img);
imwrite(total_img,'total_img.png','png');












