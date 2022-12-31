def fib(n)
    arr = [0,1]
    for i in 2...n
        arr << arr[i-2] + arr[i-1]
    end
    puts arr
end

def fib_rec(n)
    if n <= 2
        [0,1]
    else
        return fib_rec(n-1) << (fib_rec(n-1)[n-2] + fib_rec(n-1)[n-3])
    end
end

    
    


puts fib_rec(8)