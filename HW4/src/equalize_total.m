function [output_img]  = equalize_total(input_img)
[origin_row, origin_col,level] = size(input_img);
gray_level_distribute = zeros(256,level);

for i = 1:origin_row
    for j = 1:origin_col
        for k = 1:level
            gray_level_distribute(round(input_img(i, j, k))+1,k) = gray_level_distribute(round(input_img(i, j, k))+1,k)+1;
        end
    end
end
for i = 1:256
    for k = 1:level
        gray_level_distribute(i,k) = gray_level_distribute(i,k)/(origin_row*origin_col);
    end
end

histogram_distribute = zeros(256);
for i = 1:256
    temp_sum = 0;
    for j = 1:level
        temp_sum = temp_sum + gray_level_distribute(i,j);
    end
    histogram_distribute(i) = temp_sum/level;
end

sum = 0;
for i = 1:256
    sum = sum+histogram_distribute(i);
    histogram_distribute(i) = sum;
end

output_img = zeros(origin_row, origin_col,level);

for i = 1:256
    histogram_distribute(i) = round(histogram_distribute(i)*255)+1;
end

for i = 1:origin_row
    for j = 1:origin_col
        for k = 1:level
            output_img(i,j,k) = histogram_distribute(input_img(i,j,k)+1);
        end
    end
end

output_img = uint8(output_img);



