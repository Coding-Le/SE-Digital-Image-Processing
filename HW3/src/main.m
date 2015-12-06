function main
input_img = imread('24.png');
[input_img_row,input_img_col] = size(input_img);
dft_img = dft2d(input_img,0);  %to get the F(u,v)
fft_img = fft2d(input_img,0);
[fft_row,fft_col] = size(fft_img);

ifft_img = fft2d(fft_img,1);
ifft_img = uint8(ifft_img);
imwrite(ifft_img,'ifft_img.png', 'png');

fft_img = zeros(fft_row,fft_col);

for x = 0:input_img_row-1
    for y = 0:input_img_col-1
        input_img(x+1,y+1) = input_img(x+1,y+1)*((-1)^(x+y));  %move the low frequency to the center
        fft_img(x+1,y+1) = input_img(x+1,y+1);
    end
end
%dft2d
for x = 0:fft_row-1
    for y = 0:fft_col-1
        fft_img(x+1,y+1) = fft_img(x+1,y+1)*((-1)^(x+y));
    end
end

F_img = dft2d(input_img,0);
FF_img = fft2d(fft_img,0);
%get the log of origin matrix and get the lower and upper border
for u = 1:input_img_row
    for v = 1:input_img_col
        F_img(u,v) =  log(abs(F_img(u,v)));
        if (u == 1 && v == 1)
            min = F_img(u,v);
            max = F_img(u,v);
        else
            if (F_img(u,v) < min)
                min = F_img(u,v);
            end
            if (F_img(u,v) > max)
                max = F_img(u,v);
            end
        end
    end
end

%scaling
for u = 1:input_img_row
    for v = 1:input_img_col
        F_img(u,v) = round((F_img(u,v)-min)/(max-min)*255);
    end
end
F_img = uint8(F_img);
imwrite(F_img,'Fourier_spectrum.png','png');  %output the frequency image

for u = 1:fft_row
    for v = 1:fft_col
        FF_img(u,v) =  log(abs(FF_img(u,v)));
        if (u == 1 && v == 1)
            min = FF_img(u,v);
            max = FF_img(u,v);
        else
            if (FF_img(u,v) < min)
                min = FF_img(u,v);
            end
            if (FF_img(u,v) > max)
                max = FF_img(u,v);
            end
        end
    end
end

%scaling
for u = 1:fft_row
    for v = 1:fft_col
        FF_img(u,v) = round((FF_img(u,v)-min)/(max-min)*255);
    end
end
FF_img = uint8(FF_img);
imwrite(FF_img,'fft_Fourier_spectrum.png','png');  %output the frequency image


%idft2d
idft_img = dft2d(dft_img,1); %change the F(u,v) to f(x,y)
idft_img = uint8(idft_img);
imwrite(idft_img, 'idft_img.png', 'png');


for x = 1:input_img_row
    for y = 1:input_img_col
        idft_img(x,y) = abs(idft_img(x,y))*((-1)^(x+y)); %move the center back
    end
end

origin_img = imread('24.png');
filter_7_7 = ones(7,7)/49;
image_ave_7_7 = filter2d_freq(origin_img, filter_7_7);
imwrite(image_ave_7_7,'image_ave_7_7.png','png');

filter_laplace = [1,1,1;1,-8,1;1,1,1];
image_laplace = filter2d_freq(origin_img, filter_laplace);
imwrite(image_laplace,'image_laplace.png','png');







