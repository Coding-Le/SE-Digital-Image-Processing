function [output_img]  = quantize(input_img,level)
output_img = input_img;
[origin_row,origin_col] = size(input_img);
interval = 256/(level-1);
for i = 1:origin_row
    for j = 1:origin_col
        factor = input_img(i,j)/interval;
        factor_int = floor(factor);
        if (factor-factor_int > 0.5)
            factor_int = factor_int+1;
        end
        output_img(i,j) = factor_int*interval;
    end
end
output_img = im2uint8(output_img);