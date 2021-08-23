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
                begin
                    subs << args[j][i]
                rescue
                    subs << nil
                    p 'flag 1'
                end
                j += 1
            end
            result << subs
            i += 1
        end
        result
    end


    def my_rotate(n=1)
        new_array = self.dup
        if n > 0 
            n.times do 
                ele = new_array.shift
                new_array << ele
                # new_array.unshift(ele)
            end
        elsif n < 0
            (-n).times do
                ele = new_array.pop
                new_array.unshift(ele)
            end

        else
            return new_array
        end
        new_array
    end

    def my_join(separator = "")
        new_str = ""
        
        self.my_each do |ele|
            new_str += ele + separator
        end
        return new_str[0...-1] unless separator == ""
        new_str
    end

end

a = [ "a", "b", "c", "d" ]
p a.my_join         # => "abcd"
p a.my_join("$")    # => "a$b$c$d"

