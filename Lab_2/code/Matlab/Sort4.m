function sorted_4 = Sort4(X)   % 放入函數內的值 & 函數輸出值 都可以是向量
    if X(1) > X(2)          % 第一層比較
        temp1 = X(1);
        temp2 = X(2);
    else
        temp1 = X(2);
        temp2 = X(1);
    end

    if X(3) > X(4)
        temp3 = X(3);
        temp4 = X(4);
    else
        temp3 = X(4);
        temp4 = X(3);
    end

    if temp1 > temp3    % 第二層比較，找出最大值 a1、最小值 a4
        a1 = temp1;
        mid1 = temp3;
    else
        a1 = temp3;
        mid1 = temp1;
    end

    if temp2 > temp4
        a4 = temp4;
        mid2 = temp2;
    else
        a4 = temp2;
        mid2 = temp4;
    end

    if mid1 > mid2     % 第三層比較，找出中間值 a2、a3
        a2 = mid1;
        a3 = mid2;
    else
        a2 = mid2;
        a3 = mid1;
    end
sorted_4 = [a1, a2, a3, a4];   % 將排序完的值存入陣列
end