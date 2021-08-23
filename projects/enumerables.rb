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
    


end

#my_select
# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []