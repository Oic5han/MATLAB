%% ----- 内容 -----
% スペクトログラムのcsvを読み込み、表示する


%% ----- 初期化 -----
clear all; close all;


%% ----- 音源の選択 -----
[fileName, pathName] = uigetfile('*.csv', 'csvを選択', 'Multiselect', 'on');  % 音データの選択
if iscell(fileName) == 0
    fileName = cellstr(fileName);
end
fileNumber = numel(fileName);   % 選択したファイルの個数


%% ----- 音源の読み込み -----
for aa = 1:fileNumber
    filePath = [pathName, fileName{aa}];        % 各ファイルのパス
    specg = csvread(filePath);                  % 音データの読み込み
    % --- 表示 ---
    figure(aa);
    Disp = imagesc(specg);                   % スペクトログラムの表示
    axis xy;                                 % 上下を反転させる
    title(fileName{aa});     % タイトル
    colorbar;                                % カラーバーの表示
    colormap('jet');                         % カラーマップを'jet'に設定
end


%% ----- 終了 -----
return;