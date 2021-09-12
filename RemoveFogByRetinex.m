
function In = RemoveFogByRetinex(I, flag)
% ��Retinex��MSRʵ��ͼ��ȥ��
% ���������
%  f����ͼ�����
%  flag������ʾ���
% ���������
%  In�������ͼ��
 
if nargin < 2
    flag = 1;
end
%��ȡͼ���R��G��B����
fr = I(:, :, 1);
fg = I(:, :, 2);
fb = I(:, :, 3);
%�������͹�һ��
mr = mat2gray(im2double(fr));
mg = mat2gray(im2double(fg));
mb = mat2gray(im2double(fb));
%����alpha����
alpha = 1200;
%����ģ���С
n = 128;
%��������
n1 = floor((n+1)/2);
for i = 1:n
    for j = 1:n
        %��˹����
        b(i,j)  = exp(-((i-n1)^2+(j-n1)^2)/(4*alpha))/(pi*alpha);
    end
end
%����˲�
nr1 = imfilter(mr,b,'conv', 'replicate');
ng1 = imfilter(mg,b,'conv', 'replicate');
nb1 = imfilter(mb,b,'conv', 'replicate');
ur1 = log(nr1);
ug1 = log(ng1);
ub1 = log(nb1);
tr1 = log(mr);
tg1 = log(mg);
tb1 = log(mb);
yr1 = (tr1-ur1)/3;
yg1 = (tg1-ug1)/3;
yb1 = (tb1-ub1)/3;
%����beta����
beta = 55;
%����ģ���С
x = 32;
%��������
x1 = floor((n+1)/2);
for i = 1:n
    for j = 1:n
        %��˹����
        a(i,j)  = exp(-((i-n1)^2+(j-n1)^2)/(4*beta))/(6*pi*beta);
    end
end
%����˲�
nr2 = imfilter(mr,a,'conv', 'replicate');
ng2 = imfilter(mg,a,'conv', 'replicate');
nb2 = imfilter(mb,a,'conv', 'replicate');
ur2 = log(nr2);
ug2 = log(ng2);
ub2 = log(nb2);
tr2 = log(mr);
tg2 = log(mg);
tb2 = log(mb);
yr2 = (tr2-ur2)/3;
yg2 = (tg2-ug2)/3;
yb2 = (tb2-ub2)/3;
%����eta����
eta = 13944.5;
%����ģ���С
l = 500;
%��������
l1 = floor((n+1)/2);
for i = 1:n
    for j = 1:n
        %��˹����
        e(i,j)  = exp(-((i-n1)^2+(j-n1)^2)/(4*eta))/(4*pi*eta);
    end
end
%����˲�
nr3 = imfilter(mr,e,'conv', 'replicate');
ng3 = imfilter(mg,e,'conv', 'replicate');
nb3 = imfilter(mb,e,'conv', 'replicate');
ur3 = log(nr3);
ug3 = log(ng3);
ub3 = log(nb3);
tr3 = log(mr);
tg3 = log(mg);
tb3 = log(mb);
yr3 = (tr3-ur3)/3;
yg3 = (tg3-ug3)/3;
yb3 = (tb3-ub3)/3;
dr = yr1+yr2+yr3;
dg = yg1+yg2+yg3;
db = yb1+yb2+yb3;
cr = im2uint8(dr);
cg = im2uint8(dg);
cb = im2uint8(db);
% ���ɴ����ķ����õ����ͼ��
In = cat(3, cr, cg, cb);
%�����ʾ
if flag
    figure;
    subplot(2, 2, 1); imshow(I); title('ԭͼ��', 'FontWeight', 'Bold');
    subplot(2, 2, 2); imshow(In); title('������ͼ��', 'FontWeight', 'Bold');
    % �ҶȻ������ڼ���ֱ��ͼ
    Q = rgb2gray(I);
    M = rgb2gray(In);
    subplot(2, 2, 3); imhist(Q, 64); title('ԭ�Ҷ�ֱ��ͼ', 'FontWeight', 'Bold');
    subplot(2, 2, 4); imhist(M, 64); title('�����ĻҶ�ֱ��ͼ', 'FontWeight', 'Bold');
end
