%% ----- 内容 -----
% NCCによるテンプレートマッチング


%% ----- 初期化 -----
clear all; close all;


%% ----- csvファイルの選択 -----
[inputCSV, inputPathName] = uigetfile('*.csv', '入力のCSVファイルを選択', 'Multiselect', 'on');
[tempCSV, tempPathName] = uigetfile('*.csv', 'テンプレートのCSVファイルを選択', 'Multiselect', 'off');
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
    %% ----- 結果の表示　-----
    if maxC >= 0.8
        sentence1 = ['「', inputCSV{aa}, '」', 'と', '「', tempCSV{1}, '」',  'の結果\n'];
        sentence2 = ['NCC = ', num2str(maxC), '   ', '同一車両です \n\n'];
    else
        sentence1 = ['「', inputCSV{aa}, '」', 'と', '「', tempCSV{1}, '」',  'の結果\n'];
        sentence2 = ['NCC = ', num2str(maxC), '   ', '異なる車両です \n\n'];
    end
    fprintf(sentence1);
    fprintf(sentence2);
end


%% ----- 終了 -----
return;