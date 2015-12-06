function [output_img]  = dft2d(input_img, flags)
[origin_row,origin_col] = size(input_img);
output_img = zeros(origin_row, origin_col);
F_img = zeros(origin_row, origin_col);
if (flags == 0)
    for x = 0:origin_row-1
        for v = 0:origin_col-1
            sum = 0;
            for y = 0:origin_col-1
                sum = sum + double(input_img(x+1,y+1))*exp(-2*pi*sqrt(-1)*(v*y/origin_col));
            end
            F_img(x+1,v+1) = sum;
        end
    end
    for v = 0:origin_col-1
        for u = 0:origin_row-1
            sum = 0;
            for x = 0:origin_row-1
                sum = sum + double(F_img(x+1,v+1))*exp(-2*pi*sqrt(-1)*(u*x/origin_row));
            end
            output_img(u+1,v+1) = sum;
        end
    end
else if (flags == 1)
        for y = 0:origin_col-1
            for u = 0:origin_row-1
                sum = 0;
                for v = 0:origin_col-1
                    sum = sum + double(input_img(u+1,v+1))*exp(2*pi*sqrt(-1)*(v*y/origin_col));
                end
                F_img(u+1,y+1) = sum;
            end
        end
        for x = 0:origin_row-1
            for y = 0:origin_col-1
                sum = 0;
                for u = 0:origin_row-1
                    sum = sum + double(F_img(u+1,y+1))*exp(2*pi*sqrt(-1)*(u*x/origin_row));
                end
                output_img(x+1,y+1) = sum/(origin_col*origin_row);
            end
        end
        output_img = real(output_img);
    end
end