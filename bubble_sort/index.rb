def bubble_sort(arr)
    for j in 0...arr.length-1 do 
        for i in 0...arr.length-1 do
            if arr[i] > arr[j+1]
                temp = arr[i]
                arr[i] = arr[i+1]
                arr[i+1] = temp
            end
        end
    end
    print arr
    print("\n")
end

bubble_sort([4,3,78,2,0,2])