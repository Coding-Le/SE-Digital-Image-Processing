function [output_img]  = scale_size(input_img, my_size)
target_row = my_size(2);
target_col = my_size(1);
%output_img = zeros(target_row, target_col);
[origin_row,origin_col] = size(input_img);
row_factor = origin_row/target_row;
col_factor = origin_col/target_col;
pre_matrix = zeros(target_row, origin_row);
post_matrix = zeros(origin_col, target_col);
if ((mod(origin_row, target_row) == 0) && (mod(origin_col, target_col) == 0)) %this is the down sampling
    position = 1;
    for i = 1:target_row                        %ǰ�þ���
        for j = 1:row_factor
            pre_matrix(i, position) = 1/row_factor;
            position = position+1;
        end
    end
    position = 1;
    for i = 1:target_col                        %���þ���
        %post_matrix(position, i) = 1;
        for j = 1:col_factor
            post_matrix(position, i) = 1/col_factor;
            position = position+1;
        end
    end
    input_img = double(input_img);
    output_img = pre_matrix*input_img*post_matrix;
    output_img = uint8(output_img);
end