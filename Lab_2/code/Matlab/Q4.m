% Q4
% Block SelectTop6

%random_sq = randsample(-128:127,32);    生成隨機32碼序列 {-128, 127}
% 每題統一用相同的序列
random_sq = [100 54 -121 19 -113 28 -82 122 30 92 39 55 62 98 -2 -3 -67 -118 ...
    56 78 -8 71 -78 -86 -6 50 -94 -101 0 46 -43 103];

% 將序列分成 8 個 Group 再分別用 Sort4 函數將 Group 內的數字由大到小排列
G = [];
for i =1:8                                  % 整個序列分成 8 個 Group，每個 Group 有 4 個數字
    A = Sort4(random_sq(4*i-3:4*i))';       % Sort4 函數將 Group 內的數字由大到小排列
    G = [G, A];
end

% Comparator Tree，選出前 6 大的值 & 索引值

Group_row = [1 1 1 1 1 1 1 1];       % Comparator Tree 進行比較時先從各 Group 的第一列開始比較
SelectTop6 = [];
for j = 1:6
    c1 = [];
    c2 = [];

    for i = 1:4                          % 第一層比較器， temp用來記錄比較器的輸出(較大的值)
        temp = comparator_max(G(Group_row(2*i-1), 2*i-1), G(Group_row(2*i), 2*i));
        c1 = [c1, temp];                 % c1 用來存放各比較器的輸出，準備進行下一層的比較
    end

    for i = 1:2                          % 第二層比較器
        temp = comparator_max(c1(2*i-1), c1(2*i));  
        c2 = [c2, temp];      
    end

    max = comparator_max(c2(1), c2(2));  % 第三層比較器
    [n, m] = find(G == max);             % 找出最大值在哪一個 Group = m
    Group_row(m) = Group_row(m) + 1;     % 下次比較從該 Group 的下一個數字開始
    SelectTop6 = [SelectTop6, max];

    if Group_row(m) > 4                  % 如果 Group 中的4個數字都被取出，則該 Group 全部為 0
        G(:, m) = [0 0 0 0];
        Group_row(m) = 1;
    end
end

Top6_index = [];
for k = 1:6                              % 求出 SelectTop6 對應到原序列 random_sq 的索引值
    index = find(random_sq == SelectTop6(k));
    Top6_index = [Top6_index, index];
end

% 將結果印出
fprintf('Block SelectTop6 輸出為\n');
SelectTop6
fprintf('對應的索引值為\n');
Top6_index