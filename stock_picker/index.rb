def stock_picker(arr)
    max = arr[1] - arr[0]
    for i in 0...arr.length-1 do
        for j in i+1...arr.length-1 do
            if max < arr[j]-arr[i]
                max = arr[j]-arr[i]
            end
        end
    end
    puts max
end
    
stock_picker([17,3,6,9,15,8,6,1,10])