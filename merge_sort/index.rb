#if arr.length < 2
# return
#else
#sort right half
#sort left half
#return merge halfs

#merge function(a1,a2)
#j=0
#for a1.length
#if a1[i] > a2[i]
#result << a2[i]
#result << a1[i]
#j+=2
#return result
def merge(arr1, arr2)
    result = Array.new(arr1.length + arr2.length) 
    i = 0
    while i < arr1.length || i < arr2.length
      if i >= arr1.length
        # if we've reached the end of arr1, just add the remaining elements from arr2
        result[i] = arr2[i]
      elsif i >= arr2.length
        # if we've reached the end of arr2, just add the remaining elements from arr1
        result[i] = arr1[i]
      elsif arr1[i] >= arr2[i]
        result[i] = arr2[i]
        result[i + arr1.length] = arr1[i]
      else
        result[i] = arr1[i]
        result[i + arr1.length] = arr2[i]
      end
      i += 1
    end
    result
  end
  
            

def merge_sort(arr)
    if arr.length < 2
        return arr
    else
        # split the array into two and then sort
        first_half = merge_sort(arr.slice(0, arr.length / 2))
        second_half = merge_sort(arr.slice(arr.length / 2, arr.length))
    end
    #merge the two halfs
    merge(first_half, second_half)
end

sorted = merge_sort([2,4,3,1,5,6,7,8])
print sorted
puts ""
        
        

