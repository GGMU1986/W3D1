class Array

    # def my_each_block(&prc) 
    #     i = 0

    #     while i < self.length
    #         prc.call(self[i])
    #         i += 1
    #     end
    # end

    def my_each(&prc)
        i = 0

        while i < self.length 
            prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc)
        selected = []
        i = 0
        self.my_each do |ele|
            selected << ele if prc.call(ele)
        end
        selected
    end
    
    def my_reject(&prc)
        rejected = []

        self.my_each do |ele|
            rejected.push(ele) unless prc.call(ele)
        end
        rejected
    end

    def my_any?(&prc)
        self.my_each do |ele|
            return true if prc.call(ele)
        end
        false
    end

    def my_all?(&prc)
        self.my_each do |ele|
            return false unless prc.call(ele)
        end
        return true
    end

    def my_flatten
        flattened = []
        
    end

    def my_zip(*args)
        i = 0
        result = []

        while i < self.length #=> 1
            subs = [self[i]]
            j = 0
            while j < args.length #=> 1
                subs << args[j][i]
                j += 1
            end
            result << subs
            i += 1
        end
        result
    end


end

a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]

