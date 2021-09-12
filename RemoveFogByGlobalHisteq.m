
function In = RemoveFogByGlobalHisteq(I, flag)
 
if nargin < 2
    flag = 1;
end
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);
M = histeq(R);
N = histeq(G);
L = histeq(B);
In = cat(3, M, N, L);
if flag
    figure;
    subplot(2, 2, 1); imshow(I); title('ԭͼ��', 'FontWeight', 'Bold');
    subplot(2, 2, 2); imshow(In); title('������ͼ��', 'FontWeight', 'Bold');
    Q = rgb2gray(I);
    W = rgb2gray(In);
    subplot(2, 2, 3); imhist(Q, 64); title('ԭ�Ҷ�ֱ��ͼ', 'FontWeight', 'Bold');
    subplot(2, 2, 4); imhist(W, 64); title('�����ĻҶ�ֱ��ͼ', 'FontWeight', 'Bold');
end
end