% ----- 初期化 -----
clear all; close all


% ----- 定義 -----
% 周波数
fs = 48000;        % サンプリング周波数48kHz
f_doll = 261.6/4;  % 「さらに低いド」の周波数
f_dol = 261.6/2;   % 「低いド」の周波数
f_do = 261.6;      % 基準の「ド」の周波数
f_doh = 261.6*2;   % 「高いド」の周波数
f_dohh = 261.6*4;  % 「さらに高いド」の周波数

% 四分音符の設定
N4 = 185;                       % 4分音符が1分間に何個あるか → 曲の速さ
n4sec = 60/N4;                  % 4分音符1個の秒数
n4smpl = round(fs*n4sec);       % 4分音符の1個のサンプル数
n4smpl = fix(n4smpl/16)*16;     % n4smplを16の倍数にしておく

% 時間変数の作成
t0 = (1:8*n4smpl)/fs;               % 全音符*2の時間変数
t1 = (1:4*n4smpl)/fs;               % 全音符の時間変数
t2 = (1:2*n4smpl)/fs;               % 2分音符の時間変数
t2futen = (1:3*n4smpl)/fs;          % 付点2分音符の時間変数 
t4 = (1:n4smpl)/fs;                 % 4分音符の時間変数
t4futen = (1:3*n4smpl/2)/fs;        % 符点4分音符の時間変数
t8 = (1:n4smpl/2)/fs;               % 8分音符の時間変数
t16 = (1:n4smpl/4)/fs;              % 16分音符の時間変数
te = (1:1.5*fs)/fs;                 % 1.5秒
te3 = (1:3*fs)/fs;                  % 3秒

% 小節の長さ
num2 = 4*2;                     % 1小節に4分音符が4つ*2小節
nall2 = n4smpl*num2;            % 2小節の長さ

% 休符
z1 = zeros(1, length(t1));      % 全休符
z2 = zeros(1, length(t2));      % 2分休符
z4 = zeros(1, length(t4));      % 4分休符
z8 = zeros(1, length(t8));      % 8分休符
z16 = zeros(1, length(t16));    % 16分休符

% 指数減衰関数
ze = exp(-log(100)*te);
ze3 = exp((log(0.01)/2.5)*te3);


% ----- 正弦波の作成 -----
% - 全音符*2
% ファ#
fas0 = 0;
for ii = 1:2:49
    fas0 = fas0 + sin(2*pi*ii*f_do*2^(6/12)*t0)/ii;
end

% レ#（高い）
resh0 = 0;
for ii = 1:2:49
    resh0 = resh0 + sin(2*pi*ii*f_doh*2^(3/12)*t0)/ii;
end

% シ（高い）
shih0 = 0;
for ii = 1:2:49
    shih0 = shih0 + sin(2*pi*ii*f_doh*2^(11/12)*t0)/ii;
end

% - 全音符
% シ（さらに低い）
shill1 = 0;
for ii = 1:2:49
    shill1 = shill1 + sin(2*pi*ii*f_doll*2^(11/12)*t1)/ii;
end

% レ#（低い）
resl1 = 0;
for ii = 1:2:49
    resl1 = resl1 + sin(2*pi*ii*f_dol*2^(3/12)*t1)/ii;
end

% シ
shi1 = 0;
for ii = 1:2:49
    shi1 = shi1 + sin(2*pi*ii*f_do*2^(11/12)*t1)/ii;
end

% レ#（高い）
resh1 = 0;
for ii = 1:2:49
    resh1 = resh1 + sin(2*pi*ii*f_doh*2^(3/12)*t1)/ii;
end

% ファ#（高い）
fash1 = 0;
for ii = 1:2:49
    fash1 = fash1 + sin(2*pi*ii*f_doh*2^(6/12)*t1)/ii;
end

% ラ（高い）
rah1 = 0;
for ii = 1:2:49
    rah1 = rah1 + sin(2*pi*ii*f_doh*2^(9/12)*t1)/ii;
end

% シ（高い）
shih1 = 0;
for ii = 1:2:49
    shih1 = shih1 + sin(2*pi*ii*f_doh*2^(11/12)*t1)/ii;
end

% - 2分音符
% ド#（低い）
dosl2 = 0;
for ii = 1:2:49
    dosl2 = dosl2 + sin(2*pi*ii*f_dol*2^(1/12)*t2)/ii;
end

% ミ（低い）
mil2 = 0;
for ii = 1:2:49
    mil2 = mil2 + sin(2*pi*ii*f_dol*2^(4/12)*t2)/ii;
end

% ラ
ra2 = 0;
for ii = 1:2:49
    ra2 = ra2 + sin(2*pi*ii*f_do*2^(9/12)*t2)/ii;
end

% シ
shi2 = 0;
for ii = 1:2:49
    shi2 = shi2 + sin(2*pi*ii*f_do*2^(11/12)*t2)/ii;
end

% ド#（高い）
dosh2 = 0;
for ii = 1:2:49
	dosh2 = dosh2 + sin(2*pi*ii*f_doh*2^(1/12)*t2)/ii;
end

% ミ（高い）
mih2 = 0;
for ii = 1:2:49
	mih2 = mih2 + sin(2*pi*ii*f_doh*2^(4/12)*t2)/ii;
end

% ラ（高い）
rah2 = 0;
for ii = 1:2:49
	rah2 = rah2 + sin(2*pi*ii*f_doh*2^(9/12)*t2)/ii;
end

% ド#（さらに高い）
doshh2 = 0;
for ii = 1:2:49
	doshh2 = doshh2 + sin(2*pi*ii*f_dohh*2^(1/12)*t2)/ii;
end

% - 付点2分音符
% ド#（低い）
dosl2fu = 0;
for ii = 1:2:49
	dosl2fu = dosl2fu + sin(2*pi*ii*f_dol^(1/12)*t2futen)/ii;
end

% ミ（低い）
mil2fu = 0;
for ii = 1:2:49
	mil2fu = mil2fu + sin(2*pi*ii*f_dol*2^(4/12)*t2futen)/ii;
end

% ド#
dos2fu = 0;
for ii = 1:2:49
    dos2fu = dos2fu + sin(2*pi*ii*f_do*2^(1/12)*t2futen)/ii;
end

% ミ
mi2fu = 0;
for ii = 1:2:49
	mi2fu = mi2fu + sin(2*pi*ii*f_do*2^(4/12)*t2futen)/ii;
end

% ラ
ra2fu = 0;
for ii = 1:2:49
	ra2fu = ra2fu + sin(2*pi*ii*f_do*2^(9/12)*t2futen)/ii;
end

% ド（高い）
doh2fu = 0;
for ii = 1:2:49
	doh2fu = doh2fu + sin(2*pi*ii*f_doh*t2futen)/ii;
end

% ド#（高い）
dosh2fu = 0;
for ii = 1:2:49
	dosh2fu = dosh2fu + sin(2*pi*ii*f_doh*2^(1/12)*t2futen)/ii;
end

% - 4分音符
% ソ（さらに低い）
soll4 = 0;
for ii = 1:2:49
	soll4 = soll4 + sin(2*pi*ii*f_doll*2^(7/12)*t4)/ii;
end

% ソ#（さらに低い）
sosll4 = 0;
for ii = 1:2:49
	sosll4 = sosll4 + sin(2*pi*ii*f_doll*2^(8/12)*t4)/ii;
end

% ラ（さらに低い）
rall4 = 0;
for ii = 1:2:49
	rall4 = rall4 + sin(2*pi*ii*f_doll*2^(9/12)*t4)/ii;
end

% ラ#（さらに低い）
rasll4 = 0;
for ii = 1:2:49
	rasll4 = rasll4 + sin(2*pi*ii*f_doll*2^(10/12)*t4)/ii;
end

% シ（さらに低い）
shill4 = 0;
for ii = 1:2:49
	shill4 = shill4 + sin(2*pi*ii*f_doll*2^(11/12)*t4)/ii;
end

% ド（低い）
dol4 = 0;
for ii = 1:2:49
	dol4 = dol4 + sin(2*pi*ii*f_dol*t4)/ii;
end

% ド#（低い）
dosl4 = 0;
for ii = 1:2:49
	dosl4 = dosl4 + sin(2*pi*ii*f_dol*2^(1/12)*t4)/ii;
end

% レ（低い）
rel4 = 0;
for ii = 1:2:49
	rel4 = rel4 + sin(2*pi*ii*f_dol*2^(2/12)*t4)/ii;
end

% レ#（低い）
resl4 = 0;
for ii = 1:2:49
    resl4 = resl4 + sin(2*pi*ii*f_dol*2^(3/12)*t4)/ii;
end

% ミ（低い）
mil4 = 0;
for ii = 1:2:49
	mil4 = mil4 + sin(2*pi*ii*f_dol*2^(4/12)*t4)/ii;
end

% ファ（低い）
fal4 = 0;
for ii = 1:2:49
	fal4 = fal4 + sin(2*pi*ii*f_dol*2^(5/12)*t4)/ii;
end

% ファ#（低い）
fasl4 = 0;
for ii = 1:2:49
	fasl4 = fasl4 + sin(2*pi*ii*f_dol*2^(6/12)*t4)/ii;
end

% ソ（低い）
sol4 = 0;
for ii = 1:2:49
	sol4 = sol4 + sin(2*pi*ii*f_dol*2^(7/12)*t4)/ii;
end

% ソ#（低い）
sosl4 = 0;
for ii = 1:2:49
	sosl4 = sosl4 + sin(2*pi*ii*f_dol*2^(8/12)*t4)/ii;
end

% ラ（低い）
ral4 = 0;
for ii = 1:2:49
	ral4 = ral4 + sin(2*pi*ii*f_dol*2^(9/12)*t4)/ii;
end

% ラ#（低い）
rasl4 = 0;
for ii = 1:2:49
	rasl4 = rasl4 + sin(2*pi*ii*f_dol*2^(10/12)*t4)/ii;
end

% シ（低い）
shil4 = 0;
for ii = 1:2:49
	shil4 = shil4 + sin(2*pi*ii*f_dol*2^(11/12)*t4)/ii;
end

% ド
do4 = 0;
for ii = 1:2:49
	do4 = do4 + sin(2*pi*ii*f_do*t4)/ii;
end

% ド#
dos4 = 0;
for ii = 1:2:49
	dos4 = dos4 + sin(2*pi*ii*f_do*2^(1/12)*t4)/ii;
end

% レ
re4 = 0;
for ii = 1:2:49
	re4 = re4 + sin(2*pi*ii*f_do*2^(2/12)*t4)/ii;
end

% レ#
res4 = 0;
for ii = 1:2:49
	res4 = res4 + sin(2*pi*ii*f_do*2^(3/12)*t4)/ii;
end

% ミ
mi4 = 0;
for ii = 1:2:49
	mi4 = mi4 + sin(2*pi*ii*f_do*2^(4/12)*t4)/ii;
end

% ファ
fa4 = 0;
for ii = 1:2:49
	fa4 = fa4 + sin(2*pi*ii*f_do*2^(5/12)*t4)/ii;
end

% ファ#
fas4 = 0;
for ii = 1:2:49
	fas4 = fas4 + sin(2*pi*ii*f_do*2^(6/12)*t4)/ii;
end

% ソ
so4 = 0;
for ii = 1:2:49
	so4 = so4 + sin(2*pi*ii*f_do*2^(7/12)*t4)/ii;
end

% ソ#
sos4 = 0;
for ii = 1:2:49
	sos4 = sos4 + sin(2*pi*ii*f_do*2^(8/12)*t4)/ii;
end

% ラ
ra4 = 0;
for ii = 1:2:49
	ra4 = ra4 + sin(2*pi*ii*f_do*2^(9/12)*t4)/ii;
end

% ラ#
ras4 = 0;
for ii = 1:2:49
	ras4 = ras4 + sin(2*pi*ii*f_do*2^(10/12)*t4)/ii;
end

% シ
shi4 = 0;
for ii = 1:2:49
	shi4 = shi4 + sin(2*pi*ii*f_do*2^(11/12)*t4)/ii;
end

% ド（高い）
doh4 = 0;
for ii = 1:2:49
	doh4 = doh4 + sin(2*pi*ii*f_doh*t4)/ii;
end

% ド#（高い）
dosh4 = 0;
for ii = 1:2:49
	dosh4 = dosh4 + sin(2*pi*ii*f_doh*2^(1/12)*t4)/ii;
end

% レ（高い）
reh4 = 0;
for ii = 1:2:49
	reh4 = reh4 + sin(2*pi*ii*f_doh*2^(2/12)*t4)/ii;
end

% レ#（高い）
resh4 = 0;
for ii = 1:2:49
	resh4 = resh4 + sin(2*pi*ii*f_doh*2^(3/12)*t4)/ii;
end

% ミ（高い）
mih4 = 0;
for ii = 1:2:49
	mih4 = mih4 + sin(2*pi*ii*f_doh*2^(4/12)*t4)/ii;
end

% ファ（高い）
fah4 = 0;
for ii = 1:2:49
	fah4 = fah4 + sin(2*pi*ii*f_doh*2^(5/12)*t4)/ii;
end

% ファ#（高い）
fash4 = 0;
for ii = 1:2:49
	fash4 = fash4 + sin(2*pi*ii*f_doh*2^(6/12)*t4)/ii;
end

% ソ#（高い）
sosh4 = 0;
for ii = 1:2:49
	sosh4 = sosh4 + sin(2*pi*ii*f_doh*2^(8/12)*t4)/ii;
end

% - 8分音符
% ソ（さらに低い）
soll8 = 0;
for ii = 1:2:49
	soll8 = soll8 + sin(2*pi*ii*f_doll*2^(7/12)*t8)/ii;
end

% ソ#（さらに低い）
sosll8 = 0;
for ii = 1:2:49
	sosll8 = sosll8 + sin(2*pi*ii*f_doll*2^(8/12)*t8)/ii;
end

% ラ（さらに低い）
rall8 = 0;
for ii = 1:2:49
	rall8 = rall8 + sin(2*pi*ii*f_doll*2^(9/12)*t8)/ii;
end

% ラ#（さらに低い）
rasll8 = 0;
for ii = 1:2:49
	rasll8 = rasll8 + sin(2*pi*ii*f_doll*2^(10/12)*t8)/ii;
end

% シ（さらに低い）
shill8 = 0;
for ii = 1:2:49
	shill8 = shill8 + sin(2*pi*ii*f_doll*2^(11/12)*t8)/ii;
end

% ド（低い）
dol8 = 0;
for ii = 1:2:49
	dol8 = dol8 + sin(2*pi*ii*f_dol*t8)/ii;
end

% ド#（低い）
dosl8 = 0;
for ii = 1:2:49
	dosl8 = dosl8 + sin(2*pi*ii*f_dol*2^(1/12)*t8)/ii;
end

% レ（低い）
rel8 = 0;
for ii = 1:2:49
	rel8 = rel8 + sin(2*pi*ii*f_dol*2^(2/12)*t8)/ii;
end

% レ#（低い）
resl8 = 0;
for ii = 1:2:49
	resl8 = resl8 + sin(2*pi*ii*f_dol*2^(3/12)*t8)/ii;
end

% ミ（低い）
mil8 = 0;
for ii = 1:2:49
	mil8 = mil8 + sin(2*pi*ii*f_dol*2^(4/12)*t8)/ii;
end

% ファ（低い）
fal8 = 0;
for ii = 1:2:49
	fal8 = fal8 + sin(2*pi*ii*f_dol*2^(5/12)*t8)/ii;
end

% ファ#（低い）
fasl8 = 0;
for ii = 1:2:49
	fasl8 = fasl8 + sin(2*pi*ii*f_dol*2^(6/12)*t8)/ii;
end

% ソ（低い）
sol8 = 0;
for ii = 1:2:49
	sol8 = sol8 + sin(2*pi*ii*f_dol*2^(7/12)*t8)/ii;
end

% ソ#（低い）
sosl8 = 0;
for ii = 1:2:49
	sosl8 = sosl8 + sin(2*pi*ii*f_dol*2^(8/12)*t8)/ii;
end

% ラ（低い）
ral8 = 0;
for ii = 1:2:49
	ral8 = ral8 + sin(2*pi*ii*f_dol*2^(9/12)*t8)/ii;
end

% ラ#（低い）
rasl8 = 0;
for ii = 1:2:49
	rasl8 = rasl8 + sin(2*pi*ii*f_dol*2^(10/12)*t8)/ii;
end

% シ（低い）
shil8 = 0;
for ii = 1:2:49
	shil8 = shil8 + sin(2*pi*ii*f_dol*2^(11/12)*t8)/ii;
end

% ド
do8 = 0;
for ii = 1:2:49
	do8 = do8 + sin(2*pi*ii*f_do*t8)/ii;
end

% ド#
dos8 = 0;
for ii = 1:2:49
	dos8 = dos8 + sin(2*pi*ii*f_do*2^(1/12)*t8)/ii;
end

% レ
re8 = 0;
for ii = 1:2:49
	re8 = re8 + sin(2*pi*ii*f_do*2^(2/12)*t8)/ii;
end

% レ#
res8 = 0;
for ii = 1:2:49
	res8 = res8 + sin(2*pi*ii*f_do*2^(3/12)*t8)/ii;
end

% ミ
mi8 = 0;
for ii = 1:2:49
	mi8 = mi8 + sin(2*pi*ii*f_do*2^(4/12)*t8)/ii;
end

% ファ
fa8 = 0;
for ii = 1:2:49
	fa8 = fa8 + sin(2*pi*ii*f_do*2^(5/12)*t8)/ii;
end

% ファ#
fas8 = 0;
for ii = 1:2:49
	fas8 = fas8 + sin(2*pi*ii*f_do*2^(6/12)*t8)/ii;
end

% ソ
so8 = 0;
for ii = 1:2:49
	so8 = so8 + sin(2*pi*ii*f_do*2^(7/12)*t8)/ii;
end

% ソ#
sos8 = 0;
for ii = 1:2:49
	sos8 = sos8 + sin(2*pi*ii*f_do*2^(8/12)*t8)/ii;
end

% ラ
ra8 = 0;
for ii = 1:2:49
	ra8 = ra8 + sin(2*pi*ii*f_do*2^(9/12)*t8)/ii;
end

% ラ#
ras8 = 0;
for ii = 1:2:49
	ras8 =ras8 + sin(2*pi*ii*f_do*2^(10/12)*t8)/ii;
end

% シ
shi8 = 0;
for ii = 1:2:49
	shi8 = shi8 + sin(2*pi*ii*f_do*2^(11/12)*t8)/ii;
end

% ド（高い）
doh8 = 0;
for ii = 1:2:49
	doh8 = doh8 + sin(2*pi*ii*f_doh*t8)/ii;
end

% レ（高い）
reh8 = 0;
for ii = 1:2:49
	reh8 = reh8 + sin(2*pi*ii*f_doh*2^(2/12)*t8)/ii;
end

% ド#（高い）
dosh8 = 0;
for ii = 1:2:49
	dosh8 = dosh8 + sin(2*pi*ii*f_doh*2^(1/12)*t8)/ii;
end

% レ#（高い）
resh8 = 0;
for ii = 1:2:49
	resh8 = resh8 + sin(2*pi*ii*f_doh*2^(3/12)*t8)/ii;
end

% ミ（高い）
mih8 = 0;
for ii = 1:2:49
	mih8 = mih8 + sin(2*pi*ii*f_doh*2^(4/12)*t8)/ii;
end

% ファ（高い）
fah8 = 0;
for ii = 1:2:49
    fah8 = fah8 + sin(2*pi*ii*f_doh*2^(5/12)*t8)/ii;
end

% ラ（高い）
rah8 = 0;
for ii = 1:2:49
	rah8 = rah8 + sin(2*pi*ii*f_doh*2^(9/12)*t8)/ii;
end

% - 16分音符
% ソ（さらに低い）
soll16 = 0;
for ii = 1:2:49
	soll16 = soll16 + sin(2*pi*ii*f_doll*2^(7/12)*t16)/ii;
end

% ソ#（さらに低い）
sosll16 = 0;
for ii = 1:2:49
	sosll16 = sosll16 + sin(2*pi*ii*f_doll*2^(8/12)*t16)/ii;
end

% ラ（さらに低い）
rall16 = 0;
for ii = 1:2:49
	rall16 = rall16 + sin(2*pi*ii*f_doll*2^(9/12)*t16)/ii;
end

% ラ#（さらに低い）
rasll16 = 0;
for ii = 1:2:49
	rasll16 = rasll16 + sin(2*pi*ii*f_doll*2^(10/12)*t16)/ii;
end

% シ（さらに低い）
shill16 = 0;
for ii = 1:2:49
	shill16 = shill16 + sin(2*pi*ii*f_doll*2^(11/12)*t16)/ii;
end

% ド（低い）
dol16 = 0;
for ii = 1:2:49
	dol16 = dol16 + sin(2*pi*ii*f_dol*t16)/ii;
end

% ド#（低い）
dosl16 = 0;
for ii = 1:2:49
	dosl16 = dosl16 + sin(2*pi*ii*f_dol*2^(1/12)*t16)/ii;
end

% レ（低い）
rel16 = 0;
for ii = 1:2:49
	rel16 = rel16 + sin(2*pi*ii*f_dol*2^(2/12)*t16)/ii;
end

% レ#（低い）
resl16 = 0;
for ii = 1:2:49
	resl16 = resl16 + sin(2*pi*ii*f_dol*2^(3/12)*t16)/ii;
end

% ミ（低い）
mil16 = 0;
for ii = 1:2:49
	mil16 = mil16 + sin(2*pi*ii*f_dol*2^(4/12)*t16)/ii;
end

% ファ（低い）
fal16 = 0;
for ii = 1:2:49
	fal16 = fal16 + sin(2*pi*ii*f_dol*2^(5/12)*t16)/ii;
end

% ファ#（低い）
fasl16 = 0;
for ii = 1:2:49
	fasl16 = fasl16 + sin(2*pi*ii*f_dol*2^(6/12)*t16)/ii;
end

% ソ（低い）
sol16 = 0;
for ii = 1:2:49
	sol16 = sol16 + sin(2*pi*ii*f_dol*2^(7/12)*t16)/ii;
end

% ソ#（低い）
sosl16 = 0;
for ii = 1:2:49
	sosl16 = sosl16 + sin(2*pi*ii*f_dol*2^(8/12)*t16)/ii;
end

% ラ（低い）
ral16 = 0;
for ii = 1:2:49
	ral16 = ral16 + sin(2*pi*ii*f_dol*2^(9/12)*t16)/ii;
end

% ラ#（低い）
rasl16 = 0;
for ii = 1:2:49
	rasl16 = rasl16 + sin(2*pi*ii*f_dol*2^(10/12)*t16)/ii;
end

% シ（低い）
shil16 = 0;
for ii = 1:2:49
	shil16 = shil16 + sin(2*pi*ii*f_dol*2^(11/12)*t16)/ii;
end

% ド
do16 = 0;
for ii = 1:2:49
	do16 = do16 + sin(2*pi*ii*f_do*t16)/ii;
end

% ド#
dos16 = 0;
for ii = 1:2:49
	dos16 = dos16 + sin(2*pi*ii*f_do*2^(1/12)*t16)/ii;
end

% レ
re16 = 0;
for ii = 1:2:49
	re16 = re16 + sin(2*pi*ii*f_do*2^(2/12)*t16)/ii;
end

% レ#
res16 = 0;
for ii = 1:2:49
	res16 = res16 + sin(2*pi*ii*f_do*2^(3/12)*t16)/ii;
end

% ミ
mi16 = 0;
for ii = 1:2:49
	mi16 = mi16 + sin(2*pi*ii*f_do*2^(4/12)*t16)/ii;
end

% ファ
fa16 = 0;
for ii = 1:2:49
	fa16 = fa16 + sin(2*pi*ii*f_do*2^(5/12)*t16)/ii;
end

% ファ#
fas16 = 0;
for ii = 1:2:49
	fas16 = fas16 + sin(2*pi*ii*f_do*2^(6/12)*t16)/ii;
end

% ソ
so16 = 0;
for ii = 1:2:49
	so16 = so16 + sin(2*pi*ii*f_do*2^(7/12)*t16)/ii;
end

% ソ#
sos16 = 0;
for ii = 1:2:49
	sos16 = sos16 + sin(2*pi*ii*f_do*2^(8/12)*t16)/ii;
end

% ラ
ra16 = 0;
for ii = 1:2:49
	ra16 = ra16 + sin(2*pi*ii*f_do*2^(9/12)*t16)/ii;
end

% ラ#
ras16 = 0;
for ii = 1:2:49
	ras16 = ras16 + sin(2*pi*ii*f_do*2^(10/12)*t16)/ii;
end

% シ
shi16 = 0;
for ii = 1:2:49
	shi16 = shi16 + sin(2*pi*ii*f_do*2^(11/12)*t16)/ii;
end

% ド（高い）
doh16 = 0;
for ii = 1:2:49
	doh16 = doh16 + sin(2*pi*ii*f_doh*t16)/ii;
end

% レ（高い）
reh16 = 0;
for ii = 1:2:49
	reh16 = reh16 + sin(2*pi*ii*f_doh*2^(2/12)*t16)/ii;
end

% ド#（高い）
dosh16 = 0;
for ii = 1:2:49
	dosh16 = dosh16 + sin(2*pi*ii*f_doh*2^(1/12)*t16)/ii;
end

% レ#（高い）
resh16 = 0;
for ii = 1:2:49
	resh16 = resh16 + sin(2*pi*ii*f_doh*2^(3/12)*t16)/ii;
end

% ミ（高い）
mih16 = 0;
for ii = 1:2:49
	mih16 = mih16 + sin(2*pi*ii*f_doh*2^(4/12)*t16)/ii;
end

% ファ（高い）
fah16 = 0;
for ii = 1:2:49
	fah16 = fah16 + sin(2*pi*ii*f_doh*2^(5/12)*t16)/ii;
end

% ファ#（高い）
fash16 = 0;
for ii = 1:2:49
	fash16 = fash16 + sin(2*pi*ii*f_doh*2^(6/12)*t16)/ii;
end

% ラ（高い）
rah16 = 0;
for ii = 1:2:49
	rah16 = rah16 + sin(2*pi*ii*f_doh*2^(9/12)*t16)/ii;
end

% 符点4分音符
% ド（低い）
dol4fu = 0;
for ii = 1:2:49
	dol4fu = dol4fu + sin(2*pi*ii*f_dol*t4futen)/ii;
end

% ド#（低い）
dosl4fu = 0;
for ii = 1:2:49
	dosl4fu = dosl4fu + sin(2*pi*ii*f_dol^(1/12)*t4futen)/ii;
end

% ミ（低い）
mil4fu = 0;
for ii = 1:2:49
    mil4fu = mil4fu + sin(2*pi*ii*f_dol*2^(4/12)*t4futen)/ii;
end

% ファ（低い）
fal4fu = 0;
for ii = 1:2:49
	fal4fu = fal4fu + sin(2*pi*ii*f_dol*2^(5/12)*t4futen)/ii;
end

% ファ
fa4fu = 0;
for ii = 1:2:49
	fa4fu = fa4fu + sin(2*pi*ii*f_do*2^(5/12)*t4futen)/ii;
end

% ソ
so4fu = 0;
for ii = 1:2:49
	so4fu = so4fu + sin(2*pi*ii*f_do*2^(7/12)*t4futen)/ii;
end

% ラ
ra4fu = 0;
for ii = 1:2:49
	ra4fu = ra4fu + sin(2*pi*ii*f_do*2^(9/12)*t4futen)/ii;
end

% ラ#
ras4fu = 0;
for ii = 1:2:49
	ras4fu = ras4fu + sin(2*pi*ii*f_do*2^(10/12)*t4futen)/ii;
end

% シ
shi4fu = 0;
for ii = 1:2:49
	shi4fu =shi4fu + sin(2*pi*ii*f_do*2^(11/12)*t4futen)/ii;
end

% ド（高い）
doh4fu = 0;
for ii = 1:2:49
	doh4fu = doh4fu + sin(2*pi*ii*f_doh*t4futen)/ii;
end

% ド#（高い）
dosh4fu = 0;
for ii = 1:2:49
	dosh4fu = dosh4fu + sin(2*pi*ii*f_doh*2^(1/12)*t4futen)/ii;
end

% レ#（高い）
resh4fu = 0;
for ii = 1:2:49
	resh4fu = resh4fu + sin(2*pi*ii*f_doh*2^(3/12)*t4futen)/ii;
end

% ミ（高い）
mih4fu = 0;
for ii = 1:2:49
	mih4fu = mih4fu + sin(2*pi*ii*f_doh*2^(4/12)*t4futen)/ii;
end

% ラ（高い）
rah4fu = 0;
for ii = 1:2:49
	rah4fu = rah4fu + sin(2*pi*ii*f_doh*2^(9/12)*t4futen)/ii;
end


% ----- 音楽の作成 -----
% 長いので小節ごとに配列を作成する．
% 最後に1つの配列にまとめる．
gym1 = [fah16, mih16, resh16, mih16, ...
    resh16, reh16, res16+fas16, reh16+fa16, ...
    dosh16+mi16, reh16+fa16, dosh16+mi16, doh16+res16, ...
    shi16+mi16+shill16, res16+dol16, re16+dosl16, res16+dol16];

gym2 = [re16+dosl16, dos16+rel16, fas16+re16+dosl16, fa16+dos16+rel16, ...
    mi16+do16+resl16, fa16+dos16+rel16, mi16+do16+resl16, res16+shil16+mil16, ...
    mi16+resl16+sosll16, res16+mil16+rall16, re16+fal16+rasll16, res16+mil16+rall16, ...
    re16+fal16+rasll16, dos16+fasl16+shill16, re16+fal16+rasll16, dos16+fasl16+shill16];

gym3_1 = [shi16, z16, z8, z4, z2];
gym3_2 = [fas16, z16, z8, z4, z2];
gym3_3 = [shill16, z16, fasl16, z16, shill16, z16, fasl16, z16, ...
    shill16, z16, fasl16, z16, shill16, z16, fasl16, z16];
gym3 = gym3_1+gym3_2+gym3_3;

gym4_1 = [shi16, z16, z8, z4, z8, doh4fu];
gym4_2 = [fas16, z16, z8, z4, z8, so4fu];
gym4_3 = [shill16, z16, fasl16, z16, shill16, z16, fasl16, z16, ...
    shill16, z16, dol4fu];
gym4 = gym4_1+gym4_2+gym4_3;

gym5_1 = [shi16, z16, z8, z4, z2];
gym5_2 = [fas16, z16, z8, z4, z2];
gym5_3 = [shill16, z16, fasl16, z16, shill16, z16, fasl16, z16, ...
    shill16, z16, fasl16, z16, shill16, z16, fasl16, z16];
gym5 = gym5_1+gym5_2+gym5_3;

gym6_1 = [shi16, z16, z8, z4, z8, ras4fu];
gym6_2 = [fas16, z16, z8, z4, z8, fa4fu];
gym6_3 = [shill16, z16, fasl16, z16, shill16, z16, fasl16, z16, ...
    shill16, z16, fal4fu];
gym6 = gym6_1+gym6_2+gym6_3;

gym7_1 = [shi16, z16, z8, z4, z2];
gym7_2 = [fas16, z16, z8, z4, z2];
gym7_3 = [shill16, z16, fasl16, z16, shill16, z16, fasl16, z16, ...
    shill16, z16, fasl16, z16, shill16, z16, fasl16, z16];
gym7 = gym7_1+gym7_2+gym7_3;

gym8_1 = [shi16, z16, z8, z4, z8, doh4fu];
gym8_2 = [fas16, z16, z8, z4, z8, so4fu];
gym8_3 = [shill16, z16, fasl16, z16, shill16, z16, fasl16, z16, ...
    shill16, z16, dol4fu];
gym8 = gym8_1+gym8_2+gym8_3;

gym9_1 = [shi16, z16, z8, z4, z2];
gym9_2 = [fas16, z16, z8, z4, z2];
gym9_3 = [shill16, z16, fasl16, z16, shill16, z16, fasl16, z16, ...
    shill16, z16, fasl16, z16, shill16, z16, fasl16, z16];
gym9 = gym9_1+gym9_2+gym9_3;

gym10_1 = [shi16, z16, z8, z4, z8, dosh4fu];
gym10_2 = [fas16, z16, z8, z4, z8, ra4fu];
gym10_3 = [shill16, z16, fasl16, z16, shill16, z16, fasl16, z16, ...
    shill16, z16, dosl4fu];
gym10 = gym10_1+gym10_2+gym10_3;

gym11_1 = [resh4, dosh4, resh4, mih8, fash4];
gym11_2 = [shill8, fasl8, shill8, fasl8, ...
    shill8, fasl8, shill8, fasl8, shill8];
gym11 = gym11_1+gym11_2;

gym12_1 = [mih4, resh8, dosh8, shi8, dosh8, resh8];
gym12_2 = [fasl8, shill8, fasl8, shill8, fasl8, shill8, fasl8];
gym12 = gym12_1+gym12_2;

gym13_1 = [ra2, dosh2];
gym13_2 = [rall8, mil8, rall8, mil8, rall8, mil8, rall8, mil8];
gym13 = gym13_1+gym13_2;

gym14_1 = [mih2, dosh2];
gym14_2 = [rall8, mil8, rall8, mil8, rall8, mil8, rall8, mil8];
gym14 = gym14_1+gym14_2;

gym15_1 = [resh4, dosh4, resh4, mih8, fash4];
gym15_2 = [shill8, fasl8, shill8, fasl8, ...
    shill8, fasl8, shill8, fasl8, shill8];
gym15 = gym15_1+gym15_2;

gym16_1 = [mih4, resh8, dosh8, shi8, dosh8, resh8];
gym16_2 = [fasl8, shill8, fasl8, shill8, fasl8, shill8, fasl8];
gym16 = gym16_1+gym16_2;

gym17_1 = [dosh2, shi2];
gym17_2 = [rall8, mil8, rall8, mil8, rall8, mil8, rall8, mil8];
gym17 = gym17_1 + gym17_2;

gym18_1 = [ra2, mih4, mih8, dosh8];
gym18_2 = [rall8, mil8, rall8, mil8, rall8, mil8, rall8, mil8];
gym18 = gym18_1+gym18_2;

gym19_1 = [shil16, z16, shil16, z16, re16, dos16, shil16, re16, ...
    shil16, z16, shil16, z16, mi16, re16, shil16, mi16];
gym19_2 = [shill16, z16, shill16, z16, rel4, ...
    shill16, z16, shill16, z16, mil4];
gym19 = gym19_1 + gym19_2;

gym20_1 = [shil16, z16, shil16, z16, fas16, mi16, dos16, fas16, z8, ...
    mi16, dos16, mi16, z16, fas16, z16];
gym20_2 = [shill16, z16, shill16, z16, fasl4, shill16, z16, dosl16, z16, ...
    shill16, z16, shill16, z16];
gym20 = gym20_1+gym20_2;

gym21_1 = [re16, dos16, shil16, re16, shil16, z16, shil16, z16, ...
    mi16, re16, shil16, mi16, shil16, z16, shil16, z16];
gym21_2 = [rel4, shill16, z16, shill16, z16, mil4, shill16, z16, shill16, z16];
gym21 = gym21_1+gym21_2;

gym22_1 = [fas16, mi16, dos16, fas16, mi16, z16, dos16, z16, ...
    re16, z16, dos16, z16, fas16, z16, mi16, z16];
gym22_2 = [rel4, shill16, z16, shill16, z16, dosl8, shill8, rall8, dol8];
gym22 = gym22_1+gym22_2;

gym23_1 = [shil16, z16, shil16, z16, shi4, doh4, ra4];
gym23_2 = [shill16, z16, shill16, z16, do16, shil16, ral16, shil16, ...
    do16, shil16, ral16, shil16, do16, shil16, ral16, shil16];
gym23 = gym23_1+gym23_2;

gym24_1 = [shi4, doh4, ra4, so4];
gym24_2 = [do16+shill16, shil16, ral16+shill16, shil16, do16, shil16, ral16, shil16, ...
    do16, shil16, ral16, shil16, do16, shil16, ral16, shil16];
gym24 = gym24_1+gym24_2;

fas0e = [fas0(1:(length(fas0)-length(ze))), ...
    fas0((length(fas0)-length(ze))+1:length(fas0)).*ze];
gym2526_1 = fas0e;
gym2526_2 = [do16+shill16, shil16, ral16+shill16, shil16, do16, shil16, ral16, shil16, ...
    do16, shil16, ral16, shil16, do16, shil16, ral16, shil16, ...
    do16+shill16, dos16, re16+shill16, res16, mi16, res16, re16, dos16, ...
    do16, shil16, ral16, sol16, fasl16, fal16, mil16, fal16];
gym2526 = gym2526_1+gym2526_2;

gym27_1 = [shil16, z16, shil16, z16, shi4, doh4, ra4];
gym27_2 = [shill16, z16, shill16, z16, do16, shil16, ral16, shil16, ...
    do16, shil16, ral16, shil16, do16, shil16, ral16, shil16];
gym27 = gym27_1+gym27_2;

gym28_1 = [shi4, doh4, ra4, doh4];
gym28_2 = [do16+shill16, shil16, ral16+shill16, shil16, do16, shil16, ral16, shil16, ...
    do16, shil16, ral16, shil16, do16, shil16, ral16, shil16];
gym28 = gym28_1+gym28_2;

gym29_1 = shi1;
gym29_2 = [do16+shill16, shil16, ral16+shill16, shil16, do16, shil16, ral16, shil16, ...
    do16, shil16, ral16, shil16, do16, shil16, ral16, shil16];
gym29 = gym29_1+gym29_2;

gym30_1 = fash1;
gym30_2 = [do16+shill16, shil16, ral16+shill16, shil16, do16, shil16, ral16, shil16, ...
    do16, shil16, ral16, shil16, do16, shil16, ral16, shil16];
gym30 = gym30_1+gym30_2;

gym31_1 = [ral16, z16, ral16, z16, ra2fu+dos2fu];
gym31_2 = [rall16, z16, rall16, z16, dosl2fu];
gym31 = gym31_1+gym31_2;

gym32_1 = [ral16, z16, ral16, z16, dosh2fu+mi2fu];
gym32_2 = [rall16, z16, rall16, z16, mil2fu];
gym32 = gym32_1+gym32_2;

gym3334_1 = resh0;
gym3334_2 = [res4, dos4, res4, mi8, fas4, shil8, ...
    res8, fas8, shi8, fas8, res8, fas8];
gym3334_3 = [resl1, shill1];
gym3334 = gym3334_1+gym3334_2+gym3334_3;

gym35_1 = [ral16, z16, ral16, z16, dosh2fu+ra2fu];
gym35_2 = [rall16, z16, rall16, z16, mil2fu];
gym35 = gym35_1+gym35_2;

gym36_1 = [rah2+dosh2, mih2+ra2];
gym36_2 = [dosl2, mil2];
gym36 = gym36_1+gym36_2;

gym3738_1 = shih0;
gym3738_2 = [resh4, mih4, dosh8, resh4fu, ...
    fash4, mih8, resh4, dosh4fu];
gym3738_3 = [shill8, fasl8, shill8, fasl8, shill8, fasl8, shill8, fasl8, ...
    shill8, fasl8, shill8, fasl8, shill8, mil4fu];
gym3738 = gym3738_1+gym3738_2+gym3738_3;

gym39_1 = [resh4, mih4, dosh8, resh4fu];
gym39_2 = [shill8, fasl8, shill8, fasl8, shill8, fasl8, shill8, fasl8];
gym39 = gym39_1+gym39_2;

gym40_1 = [fash4, rah8, sosh4, mih8, shi16, reh16, fash16, rah16];
gym40_2 = [shill8, fasl8, shill8, fasl8, shill8, mil4fu];
gym40 = gym40_1+gym40_2;

gym41_1 = shih1;
gym41_2 = [resh4, mih4, dosh8, resh4fu];
gym41_3 = [shill8, fasl8, shill8, fasl8, shill8, fasl8, shill8, fasl8];
gym41 = gym41_1+gym41_2+gym41_3;

gym42_1 = fash1;
gym42_2 = [mih4, resh8, dosh4, shi4fu];
gym42_3 = [shill8, fasl8, shill8, fasl8, shill8, dol4fu];
gym42 = gym42_1+gym42_2+gym42_3;

gym43_1 = rah1;
gym43_2 = [resh4, mih4, dosh8, resh4fu];
gym43_3 = [shill8, fasl8, shill8, fasl8, shill8, fasl8, shill8, fasl8];
gym43 = gym43_1+gym43_2+gym43_3;

gym44_1 = [doshh2, z8, rah4fu];
gym44_2 = [fash4, rah8, sosh4, mih4fu];
gym44_3 = [shill8, fasl8, shill8, fasl8, shill8, mil4fu];
gym44 = gym44_1+gym44_2+gym44_3;

% 小節を繋げる
gymlast = [gym15(1:(length(gym15)+length(gym16)+length(gym17)-length(ze3))), ...
    [gym15((length(gym15)+length(gym16)+length(gym17)-length(ze3))+1:length(gym15)), ...
    gym16, gym17].*ze3];            % フェードアウト
gym = [gym1, gym2, gym3, gym4, gym5, gym6, gym7, gym8, gym9, gym10, ...
    gym11, gym12, gym13, gym14, gym15, gym16, gym17, gym18, gym19, gym20, ...
    gym21, gym22, gym23, gym24, gym2526, gym27, gym28, gym29, gym30, ...
    gym31, gym32, gym3334, gym35, gym36, gym3738, gym39, gym40, ...
    gym41, gym42, gym43, gym44, ...
    gym11, gym12, gym13, gym14, gymlast];
gym = (gym/max(abs(gym)))*0.99;     % 正規化


% ----- 再生 -----
playblocking(audioplayer(gym, fs))    % gymの再生

% ----- 保存 -----
%audiowrite('Vs_GimReader_kanto.wav', gym, fs)      % gymを保存

return