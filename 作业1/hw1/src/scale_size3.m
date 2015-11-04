function [output_img]  = scale_size3(input_img, my_size)
target_row = my_size(2);
target_col = my_size(1);
input_img = im2double(input_img);
[origin_row,origin_col] = size(input_img);
row_factor = origin_row/target_row;
col_factor = origin_col/target_col;
    output_img = zeros(target_row, target_col);
    for i = 1:target_row
        for j = 1:target_col
            position_x = row_factor*i;
            position_y = col_factor*j;
            x1 = floor(position_x);
            y1 = floor(position_y);
            if (x1 < 1)
                x1 = x1+1;
            end
            if (y1 < 1)
                y1 = y1+1;
            end
            if (x1+1 > origin_row)
                x1 = x1-1;
            end
            if (y1+1 > origin_col)
                y1 = y1-1;
            end
            if (x1+1 <= origin_row && y1+1 <= origin_col && x1 >=1 && y1 >= 1)    %双线性插值方法，将距离最近四个点的灰度平均值作为目标矩阵对应点灰度的最终值
                w = position_x-x1;                                
                h = position_y-y1;
                temp1 = w*input_img(x1+1,y1)+(1-w)*input_img(x1,y1);
                temp2 = w*input_img(x1+1,y1+1)+(1-w)*input_img(x1,y1+1);
                output_img(i, j) = (1-h)*temp1+h*temp2;
            end
        end
    end
    output_img = im2uint8(output_img);
end