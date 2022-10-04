% random_sq = randsample(-128:127,32);    生成隨機32碼序列 {-128, 127}
% 每題統一用相同的序列
random_sq = [100 54 -121 19 -113 28 -82 122 30 92 39 55 62 98 -2 -3 -67 -118 ...
    56 78 -8 71 -78 -86 -6 50 -94 -101 0 46 -43 103];
temp = random_sq(1);
for i = 1:31          % sequential comparator 搜尋出最大值，temp 用來記錄最大值，index 用來記錄索引值
   if temp > random_sq(1+i)
       temp = temp;
   else
       temp = random_sq(1+i);
       index = 1+i;
   end
end
fprintf('序列中的最大值 = %d\n', temp);
fprintf('對應的索引值 = %d\n', index);
stem(random_sq)
title('random sequence')