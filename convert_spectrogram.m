%% ----- ���e -----
% �����̃X�y�N�g���O���������߂�


%% ----- ������ -----
clear all; close all;


%% ----- ���f�[�^�̑I�� -----
[fileName, pathName] = uigetfile('*.wav', 'wav�t�@�C����I��', 'Multiselect', 'on');  % ���f�[�^�̑I��
if iscell(fileName) == 0
    fileName = cellstr(fileName);
end
fileNumber = numel(fileName);   % �I�������t�@�C���̌�


%% ----- �X�y�N�g���O�����̍쐬 -----
for aa = 1:fileNumber
    %% ----- ��` -----
    filePath = [pathName, fileName{aa}];        % �e�t�@�C���̃p�X
    [soundData, fs] = audioread(filePath);      % ���f�[�^�̓ǂݍ���
    Len = length(soundData);                    % �ǂݍ��񂾉��f�[�^�̒���
    nfr = 1024;                                 % �t���[����
    nsf = 512;                                  % �V�t�g��
    cut_num = fix(2*(Len/nfr)-1);               % �؂�o����
    Specg = zeros(nfr*4, cut_num);              % �t�[���G�ϊ������M�����i�[����z��
    xx = (1:cut_num) * Len / (fs*cut_num);      % �v���b�g�p�ϐ�
    yy = (0:2*nfr) * fs / (nfr*4);              % �v���b�g�p�ϐ�


    %% ----- �X�y�N�g���O�����̍쐬 -----
    % --- �؂�o���Ɗi�[ ---
    for ii = 1:cut_num
        data = soundData((ii-1)*nsf+1 : (ii-1)*nsf+nfr);            % �؂�o��
        data = fft([data .* hanning(nfr); zeros(3*nfr, 1)]);        % �[���l�߂���FFT����
        Specg(:, ii) = data;                                        % Specg�Ɋi�[
    end

    % --- dB�\�� ---
    Specg_power_dB = 10 * log10(abs(Specg).^2);                     % dB�\���ɂ���

    % --- ���K�� ---
    Specg_power_dB = Specg_power_dB - max(Specg_power_dB(:));       % ���K��
    Specg_power_dB = Specg_power_dB(1:2*nfr+1, :);


    %% ----- �\�� -----
    figure;
    Disp = imagesc(xx, yy, Specg_power_dB);                             % �X�y�N�g���O�����̕\��
    axis xy;                                                            % �㉺�𔽓]������
    title(strrep(fileName{aa}, '.wav', ''), 'Interpreter', 'none');     % �^�C�g��
    xlabel('���� [s]');                                                  % ������
    ylabel('���g�� [Hz]');                                               % �c����
    caxis([-60, 0]);                                            % �J���[�o�[�̐ݒ�
    colorbar;                                                   % �J���[�o�[�̕\��
    colormap('jet');                                            % �J���[�}�b�v��'jet'�ɐݒ�
    
    
    %% ----- �ۑ� -----
    %saveas(gcf, strrep(fileName{aa}, '.wav', '.fig'));
    dlmwrite(strrep(fileName{aa}, '.wav', '.csv'), Specg_power_dB);
end


%% ----- �I�� -----
return