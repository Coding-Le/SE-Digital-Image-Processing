function output = recur(vector)

%output Ϊfft�任�󷵻ص�Ƶ������
%N Ϊ����
%vector Ϊ�任ǰ������
vector_size = size(vector);
N = vector_size(2);

%��ַ����
j1 = 0;
for i = 1 : N
    if i < j1 + 1
        tmp = vector(j1 + 1);
        vector(j1 + 1) = vector(i);
        vector(i) = tmp;
    end
    k = N / 2;
    while (k <= j1)
        j1 = j1 - k;
        k = k / 2;
    end
    j1 = j1 + k;
end

%��������
dig = 0;
k = N;
while (k > 1)
    dig = dig + 1;
    k = k / 2;
end

% m Ϊ��; dist Ϊ����������ľ���; n Ϊ������������
n = N / 2;
for m = 1 : dig
    dist = 2 ^ (m - 1);
    idx = 1;
    for i = 1 : n
        idx1 = idx;
        for j1 = 1 : N / (2 * n)
            r = (idx - 1) * 2 ^ (dig - m);
            coef = exp(1j * (-2 * pi * r / N));
            tmp = vector(idx);
            vector(idx) = tmp + vector(idx + dist) * coef;
            vector(idx + dist) = tmp - vector(idx + dist) * coef;
            idx = idx + 1;
        end
        idx = idx1 + 2 * dist;
    end
    n = n / 2;
end

output = vector;