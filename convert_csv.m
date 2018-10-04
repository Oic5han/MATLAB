%% ----- 内容 -----
% 音源をcsvに変換する


%% ----- 初期化 -----
clear all; close all;


%% ----- 音源の選択 -----
[fileName, pathName] = uigetfile('*.*', '音源を選択', 'Multiselect', 'on');  % 音データの選択
if iscell(fileName) == 0
    fileName = cellstr(fileName);
end
fileNumber = numel(fileName);   % 選択したファイルの個数


%% ----- 音源の読み込み -----
for aa = 1:fileNumber
    filePath = [pathName, fileName{aa}];        % 各ファイルのパス
    [soundData, fs] = audioread(filePath);      % 音データの読み込み
    %% ----- CSVに変換 -----
    csvwrite(strrep(fileName{aa}, '.wav', '.csv'), soundData);
end


%% ----- 終了 -----
return;