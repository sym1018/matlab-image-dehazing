 function In = RemoveFogByLocalHisteq(I , flag)
% �ԻҶ�ͼ�񣬽��оֲ�ֱ��ͼ���⻯
% ���������
%  I����ͼ�����
% ���������
%  g�������ͼ��
% ���ÿ⺯��adapthisteq��ִ�оֲ����⻯��ǿ

if nargin < 2
    flag = 1;
end
 
%%%�ֱ��R��G��B���о��⣬�ڵõ���GBͼ��
g1 = GetLocalHisteq(I(:, :, 1));
g2 = GetLocalHisteq(I(:, :, 2));
g3 = GetLocalHisteq(I(:, :, 3));
%���ɾֲ�ֱ��ͼ���⻯�ķ����õ����ͼ��
In = cat(3, g1, g2, g3);
%�����ʾ
if flag
    figure;
    subplot(2, 2, 1); imshow(I); title('ԭͼ��', 'FontWeight', 'Bold');
    subplot(2, 2, 2); imshow(In); title('������ͼ��', 'FontWeight', 'Bold');
 %�ҶȻ������ڼ���ֱ��ͼ
    Q = rgb2gray(I);
    W = rgb2gray(In);
    subplot(2, 2, 3); imhist(Q, 64); title('ԭ�Ҷ�ֱ��ͼ', 'FontWeight', 'Bold');
    subplot(2, 2, 4); imhist(W, 64); title('�����ĻҶ�ֱ��ͼ', 'FontWeight', 'Bold');
end
 


