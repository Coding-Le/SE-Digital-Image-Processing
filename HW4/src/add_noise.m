function [output_img]  = add_noise(input_img, type, MeanOrSalt, VariOrPepper)
[origin_row,origin_col] = size(input_img);
output_img = input_img;
if (type == 1)       %Gaussian noise,Box-Muller method
    mean_value = MeanOrSalt;
    variance = VariOrPepper;
    matrix1 = rand(origin_row,origin_col/3,3);
    matrix2 = rand(origin_row,origin_col/3,3);
    noise_matrix = variance*sqrt(-2*log(matrix1)).*cos(2*pi*matrix2)+mean_value;
    output_img = uint8(double(output_img)+noise_matrix);
else if(type == 2)   %Salt and Pepper noise
        salt_probability = MeanOrSalt;
        pepper_probability = VariOrPepper;
        total_probability = salt_probability+pepper_probability;
        noise_matrix = rand(origin_row,origin_col) < total_probability;
        probability_matrix = rand(origin_row,origin_col) < salt_probability/total_probability;
        salt_matrix = noise_matrix&probability_matrix;
        pepper_matrix = noise_matrix&(~probability_matrix);
        output_img(salt_matrix) = 255;
        output_img(pepper_matrix) = 0;
    end
end
output_img = uint8(output_img);