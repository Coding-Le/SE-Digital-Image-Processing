function [output_img]  = filter2d(input_img, filter)
[origin_row, origin_col] = size(input_img);
[filter_row, filter_col] = size(filter);
expand_img = zeros(origin_row+filter_row-1,origin_col+filter_col-1);
%a = expand_img((filter_row+1)/2:((filter_row+1)/2+origin_row-1),filter_col+1)/2:((filter_col+1)/2+origin_col-1);
for i = (filter_row+1)/2:((filter_row+1)/2+origin_row-1)
    for j = (filter_col+1)/2:((filter_col+1)/2+origin_col-1)
        expand_img(i,j) = input_img(i-(filter_row-1)/2, j-(filter_col-1)/2);
    end
end
output_img = zeros(origin_row, origin_col);
for i = (filter_row+1)/2:((filter_row+1)/2+origin_row-1)
    for j = (filter_col+1)/2:((filter_col+1)/2+origin_col-1)
        x1 = i-(filter_row-1)/2;
        x2 = i+(filter_row-1)/2;
        y1 = j-(filter_col-1)/2;
        y2 = j+(filter_col-1)/2;
        temp = expand_img(x1:x2,y1:y2);
        temp = temp.*filter;
        temp = sum(temp);
        temp = temp';
        total = sum(temp);
        output_img(i-(filter_row-1)/2, j-(filter_col-1)/2) = total;
    end
end
output_img = uint8(output_img);
