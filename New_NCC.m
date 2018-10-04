%% ----- ���e -----
% NCC�ɂ��e���v���[�g�}�b�`���O


%% ----- ������ -----
clear all; close all;


%% ----- csv�t�@�C���̑I�� -----
[inputCSV, inputPathName] = uigetfile('*.csv', '���͂�CSV�t�@�C����I��', 'Multiselect', 'on');
[tempCSV, tempPathName] = uigetfile('*.csv', '�e���v���[�g��CSV�t�@�C����I��', 'Multiselect', 'off');
if iscell(inputCSV) == 0
    inputCSV = cellstr(inputCSV);
end
inputNumber = numel(inputCSV);
if iscell(tempCSV) == 0
    tempCSV = cellstr(tempCSV);
end


%% ----- NCC -----
for aa = 1:inputNumber
    inputPath = [inputPathName, inputCSV{aa}];
    tempPath = [tempPathName, tempCSV{1}];
    in = csvread(inputPath);
    temp = csvread(tempPath);
    C = normxcorr2(temp, in);
    maxC = max(C(:));
    %% ----- ���ʂ̕\���@-----
    if maxC >= 0.8
        sentence1 = ['�u', inputCSV{aa}, '�v', '��', '�u', tempCSV{1}, '�v',  '�̌���\n'];
        sentence2 = ['NCC = ', num2str(maxC), '   ', '����ԗ��ł� \n\n'];
    else
        sentence1 = ['�u', inputCSV{aa}, '�v', '��', '�u', tempCSV{1}, '�v',  '�̌���\n'];
        sentence2 = ['NCC = ', num2str(maxC), '   ', '�قȂ�ԗ��ł� \n\n'];
    end
    fprintf(sentence1);
    fprintf(sentence2);
end


%% ----- �I�� -----
return;