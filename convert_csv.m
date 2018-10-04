%% ----- ���e -----
% ������csv�ɕϊ�����


%% ----- ������ -----
clear all; close all;


%% ----- �����̑I�� -----
[fileName, pathName] = uigetfile('*.*', '������I��', 'Multiselect', 'on');  % ���f�[�^�̑I��
if iscell(fileName) == 0
    fileName = cellstr(fileName);
end
fileNumber = numel(fileName);   % �I�������t�@�C���̌�


%% ----- �����̓ǂݍ��� -----
for aa = 1:fileNumber
    filePath = [pathName, fileName{aa}];        % �e�t�@�C���̃p�X
    [soundData, fs] = audioread(filePath);      % ���f�[�^�̓ǂݍ���
    %% ----- CSV�ɕϊ� -----
    csvwrite(strrep(fileName{aa}, '.wav', '.csv'), soundData);
end


%% ----- �I�� -----
return;