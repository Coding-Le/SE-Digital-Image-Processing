 function [output_img]  = mean_filter(input_img, filter, type)
[origin_row, origin_col] = size(input_img);
[filter_row, filter_col] = size(filter);
expand_img = zeros(origin_row+filter_row-1,origin_col+filter_col-1);
output_img = zeros(origin_row, origin_col);
Q = 1.5;
for i = (filter_row+1)/2:((filter_row+1)/2+origin_row-1)
    for j = (filter_col+1)/2:((filter_col+1)/2+origin_col-1)
        expand_img(i,j) = input_img(i-(filter_row-1)/2, j-(filter_col-1)/2);
    end
end
if (type == 0)                              %arithmetic mean filter
    output_img = filter2d(input_img,filter);
else if (type == 1)                         %harmonic mean filter
        for i = (filter_row+1)/2:((filter_row+1)/2+origin_row-1)
            for j = (filter_col+1)/2:((filter_col+1)/2+origin_col-1)
                x1 = i-(filter_row-1)/2;
                x2 = i+(filter_row-1)/2;
                y1 = j-(filter_col-1)/2;
                y2 = j+(filter_col-1)/2;
                temp = expand_img(x1:x2,y1:y2);
                temp = 1./temp;
                temp = sum(temp);
                temp = temp';
                total = sum(temp);
                output_img(x1, y1) = (filter_row*filter_col)/total;
                %temp_matrix = expand_img(x1:x2,y1:y2);
                %output_img(x1,y1) = prod(temp_matrix(:))^(1/numel(temp_matrix));
            end
        end
    else if (type == 2)                        %contraharmonic mean filter
            for i = (filter_row+1)/2:((filter_row+1)/2+origin_row-1)
                for j = (filter_col+1)/2:((filter_col+1)/2+origin_col-1)
                    x1 = i-(filter_row-1)/2;
                    x2 = i+(filter_row-1)/2;
                    y1 = j-(filter_col-1)/2;
                    y2 = j+(filter_col-1)/2;
                    numerator = 0;
                    denominator = 0;
                    for m = x1:x2
                        for n = y1:y2
                            numerator = numerator+expand_img(m,n)^(Q+1);
                            denominator = denominator+expand_img(m,n)^Q;
                        end
                    end
                    output_img(x1, y1) = numerator/denominator;
                end
            end
        else if (type == 3)                         %geometric mean filter
                for i = (filter_row+1)/2:((filter_row+1)/2+origin_row-1)
                    for j = (filter_col+1)/2:((filter_col+1)/2+origin_col-1)
                        x1 = i-(filter_row-1)/2;
                        x2 = i+(filter_row-1)/2;
                        y1 = j-(filter_col-1)/2;
                        y2 = j+(filter_col-1)/2;
                        temp_matrix = expand_img(x1:x2,y1:y2);
                        output_img(x1,y1) = prod(temp_matrix(:))^(1/numel(temp_matrix));
                    end
                end
            else if (type == 4)                     %median filter
                    for i = (filter_row+1)/2:((filter_row+1)/2+origin_row-1)
                        for j = (filter_col+1)/2:((filter_col+1)/2+origin_col-1)
                            x1 = i-(filter_row-1)/2;
                            x2 = i+(filter_row-1)/2;
                            y1 = j-(filter_col-1)/2;
                            y2 = j+(filter_col-1)/2;
                            temp_matrix = expand_img(x1:x2,y1:y2);
                            output_img(x1,y1) = median(temp_matrix(:));
                        end
                    end
                else if (type == 5)                 %max filter
                        for i = (filter_row+1)/2:((filter_row+1)/2+origin_row-1)
                            for j = (filter_col+1)/2:((filter_col+1)/2+origin_col-1)
                                x1 = i-(filter_row-1)/2;
                                x2 = i+(filter_row-1)/2;
                                y1 = j-(filter_col-1)/2;
                                y2 = j+(filter_col-1)/2;
                                temp_matrix = expand_img(x1:x2,y1:y2);
                                output_img(x1,y1) = max(temp_matrix(:));
                            end
                        end
                    else if (type == 6)             %min filter
                            for i = (filter_row+1)/2:((filter_row+1)/2+origin_row-1)
                                for j = (filter_col+1)/2:((filter_col+1)/2+origin_col-1)
                                    x1 = i-(filter_row-1)/2;
                                    x2 = i+(filter_row-1)/2;
                                    y1 = j-(filter_col-1)/2;
                                    y2 = j+(filter_col-1)/2;
                                    temp_matrix = expand_img(x1:x2,y1:y2);
                                    output_img(x1,y1) = min(temp_matrix(:));
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
output_img = uint8(output_img);

