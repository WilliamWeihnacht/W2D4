def no_dupes?(arr)
    ret = []
    i = 0
    while i < arr.length
        if arr[i+1] && !arr[i+1..-1].include?(arr[i])
            ret<<arr[i]
        end
        i+=1
    end
    ret
end

p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])            # => []