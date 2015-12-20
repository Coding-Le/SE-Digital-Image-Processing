function [output_img]  = equalize_hist(input_img)
gray_level_distribute = 0:255;
for i = 1:256
    gray_level_distribute(i) = 0; 
end
[origin_row, origin_col] = size(input_img);
for i = 1:origin_row
    for j = 1:origin_col
        gray_level_distribute(round(input_img(i, j))+1) = gray_level_distribute(round(input_img(i, j))+1)+1;
    end
end
x_axis = 0:255;
for i = 1:256
    gray_level_distribute(i) = gray_level_distribute(i)/(origin_row*origin_col);
end
sum = 0;
histogram_distribute = zeros(256);
for i = 1:256
    histogram_distribute(i) = gray_level_distribute(i);
end
for i = 1:256
    sum = sum+histogram_distribute(i);
    histogram_distribute(i) = sum;
end
total = 0;
for i = 1:256
    total = total+histogram_distribute(i);
end
output_img = zeros(origin_row, origin_col);
for i = 1:256
    histogram_distribute(i) = round(histogram_distribute(i)*255)+1;
end
out_distribute = 0:255;
for i = 1:origin_row
    for j = 1:origin_col
        output_img(i,j) = histogram_distribute(input_img(i,j)+1);
        out_distribute(output_img(i,j)) = out_distribute(output_img(i,j))+1;
    end
end
for i = 1:256
    out_distribute(i) = out_distribute(i)/(origin_row*origin_col);
end
output_img = uint8(output_img);