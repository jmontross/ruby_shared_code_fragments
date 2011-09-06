class Prime

def initialize(number)
  puts "find the number of primes leading to #{number}"
  @prime_numbers = []
  @start = number
  @number = number
  @prime = false
  while @number>1
    @prime = false
    #  at ruby jumpstart intro learned the .odd and .even methods
    if @number.odd? 
      cur_number = @number
      divisor = @number
        if cur_number%cur_number == 0 && cur_number%1 == 0 
          then @prime=true 
        end
      i= 1  
      while divisor>2
        puts "#{@number} is current test with divisor #{divisor}"
        divisor = cur_number - i
          if cur_number%divisor == 0
          then 
            puts "#{@number} is not prime - it is divisible by #{divisor}" 
            divisor=1 
            @prime=false
          elsif cur_number%divisor !=0 && divisor == 2
          then 
            puts "#{@number} is divisible by one and itself" 
          end  
        i += 1 
      end
      if @prime==true 
        then @prime_numbers << cur_number 
      end
    end  
  @number -= 1
  end
  puts "#{@prime_numbers.length} is total number of prime numbers before and including #{@start}" 
end

end
  
Prime.new(613)