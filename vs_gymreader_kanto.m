% ----- ������ -----
clear all; close all


% ----- ��` -----
% ���g��
fs = 48000;        % �T���v�����O���g��48kHz
f_doll = 261.6/4;  % �u����ɒႢ�h�v�̎��g��
f_dol = 261.6/2;   % �u�Ⴂ�h�v�̎��g��
f_do = 261.6;      % ��́u�h�v�̎��g��
f_doh = 261.6*2;   % �u�����h�v�̎��g��
f_dohh = 261.6*4;  % �u����ɍ����h�v�̎��g��

% �l�������̐ݒ�
N4 = 185;                       % 4��������1���Ԃɉ����邩 �� �Ȃ̑���
n4sec = 60/N4;                  % 4������1�̕b��
n4smpl = round(fs*n4sec);       % 4��������1�̃T���v����
n4smpl = fix(n4smpl/16)*16;     % n4smpl��16�̔{���ɂ��Ă���

% ���ԕϐ��̍쐬
t0 = (1:8*n4smpl)/fs;               % �S����*2�̎��ԕϐ�
t1 = (1:4*n4smpl)/fs;               % �S�����̎��ԕϐ�
t2 = (1:2*n4smpl)/fs;               % 2�������̎��ԕϐ�
t2futen = (1:3*n4smpl)/fs;          % �t�_2�������̎��ԕϐ� 
t4 = (1:n4smpl)/fs;                 % 4�������̎��ԕϐ�
t4futen = (1:3*n4smpl/2)/fs;        % ���_4�������̎��ԕϐ�
t8 = (1:n4smpl/2)/fs;               % 8�������̎��ԕϐ�
t16 = (1:n4smpl/4)/fs;              % 16�������̎��ԕϐ�
te = (1:1.5*fs)/fs;                 % 1.5�b
te3 = (1:3*fs)/fs;                  % 3�b

% ���߂̒���
num2 = 4*2;                     % 1���߂�4��������4��*2����
nall2 = n4smpl*num2;            % 2���߂̒���

% �x��
z1 = zeros(1, length(t1));      % �S�x��
z2 = zeros(1, length(t2));      % 2���x��
z4 = zeros(1, length(t4));      % 4���x��
z8 = zeros(1, length(t8));      % 8���x��
z16 = zeros(1, length(t16));    % 16���x��

% �w�������֐�
ze = exp(-log(100)*te);
ze3 = exp((log(0.01)/2.5)*te3);


% ----- �����g�̍쐬 -----
% - �S����*2
% �t�@#
fas0 = 0;
for ii = 1:2:49
    fas0 = fas0 + sin(2*pi*ii*f_do*2^(6/12)*t0)/ii;
end

% ��#�i�����j
resh0 = 0;
for ii = 1:2:49
    resh0 = resh0 + sin(2*pi*ii*f_doh*2^(3/12)*t0)/ii;
end

% �V�i�����j
shih0 = 0;
for ii = 1:2:49
    shih0 = shih0 + sin(2*pi*ii*f_doh*2^(11/12)*t0)/ii;
end

% - �S����
% �V�i����ɒႢ�j
shill1 = 0;
for ii = 1:2:49
    shill1 = shill1 + sin(2*pi*ii*f_doll*2^(11/12)*t1)/ii;
end

% ��#�i�Ⴂ�j
resl1 = 0;
for ii = 1:2:49
    resl1 = resl1 + sin(2*pi*ii*f_dol*2^(3/12)*t1)/ii;
end

% �V
shi1 = 0;
for ii = 1:2:49
    shi1 = shi1 + sin(2*pi*ii*f_do*2^(11/12)*t1)/ii;
end

% ��#�i�����j
resh1 = 0;
for ii = 1:2:49
    resh1 = resh1 + sin(2*pi*ii*f_doh*2^(3/12)*t1)/ii;
end

% �t�@#�i�����j
fash1 = 0;
for ii = 1:2:49
    fash1 = fash1 + sin(2*pi*ii*f_doh*2^(6/12)*t1)/ii;
end

% ���i�����j
rah1 = 0;
for ii = 1:2:49
    rah1 = rah1 + sin(2*pi*ii*f_doh*2^(9/12)*t1)/ii;
end

% �V�i�����j
shih1 = 0;
for ii = 1:2:49
    shih1 = shih1 + sin(2*pi*ii*f_doh*2^(11/12)*t1)/ii;
end

% - 2������
% �h#�i�Ⴂ�j
dosl2 = 0;
for ii = 1:2:49
    dosl2 = dosl2 + sin(2*pi*ii*f_dol*2^(1/12)*t2)/ii;
end

% �~�i�Ⴂ�j
mil2 = 0;
for ii = 1:2:49
    mil2 = mil2 + sin(2*pi*ii*f_dol*2^(4/12)*t2)/ii;
end

% ��
ra2 = 0;
for ii = 1:2:49
    ra2 = ra2 + sin(2*pi*ii*f_do*2^(9/12)*t2)/ii;
end

% �V
shi2 = 0;
for ii = 1:2:49
    shi2 = shi2 + sin(2*pi*ii*f_do*2^(11/12)*t2)/ii;
end

% �h#�i�����j
dosh2 = 0;
for ii = 1:2:49
	dosh2 = dosh2 + sin(2*pi*ii*f_doh*2^(1/12)*t2)/ii;
end

% �~�i�����j
mih2 = 0;
for ii = 1:2:49
	mih2 = mih2 + sin(2*pi*ii*f_doh*2^(4/12)*t2)/ii;
end

% ���i�����j
rah2 = 0;
for ii = 1:2:49
	rah2 = rah2 + sin(2*pi*ii*f_doh*2^(9/12)*t2)/ii;
end

% �h#�i����ɍ����j
doshh2 = 0;
for ii = 1:2:49
	doshh2 = doshh2 + sin(2*pi*ii*f_dohh*2^(1/12)*t2)/ii;
end

% - �t�_2������
% �h#�i�Ⴂ�j
dosl2fu = 0;
for ii = 1:2:49
	dosl2fu = dosl2fu + sin(2*pi*ii*f_dol^(1/12)*t2futen)/ii;
end

% �~�i�Ⴂ�j
mil2fu = 0;
for ii = 1:2:49
	mil2fu = mil2fu + sin(2*pi*ii*f_dol*2^(4/12)*t2futen)/ii;
end

% �h#
dos2fu = 0;
for ii = 1:2:49
    dos2fu = dos2fu + sin(2*pi*ii*f_do*2^(1/12)*t2futen)/ii;
end

% �~
mi2fu = 0;
for ii = 1:2:49
	mi2fu = mi2fu + sin(2*pi*ii*f_do*2^(4/12)*t2futen)/ii;
end

% ��
ra2fu = 0;
for ii = 1:2:49
	ra2fu = ra2fu + sin(2*pi*ii*f_do*2^(9/12)*t2futen)/ii;
end

% �h�i�����j
doh2fu = 0;
for ii = 1:2:49
	doh2fu = doh2fu + sin(2*pi*ii*f_doh*t2futen)/ii;
end

% �h#�i�����j
dosh2fu = 0;
for ii = 1:2:49
	dosh2fu = dosh2fu + sin(2*pi*ii*f_doh*2^(1/12)*t2futen)/ii;
end

% - 4������
% �\�i����ɒႢ�j
soll4 = 0;
for ii = 1:2:49
	soll4 = soll4 + sin(2*pi*ii*f_doll*2^(7/12)*t4)/ii;
end

% �\#�i����ɒႢ�j
sosll4 = 0;
for ii = 1:2:49
	sosll4 = sosll4 + sin(2*pi*ii*f_doll*2^(8/12)*t4)/ii;
end

% ���i����ɒႢ�j
rall4 = 0;
for ii = 1:2:49
	rall4 = rall4 + sin(2*pi*ii*f_doll*2^(9/12)*t4)/ii;
end

% ��#�i����ɒႢ�j
rasll4 = 0;
for ii = 1:2:49
	rasll4 = rasll4 + sin(2*pi*ii*f_doll*2^(10/12)*t4)/ii;
end

% �V�i����ɒႢ�j
shill4 = 0;
for ii = 1:2:49
	shill4 = shill4 + sin(2*pi*ii*f_doll*2^(11/12)*t4)/ii;
end

% �h�i�Ⴂ�j
dol4 = 0;
for ii = 1:2:49
	dol4 = dol4 + sin(2*pi*ii*f_dol*t4)/ii;
end

% �h#�i�Ⴂ�j
dosl4 = 0;
for ii = 1:2:49
	dosl4 = dosl4 + sin(2*pi*ii*f_dol*2^(1/12)*t4)/ii;
end

% ���i�Ⴂ�j
rel4 = 0;
for ii = 1:2:49
	rel4 = rel4 + sin(2*pi*ii*f_dol*2^(2/12)*t4)/ii;
end

% ��#�i�Ⴂ�j
resl4 = 0;
for ii = 1:2:49
    resl4 = resl4 + sin(2*pi*ii*f_dol*2^(3/12)*t4)/ii;
end

% �~�i�Ⴂ�j
mil4 = 0;
for ii = 1:2:49
	mil4 = mil4 + sin(2*pi*ii*f_dol*2^(4/12)*t4)/ii;
end

% �t�@�i�Ⴂ�j
fal4 = 0;
for ii = 1:2:49
	fal4 = fal4 + sin(2*pi*ii*f_dol*2^(5/12)*t4)/ii;
end

% �t�@#�i�Ⴂ�j
fasl4 = 0;
for ii = 1:2:49
	fasl4 = fasl4 + sin(2*pi*ii*f_dol*2^(6/12)*t4)/ii;
end

% �\�i�Ⴂ�j
sol4 = 0;
for ii = 1:2:49
	sol4 = sol4 + sin(2*pi*ii*f_dol*2^(7/12)*t4)/ii;
end

% �\#�i�Ⴂ�j
sosl4 = 0;
for ii = 1:2:49
	sosl4 = sosl4 + sin(2*pi*ii*f_dol*2^(8/12)*t4)/ii;
end

% ���i�Ⴂ�j
ral4 = 0;
for ii = 1:2:49
	ral4 = ral4 + sin(2*pi*ii*f_dol*2^(9/12)*t4)/ii;
end

% ��#�i�Ⴂ�j
rasl4 = 0;
for ii = 1:2:49
	rasl4 = rasl4 + sin(2*pi*ii*f_dol*2^(10/12)*t4)/ii;
end

% �V�i�Ⴂ�j
shil4 = 0;
for ii = 1:2:49
	shil4 = shil4 + sin(2*pi*ii*f_dol*2^(11/12)*t4)/ii;
end

% �h
do4 = 0;
for ii = 1:2:49
	do4 = do4 + sin(2*pi*ii*f_do*t4)/ii;
end

% �h#
dos4 = 0;
for ii = 1:2:49
	dos4 = dos4 + sin(2*pi*ii*f_do*2^(1/12)*t4)/ii;
end

% ��
re4 = 0;
for ii = 1:2:49
	re4 = re4 + sin(2*pi*ii*f_do*2^(2/12)*t4)/ii;
end

% ��#
res4 = 0;
for ii = 1:2:49
	res4 = res4 + sin(2*pi*ii*f_do*2^(3/12)*t4)/ii;
end

% �~
mi4 = 0;
for ii = 1:2:49
	mi4 = mi4 + sin(2*pi*ii*f_do*2^(4/12)*t4)/ii;
end

% �t�@
fa4 = 0;
for ii = 1:2:49
	fa4 = fa4 + sin(2*pi*ii*f_do*2^(5/12)*t4)/ii;
end

% �t�@#
fas4 = 0;
for ii = 1:2:49
	fas4 = fas4 + sin(2*pi*ii*f_do*2^(6/12)*t4)/ii;
end

% �\
so4 = 0;
for ii = 1:2:49
	so4 = so4 + sin(2*pi*ii*f_do*2^(7/12)*t4)/ii;
end

% �\#
sos4 = 0;
for ii = 1:2:49
	sos4 = sos4 + sin(2*pi*ii*f_do*2^(8/12)*t4)/ii;
end

% ��
ra4 = 0;
for ii = 1:2:49
	ra4 = ra4 + sin(2*pi*ii*f_do*2^(9/12)*t4)/ii;
end

% ��#
ras4 = 0;
for ii = 1:2:49
	ras4 = ras4 + sin(2*pi*ii*f_do*2^(10/12)*t4)/ii;
end

% �V
shi4 = 0;
for ii = 1:2:49
	shi4 = shi4 + sin(2*pi*ii*f_do*2^(11/12)*t4)/ii;
end

% �h�i�����j
doh4 = 0;
for ii = 1:2:49
	doh4 = doh4 + sin(2*pi*ii*f_doh*t4)/ii;
end

% �h#�i�����j
dosh4 = 0;
for ii = 1:2:49
	dosh4 = dosh4 + sin(2*pi*ii*f_doh*2^(1/12)*t4)/ii;
end

% ���i�����j
reh4 = 0;
for ii = 1:2:49
	reh4 = reh4 + sin(2*pi*ii*f_doh*2^(2/12)*t4)/ii;
end

% ��#�i�����j
resh4 = 0;
for ii = 1:2:49
	resh4 = resh4 + sin(2*pi*ii*f_doh*2^(3/12)*t4)/ii;
end

% �~�i�����j
mih4 = 0;
for ii = 1:2:49
	mih4 = mih4 + sin(2*pi*ii*f_doh*2^(4/12)*t4)/ii;
end

% �t�@�i�����j
fah4 = 0;
for ii = 1:2:49
	fah4 = fah4 + sin(2*pi*ii*f_doh*2^(5/12)*t4)/ii;
end

% �t�@#�i�����j
fash4 = 0;
for ii = 1:2:49
	fash4 = fash4 + sin(2*pi*ii*f_doh*2^(6/12)*t4)/ii;
end

% �\#�i�����j
sosh4 = 0;
for ii = 1:2:49
	sosh4 = sosh4 + sin(2*pi*ii*f_doh*2^(8/12)*t4)/ii;
end

% - 8������
% �\�i����ɒႢ�j
soll8 = 0;
for ii = 1:2:49
	soll8 = soll8 + sin(2*pi*ii*f_doll*2^(7/12)*t8)/ii;
end

% �\#�i����ɒႢ�j
sosll8 = 0;
for ii = 1:2:49
	sosll8 = sosll8 + sin(2*pi*ii*f_doll*2^(8/12)*t8)/ii;
end

% ���i����ɒႢ�j
rall8 = 0;
for ii = 1:2:49
	rall8 = rall8 + sin(2*pi*ii*f_doll*2^(9/12)*t8)/ii;
end

% ��#�i����ɒႢ�j
rasll8 = 0;
for ii = 1:2:49
	rasll8 = rasll8 + sin(2*pi*ii*f_doll*2^(10/12)*t8)/ii;
end

% �V�i����ɒႢ�j
shill8 = 0;
for ii = 1:2:49
	shill8 = shill8 + sin(2*pi*ii*f_doll*2^(11/12)*t8)/ii;
end

% �h�i�Ⴂ�j
dol8 = 0;
for ii = 1:2:49
	dol8 = dol8 + sin(2*pi*ii*f_dol*t8)/ii;
end

% �h#�i�Ⴂ�j
dosl8 = 0;
for ii = 1:2:49
	dosl8 = dosl8 + sin(2*pi*ii*f_dol*2^(1/12)*t8)/ii;
end

% ���i�Ⴂ�j
rel8 = 0;
for ii = 1:2:49
	rel8 = rel8 + sin(2*pi*ii*f_dol*2^(2/12)*t8)/ii;
end

% ��#�i�Ⴂ�j
resl8 = 0;
for ii = 1:2:49
	resl8 = resl8 + sin(2*pi*ii*f_dol*2^(3/12)*t8)/ii;
end

% �~�i�Ⴂ�j
mil8 = 0;
for ii = 1:2:49
	mil8 = mil8 + sin(2*pi*ii*f_dol*2^(4/12)*t8)/ii;
end

% �t�@�i�Ⴂ�j
fal8 = 0;
for ii = 1:2:49
	fal8 = fal8 + sin(2*pi*ii*f_dol*2^(5/12)*t8)/ii;
end

% �t�@#�i�Ⴂ�j
fasl8 = 0;
for ii = 1:2:49
	fasl8 = fasl8 + sin(2*pi*ii*f_dol*2^(6/12)*t8)/ii;
end

% �\�i�Ⴂ�j
sol8 = 0;
for ii = 1:2:49
	sol8 = sol8 + sin(2*pi*ii*f_dol*2^(7/12)*t8)/ii;
end

% �\#�i�Ⴂ�j
sosl8 = 0;
for ii = 1:2:49
	sosl8 = sosl8 + sin(2*pi*ii*f_dol*2^(8/12)*t8)/ii;
end

% ���i�Ⴂ�j
ral8 = 0;
for ii = 1:2:49
	ral8 = ral8 + sin(2*pi*ii*f_dol*2^(9/12)*t8)/ii;
end

% ��#�i�Ⴂ�j
rasl8 = 0;
for ii = 1:2:49
	rasl8 = rasl8 + sin(2*pi*ii*f_dol*2^(10/12)*t8)/ii;
end

% �V�i�Ⴂ�j
shil8 = 0;
for ii = 1:2:49
	shil8 = shil8 + sin(2*pi*ii*f_dol*2^(11/12)*t8)/ii;
end

% �h
do8 = 0;
for ii = 1:2:49
	do8 = do8 + sin(2*pi*ii*f_do*t8)/ii;
end

% �h#
dos8 = 0;
for ii = 1:2:49
	dos8 = dos8 + sin(2*pi*ii*f_do*2^(1/12)*t8)/ii;
end

% ��
re8 = 0;
for ii = 1:2:49
	re8 = re8 + sin(2*pi*ii*f_do*2^(2/12)*t8)/ii;
end

% ��#
res8 = 0;
for ii = 1:2:49
	res8 = res8 + sin(2*pi*ii*f_do*2^(3/12)*t8)/ii;
end

% �~
mi8 = 0;
for ii = 1:2:49
	mi8 = mi8 + sin(2*pi*ii*f_do*2^(4/12)*t8)/ii;
end

% �t�@
fa8 = 0;
for ii = 1:2:49
	fa8 = fa8 + sin(2*pi*ii*f_do*2^(5/12)*t8)/ii;
end

% �t�@#
fas8 = 0;
for ii = 1:2:49
	fas8 = fas8 + sin(2*pi*ii*f_do*2^(6/12)*t8)/ii;
end

% �\
so8 = 0;
for ii = 1:2:49
	so8 = so8 + sin(2*pi*ii*f_do*2^(7/12)*t8)/ii;
end

% �\#
sos8 = 0;
for ii = 1:2:49
	sos8 = sos8 + sin(2*pi*ii*f_do*2^(8/12)*t8)/ii;
end

% ��
ra8 = 0;
for ii = 1:2:49
	ra8 = ra8 + sin(2*pi*ii*f_do*2^(9/12)*t8)/ii;
end

% ��#
ras8 = 0;
for ii = 1:2:49
	ras8 =ras8 + sin(2*pi*ii*f_do*2^(10/12)*t8)/ii;
end

% �V
shi8 = 0;
for ii = 1:2:49
	shi8 = shi8 + sin(2*pi*ii*f_do*2^(11/12)*t8)/ii;
end

% �h�i�����j
doh8 = 0;
for ii = 1:2:49
	doh8 = doh8 + sin(2*pi*ii*f_doh*t8)/ii;
end

% ���i�����j
reh8 = 0;
for ii = 1:2:49
	reh8 = reh8 + sin(2*pi*ii*f_doh*2^(2/12)*t8)/ii;
end

% �h#�i�����j
dosh8 = 0;
for ii = 1:2:49
	dosh8 = dosh8 + sin(2*pi*ii*f_doh*2^(1/12)*t8)/ii;
end

% ��#�i�����j
resh8 = 0;
for ii = 1:2:49
	resh8 = resh8 + sin(2*pi*ii*f_doh*2^(3/12)*t8)/ii;
end

% �~�i�����j
mih8 = 0;
for ii = 1:2:49
	mih8 = mih8 + sin(2*pi*ii*f_doh*2^(4/12)*t8)/ii;
end

% �t�@�i�����j
fah8 = 0;
for ii = 1:2:49
    fah8 = fah8 + sin(2*pi*ii*f_doh*2^(5/12)*t8)/ii;
end

% ���i�����j
rah8 = 0;
for ii = 1:2:49
	rah8 = rah8 + sin(2*pi*ii*f_doh*2^(9/12)*t8)/ii;
end

% - 16������
% �\�i����ɒႢ�j
soll16 = 0;
for ii = 1:2:49
	soll16 = soll16 + sin(2*pi*ii*f_doll*2^(7/12)*t16)/ii;
end

% �\#�i����ɒႢ�j
sosll16 = 0;
for ii = 1:2:49
	sosll16 = sosll16 + sin(2*pi*ii*f_doll*2^(8/12)*t16)/ii;
end

% ���i����ɒႢ�j
rall16 = 0;
for ii = 1:2:49
	rall16 = rall16 + sin(2*pi*ii*f_doll*2^(9/12)*t16)/ii;
end

% ��#�i����ɒႢ�j
rasll16 = 0;
for ii = 1:2:49
	rasll16 = rasll16 + sin(2*pi*ii*f_doll*2^(10/12)*t16)/ii;
end

% �V�i����ɒႢ�j
shill16 = 0;
for ii = 1:2:49
	shill16 = shill16 + sin(2*pi*ii*f_doll*2^(11/12)*t16)/ii;
end

% �h�i�Ⴂ�j
dol16 = 0;
for ii = 1:2:49
	dol16 = dol16 + sin(2*pi*ii*f_dol*t16)/ii;
end

% �h#�i�Ⴂ�j
dosl16 = 0;
for ii = 1:2:49
	dosl16 = dosl16 + sin(2*pi*ii*f_dol*2^(1/12)*t16)/ii;
end

% ���i�Ⴂ�j
rel16 = 0;
for ii = 1:2:49
	rel16 = rel16 + sin(2*pi*ii*f_dol*2^(2/12)*t16)/ii;
end

% ��#�i�Ⴂ�j
resl16 = 0;
for ii = 1:2:49
	resl16 = resl16 + sin(2*pi*ii*f_dol*2^(3/12)*t16)/ii;
end

% �~�i�Ⴂ�j
mil16 = 0;
for ii = 1:2:49
	mil16 = mil16 + sin(2*pi*ii*f_dol*2^(4/12)*t16)/ii;
end

% �t�@�i�Ⴂ�j
fal16 = 0;
for ii = 1:2:49
	fal16 = fal16 + sin(2*pi*ii*f_dol*2^(5/12)*t16)/ii;
end

% �t�@#�i�Ⴂ�j
fasl16 = 0;
for ii = 1:2:49
	fasl16 = fasl16 + sin(2*pi*ii*f_dol*2^(6/12)*t16)/ii;
end

% �\�i�Ⴂ�j
sol16 = 0;
for ii = 1:2:49
	sol16 = sol16 + sin(2*pi*ii*f_dol*2^(7/12)*t16)/ii;
end

% �\#�i�Ⴂ�j
sosl16 = 0;
for ii = 1:2:49
	sosl16 = sosl16 + sin(2*pi*ii*f_dol*2^(8/12)*t16)/ii;
end

% ���i�Ⴂ�j
ral16 = 0;
for ii = 1:2:49
	ral16 = ral16 + sin(2*pi*ii*f_dol*2^(9/12)*t16)/ii;
end

% ��#�i�Ⴂ�j
rasl16 = 0;
for ii = 1:2:49
	rasl16 = rasl16 + sin(2*pi*ii*f_dol*2^(10/12)*t16)/ii;
end

% �V�i�Ⴂ�j
shil16 = 0;
for ii = 1:2:49
	shil16 = shil16 + sin(2*pi*ii*f_dol*2^(11/12)*t16)/ii;
end

% �h
do16 = 0;
for ii = 1:2:49
	do16 = do16 + sin(2*pi*ii*f_do*t16)/ii;
end

% �h#
dos16 = 0;
for ii = 1:2:49
	dos16 = dos16 + sin(2*pi*ii*f_do*2^(1/12)*t16)/ii;
end

% ��
re16 = 0;
for ii = 1:2:49
	re16 = re16 + sin(2*pi*ii*f_do*2^(2/12)*t16)/ii;
end

% ��#
res16 = 0;
for ii = 1:2:49
	res16 = res16 + sin(2*pi*ii*f_do*2^(3/12)*t16)/ii;
end

% �~
mi16 = 0;
for ii = 1:2:49
	mi16 = mi16 + sin(2*pi*ii*f_do*2^(4/12)*t16)/ii;
end

% �t�@
fa16 = 0;
for ii = 1:2:49
	fa16 = fa16 + sin(2*pi*ii*f_do*2^(5/12)*t16)/ii;
end

% �t�@#
fas16 = 0;
for ii = 1:2:49
	fas16 = fas16 + sin(2*pi*ii*f_do*2^(6/12)*t16)/ii;
end

% �\
so16 = 0;
for ii = 1:2:49
	so16 = so16 + sin(2*pi*ii*f_do*2^(7/12)*t16)/ii;
end

% �\#
sos16 = 0;
for ii = 1:2:49
	sos16 = sos16 + sin(2*pi*ii*f_do*2^(8/12)*t16)/ii;
end

% ��
ra16 = 0;
for ii = 1:2:49
	ra16 = ra16 + sin(2*pi*ii*f_do*2^(9/12)*t16)/ii;
end

% ��#
ras16 = 0;
for ii = 1:2:49
	ras16 = ras16 + sin(2*pi*ii*f_do*2^(10/12)*t16)/ii;
end

% �V
shi16 = 0;
for ii = 1:2:49
	shi16 = shi16 + sin(2*pi*ii*f_do*2^(11/12)*t16)/ii;
end

% �h�i�����j
doh16 = 0;
for ii = 1:2:49
	doh16 = doh16 + sin(2*pi*ii*f_doh*t16)/ii;
end

% ���i�����j
reh16 = 0;
for ii = 1:2:49
	reh16 = reh16 + sin(2*pi*ii*f_doh*2^(2/12)*t16)/ii;
end

% �h#�i�����j
dosh16 = 0;
for ii = 1:2:49
	dosh16 = dosh16 + sin(2*pi*ii*f_doh*2^(1/12)*t16)/ii;
end

% ��#�i�����j
resh16 = 0;
for ii = 1:2:49
	resh16 = resh16 + sin(2*pi*ii*f_doh*2^(3/12)*t16)/ii;
end

% �~�i�����j
mih16 = 0;
for ii = 1:2:49
	mih16 = mih16 + sin(2*pi*ii*f_doh*2^(4/12)*t16)/ii;
end

% �t�@�i�����j
fah16 = 0;
for ii = 1:2:49
	fah16 = fah16 + sin(2*pi*ii*f_doh*2^(5/12)*t16)/ii;
end

% �t�@#�i�����j
fash16 = 0;
for ii = 1:2:49
	fash16 = fash16 + sin(2*pi*ii*f_doh*2^(6/12)*t16)/ii;
end

% ���i�����j
rah16 = 0;
for ii = 1:2:49
	rah16 = rah16 + sin(2*pi*ii*f_doh*2^(9/12)*t16)/ii;
end

% ���_4������
% �h�i�Ⴂ�j
dol4fu = 0;
for ii = 1:2:49
	dol4fu = dol4fu + sin(2*pi*ii*f_dol*t4futen)/ii;
end

% �h#�i�Ⴂ�j
dosl4fu = 0;
for ii = 1:2:49
	dosl4fu = dosl4fu + sin(2*pi*ii*f_dol^(1/12)*t4futen)/ii;
end

% �~�i�Ⴂ�j
mil4fu = 0;
for ii = 1:2:49
    mil4fu = mil4fu + sin(2*pi*ii*f_dol*2^(4/12)*t4futen)/ii;
end

% �t�@�i�Ⴂ�j
fal4fu = 0;
for ii = 1:2:49
	fal4fu = fal4fu + sin(2*pi*ii*f_dol*2^(5/12)*t4futen)/ii;
end

% �t�@
fa4fu = 0;
for ii = 1:2:49
	fa4fu = fa4fu + sin(2*pi*ii*f_do*2^(5/12)*t4futen)/ii;
end

% �\
so4fu = 0;
for ii = 1:2:49
	so4fu = so4fu + sin(2*pi*ii*f_do*2^(7/12)*t4futen)/ii;
end

% ��
ra4fu = 0;
for ii = 1:2:49
	ra4fu = ra4fu + sin(2*pi*ii*f_do*2^(9/12)*t4futen)/ii;
end

% ��#
ras4fu = 0;
for ii = 1:2:49
	ras4fu = ras4fu + sin(2*pi*ii*f_do*2^(10/12)*t4futen)/ii;
end

% �V
shi4fu = 0;
for ii = 1:2:49
	shi4fu =shi4fu + sin(2*pi*ii*f_do*2^(11/12)*t4futen)/ii;
end

% �h�i�����j
doh4fu = 0;
for ii = 1:2:49
	doh4fu = doh4fu + sin(2*pi*ii*f_doh*t4futen)/ii;
end

% �h#�i�����j
dosh4fu = 0;
for ii = 1:2:49
	dosh4fu = dosh4fu + sin(2*pi*ii*f_doh*2^(1/12)*t4futen)/ii;
end

% ��#�i�����j
resh4fu = 0;
for ii = 1:2:49
	resh4fu = resh4fu + sin(2*pi*ii*f_doh*2^(3/12)*t4futen)/ii;
end

% �~�i�����j
mih4fu = 0;
for ii = 1:2:49
	mih4fu = mih4fu + sin(2*pi*ii*f_doh*2^(4/12)*t4futen)/ii;
end

% ���i�����j
rah4fu = 0;
for ii = 1:2:49
	rah4fu = rah4fu + sin(2*pi*ii*f_doh*2^(9/12)*t4futen)/ii;
end


% ----- ���y�̍쐬 -----
% �����̂ŏ��߂��Ƃɔz����쐬����D
% �Ō��1�̔z��ɂ܂Ƃ߂�D
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

% ���߂��q����
gymlast = [gym15(1:(length(gym15)+length(gym16)+length(gym17)-length(ze3))), ...
    [gym15((length(gym15)+length(gym16)+length(gym17)-length(ze3))+1:length(gym15)), ...
    gym16, gym17].*ze3];            % �t�F�[�h�A�E�g
gym = [gym1, gym2, gym3, gym4, gym5, gym6, gym7, gym8, gym9, gym10, ...
    gym11, gym12, gym13, gym14, gym15, gym16, gym17, gym18, gym19, gym20, ...
    gym21, gym22, gym23, gym24, gym2526, gym27, gym28, gym29, gym30, ...
    gym31, gym32, gym3334, gym35, gym36, gym3738, gym39, gym40, ...
    gym41, gym42, gym43, gym44, ...
    gym11, gym12, gym13, gym14, gymlast];
gym = (gym/max(abs(gym)))*0.99;     % ���K��


% ----- �Đ� -----
playblocking(audioplayer(gym, fs))    % gym�̍Đ�

% ----- �ۑ� -----
%audiowrite('Vs_GimReader_kanto.wav', gym, fs)      % gym��ۑ�

return