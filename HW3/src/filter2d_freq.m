function [output_img] = filter2d_freq(input_img, filter)
[origin_row,origin_col] = size(input_img);
[filter_row, filter_col] = size(filter);
p = origin_row+filter_row;
q = origin_col+filter_col;
padding_img = zeros(p,q);
padding_filter = zeros(p,q);
for x = 1:p
    for y = 1:q
        if (x <= origin_row && y <= origin_col)
            padding_img(x,y) = input_img(x,y);
        end
        if (x <= filter_row && y <= filter_col)
            padding_filter(x,y) = filter(x,y);
        end
        padding_img(x,y) = padding_img(x,y)*((-1)^(x+y));
        padding_filter(x,y) = padding_filter(x,y)*((-1)^(x+y));
    end
end
F = dft2d(padding_img,0);
H = dft2d(padding_filter,0);
G = F .* H;
output_img = real(dft2d(G,1));
for x = 1:p
    for y = 1:q
        output_img(x,y) = output_img(x,y)*((-1)^(x+y));
    end
end
output_img = uint8(output_img(1:origin_row,1:origin_col));
