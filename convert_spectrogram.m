%% ----- 内容 -----
% 音声のスペクトログラムを求める


%% ----- 初期化 -----
clear all; close all;


%% ----- 音データの選択 -----
[fileName, pathName] = uigetfile('*.wav', 'wavファイルを選択', 'Multiselect', 'on');  % 音データの選択
if iscell(fileName) == 0
    fileName = cellstr(fileName);
end
fileNumber = numel(fileName);   % 選択したファイルの個数


%% ----- スペクトログラムの作成 -----
for aa = 1:fileNumber
    %% ----- 定義 -----
    filePath = [pathName, fileName{aa}];        % 各ファイルのパス
    [soundData, fs] = audioread(filePath);      % 音データの読み込み
    Len = length(soundData);                    % 読み込んだ音データの長さ
    nfr = 1024;                                 % フレーム長
    nsf = 512;                                  % シフト長
    cut_num = fix(2*(Len/nfr)-1);               % 切り出す回数
    Specg = zeros(nfr*4, cut_num);              % フーリエ変換した信号を格納する配列
    xx = (1:cut_num) * Len / (fs*cut_num);      % プロット用変数
    yy = (0:2*nfr) * fs / (nfr*4);              % プロット用変数


    %% ----- スペクトログラムの作成 -----
    % --- 切り出しと格納 ---
    for ii = 1:cut_num
        data = soundData((ii-1)*nsf+1 : (ii-1)*nsf+nfr);            % 切り出し
        data = fft([data .* hanning(nfr); zeros(3*nfr, 1)]);        % ゼロ詰めしてFFTする
        Specg(:, ii) = data;                                        % Specgに格納
    end

    % --- dB表示 ---
    Specg_power_dB = 10 * log10(abs(Specg).^2);                     % dB表示にする

    % --- 正規化 ---
    Specg_power_dB = Specg_power_dB - max(Specg_power_dB(:));       % 正規化
    Specg_power_dB = Specg_power_dB(1:2*nfr+1, :);


    %% ----- 表示 -----
    figure;
    Disp = imagesc(xx, yy, Specg_power_dB);                             % スペクトログラムの表示
    axis xy;                                                            % 上下を反転させる
    title(strrep(fileName{aa}, '.wav', ''), 'Interpreter', 'none');     % タイトル
    xlabel('時間 [s]');                                                  % 横軸名
    ylabel('周波数 [Hz]');                                               % 縦軸名
    caxis([-60, 0]);                                            % カラーバーの設定
    colorbar;                                                   % カラーバーの表示
    colormap('jet');                                            % カラーマップを'jet'に設定
    
    
    %% ----- 保存 -----
    %saveas(gcf, strrep(fileName{aa}, '.wav', '.fig'));
    dlmwrite(strrep(fileName{aa}, '.wav', '.csv'), Specg_power_dB);
end


%% ----- 終了 -----
return