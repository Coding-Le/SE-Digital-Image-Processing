function [output_img] = fft2d(input_img, flags)
[origin_row,origin_col] = size(input_img);
[input_row,input_col] = size(input_img);

times = 0;
while(origin_row > 1)
    times = times+1;
    origin_row = origin_row/2;
end
origin_row = 2^times;
times = 0;
while(origin_col > 1)
    times = times+1;
    origin_col = origin_col/2;
end
origin_col = 2^times;

output_img = zeros(origin_row,origin_col);

for i = 1:input_row
    for j = 1:input_col
        output_img(i,j) = input_img(i,j);
    end
end

if (flags == 0)
    for x = 0:origin_row-1
        output_img(x+1,:) = recur(output_img(x+1,:));
    end
    for v = 0:origin_col-1
        output_img(:,v+1) =  recur(output_img(:,v+1)')';
    end
else if (flags == 1)
        output_img = conj(output_img);
        output_img = fft2d(output_img, 0);
        output_img = conj(output_img)/(origin_row*origin_col);
        output_img = real(output_img);
    end
end





