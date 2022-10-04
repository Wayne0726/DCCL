%random_sq = randsample(-128:127,32);    生成隨機32碼序列 {-128, 127}
% 每題統一用相同的序列
random_sq = [100 54 -121 19 -113 28 -82 122 30 92 39 55 62 98 -2 -3 -67 -118 ...
    56 78 -8 71 -78 -86 -6 50 -94 -101 0 46 -43 103];

c1 = [];   % c1-c4 用來存放各層比較器輸出的值
c2 = [];
c3 = [];
c4 = [];

c1_index = [];   % c1_index - c4_index 用來存放各層比較器輸出值的索引值
c2_index = [];
c3_index = [];
c4_index = [];

for i = 1:16      % 第一層比較器
    temp = comparator_max(random_sq(2*i-1), random_sq(2*i));  % temp用來記錄比較器的輸出(較大的值)
    if temp == random_sq(2*i-1)
        c1_index = [c1_index, 2*i-1];     % c1_index為比較器輸出對應到原陣列的索引值
    else
        c1_index = [c1_index, 2*i];
    end
    c1 = [c1, temp];      % c1 用來存放各比較器的輸出，準備進行下一層的比較
end

for i = 1:8       % 第二層比較器
    temp = comparator_max(c1(2*i-1), c1(2*i));
    if temp == c1(2*i-1)
        c2_index = [c2_index, c1_index(2*i-1)];
    else
        c2_index = [c2_index, c1_index(2*i)];
    end
    c2 = [c2, temp];
end

for i = 1:4       % 第三層比較器
    temp = comparator_max(c2(2*i-1), c2(2*i));
    if temp == c2(2*i-1)
        c3_index = [c3_index, c2_index(2*i-1)];
    else
        c3_index = [c3_index, c2_index(2*i)];
    end
    c3 = [c3, temp];
end

for i = 1:2       % 第四層比較器
    temp = comparator_max(c3(2*i-1), c3(2*i));
    if temp == c3(2*i-1)
        c4_index = [c4_index, c3_index(2*i-1)];
    else
        c4_index = [c4_index, c3_index(2*i)];
    end
    c4 = [c4, temp];
end

max = comparator_max(c4(1), c4(2));    % 第五層比較器
if max == c4(1)
    max_index = c4_index(1);
else
    max_index = c4_index(2);
end

% 將每層比較器的輸出跟其對應的索引值列出
fprintf('第一層比較後輸出的值為 ');
c1
fprintf('對應的索引值為 ');
c1_index

fprintf('第二層比較後輸出的值為 ');
c2
fprintf('對應的索引值為 ');
c2_index

fprintf('第三層比較後輸出的值為 ');
c3
fprintf('對應的索引值為 ');
c3_index

fprintf('第四層比較後輸出的值為 ');
c4
fprintf('對應的索引值為 ');
c4_index

fprintf('第五層比較後輸出的值為 ');
max
fprintf('對應的索引值為 ');
max_index