%random_sq = randsample(-128:127,32);    生成隨機32碼序列 {-128, 127}
% 每題統一用相同的序列
random_sq = [100 54 -121 19 -113 28 -82 122 30 92 39 55 62 98 -2 -3 -67 -118 ...
    56 78 -8 71 -78 -86 -6 50 -94 -101 0 46 -43 103];

X = Sort4(random_sq(1:4));      % Sort4 函數將陣列內 4 個數字由大到小排列

fprintf('輸入為');
random_sq(1:4)
fprintf('Sort4 輸出為');
X