require "byebug"

# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)

    if num_1 > num_2
        max = num_1
    else
        max = num_2
    end

    (max..(num_1*num_2)).each do |x|
        if (x % num_1 == 0) && (x % num_2 == 0)
            return x
        end
    end
    return num_1 * num_2

end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    hash = Hash.new(0)

    i = 0
    while i < str.length
        if str[i+1] != nil
            temp = str[i] + str[i+1]
            hash[temp] += 1
        end
        i+=1
    end

    return hash.max_by {|k,v| v}[0]

end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        hash = {}
        self.each_pair do |k,v|
            hash[v] = k
        end
        hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0
        (0...self.length).each do |x|
            (0...self.length).each do |y|
                if y > x && self[x] + self[y] == num
                    count += 1
                end
            end
        end
        count
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)


        if prc

            swapped = true
            while swapped do
                swapped = false
                i = 0
                while i < self.length
                    if self[i+1] && prc.call(self[i],self[i+1]) == 1
                        self[i],self[i+1] = self[i+1],self[i]
                        swapped = true
                    end
                    i += 1
                end
            end


        else
            swapped = true
            while swapped do
                swapped = false
                i = 0
                while i < self.length
                    if self[i+1] && self[i] > self[i+1]
                        self[i],self[i+1] = self[i+1],self[i]
                        swapped = true
                    end
                    i += 1
                end
            end
        end
        self
    end
end
