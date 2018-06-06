%% ----- ���e -----
% SAD�ɂ��p�^�[���}�b�`���O


%% ----- ������ -----
clear;


%% ----- �摜�̓ǂݍ��� -----
% ���͉摜
in = imread('jre233_copy.bmp');
%in = [0 5 2 7 1 6 1; 1 2 3 5 2 1 0; 1 1 2 7 0 0 1; 5 0 1 1 7 6 5];
[inRow, inCol] = size(in);

% �e���v���[�g�摜
temp = imread('miyauti_temp.bmp');
%temp = [7 0 0; 1 7 6];
[tempRow, tempCol] = size(temp);


%% ----- SAD�̌v�Z -----
sadAns = zeros(inRow-tempRow+1, inCol-tempCol+1);

for row = 1:inRow-tempRow+1
    for col = 1:inCol-tempCol+1
        sad = abs(in(row:row+tempRow-1, col:col+tempCol-1) - temp);
        sadAns(row, col) = sum(sad(:));
    end
end

sadAns_min = min(sadAns(:));
disp(sadAns_min);


%% ----- �I�� -----
return;