#!/usr/bin/env ruby

# 1.  “Queue-Tip”
# Imagine a queue that looks like the following:
# A B C D E F G H
# A is in slot 0 of the queue, and H is in slot 7.  The alphabet gods have 
# now told you to defy the order of this queue on-demand.  Your task is 
# to write a program that accepts pairs of values, one being a slot 
# number, and the other being a letter.  The program should be able to 
# accept any even combination of unique slot numbers and letters, 
# which pairs in the order of letters and numbers received, and should 
# throw an error if an odd number of arguments are passed or if a slot 
# number and letter are used more than once in the argument list.  
# Based on the input, the queue will change, and you will output the new 
# queue.  Any letters that are not defined in the arguments passed 
# should move into the open slots in alphabetical order (much like a 
# queue, ironically).  If no arguments are passed, the original queue should output.  It is also safe to throw an error if a letter that doesn’t 
# exist in the queue is passed, and also if a slot number is passed that is 
# larger than the size of the queue.  
# Example input:
# Myprog 3 A B 5 
# Expected output:
# C D E A F B G H
# Example input:
# Myprog A H 1 6 7 E
# Expected output:
# B A C D F G H E
# Bad inputs:
# Myprog A 1 A 2 
# Myprog A 1 B 3 C

#solution by joshua.montross@gmail.com 

require "test/unit"

QUEUE = "A B C D E F G H".split(" ") # one man's constant is another man's variable 
A, B, C, D, E, F, G, H = QUEUE.each {|num| num} #otherwise can't make method calls like you want with MyProg A 1 

def Myprog(*pairs)
  dup = Proc.new { |*pairs| 
    queue = "A B C D E F G H".split(" ")
    if pairs.length%2 != 0
      then
       return "error: must have even number of params!"
    elsif pairs.uniq != pairs
      then
        return "error: can't switch non unique pairs"
    else
      matchedpairnums = []
      matchedpairlets = []
      matched_pair_insert_before_lets = []
      pairs.each{|numorlet| 
        if queue.include? numorlet
          then
            matchedpairlets << numorlet
        elsif  queue[numorlet.to_i]
          then
            # puts "this test #{this}"
            matchedpairnums << numorlet.to_i
        else
           return "error: you requested a resource or position that does not exist in the queue of #{QUEUE.join(" ")}"
        end     
      }
      if matchedpairnums.length != matchedpairlets.length 
         then 
         return "error: must have equal number of nums and lets!"
      end
      queue_command = {}
      matchedpairnums.each_with_index{|num,i|
        queue_command[num] = matchedpairlets[i]
      }
      #resort the hash from largest to smallest num
      queue_command = queue_command.sort {|a,b| b <=> a}
      queue_command.each{|position_letter|
        queue.delete_if {|letter_in_queue| letter_in_queue==position_letter.last}
        queue.insert(position_letter.first.to_i,position_letter.last)
      }
    end
    queue
 }
 result_queue = dup.call *pairs
 return result_queue.join(" ")
end


class Test_Myprog < Test::Unit::TestCase
 
  def test_working
    assert_equal(Myprog(3,A,B,5),"C D E A F B G H")
    assert_equal(Myprog(A, H, 1, 6, 7, E),"B A C D F G H E")
  end
  
  def test_errors
    assert_equal(Myprog(A, 1, A, 2 ),"error: can't switch non unique pairs")
    assert_equal(Myprog(A, 1, B, 3, C),"error: must have even number of params!")
    assert_equal(Myprog(A, D, B, 3, C),"error: must have equal number of nums and lets!")
  end
  
end

puts Myprog(3,A,B,5), Myprog(A, H, 1, 6, 7, E), Myprog(A, 1, A, 2 ), Myprog(A, 1, B, 3, C)
