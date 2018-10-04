%% ----- ���e -----
% �X�y�N�g���O������csv��ǂݍ��݁A�\������


%% ----- ������ -----
clear all; close all;


%% ----- �����̑I�� -----
[fileName, pathName] = uigetfile('*.csv', 'csv��I��', 'Multiselect', 'on');  % ���f�[�^�̑I��
if iscell(fileName) == 0
    fileName = cellstr(fileName);
end
fileNumber = numel(fileName);   % �I�������t�@�C���̌�


%% ----- �����̓ǂݍ��� -----
for aa = 1:fileNumber
    filePath = [pathName, fileName{aa}];        % �e�t�@�C���̃p�X
    specg = csvread(filePath);                  % ���f�[�^�̓ǂݍ���
    % --- �\�� ---
    figure(aa);
    Disp = imagesc(specg);                   % �X�y�N�g���O�����̕\��
    axis xy;                                 % �㉺�𔽓]������
    title(fileName{aa});     % �^�C�g��
    colorbar;                                % �J���[�o�[�̕\��
    colormap('jet');                         % �J���[�}�b�v��'jet'�ɐݒ�
end


%% ----- �I�� -----
return;