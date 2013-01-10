#Interview Zen
#Home
#Create an Interview
#joshua montross
#Total duration: 46:22 Done on January 9th, 2013

#Question 1
#In Ruby, extend the class for integers with a method that, given any non-negative integer value, returns the number of 1 bits in that value.  In Ruby comments, write a short explanation of how your code works, and how the amount of time and memory your code takes to run is affected by the values supplied to it. Efficiency does matter. You are strongly encouraged to try running your solution before hitting "Submit", to verify that it actually runs.

#TWO MORE QUESTIONS following this one. The second question is about equivalent to this one in difficulty, the third one is a more substantial high-level task, but does not require writing actual code.
class Integer

  def one_bits?
    # to binary
    binary = self.to_s(2)
    # to array and remove zeroes
    one_bits = binary.split(//).delete_if  {|v| v == "0"}
    # return number of ones
    return one_bits.length
  end


end

## 123.one_bits?
### => 6
#0:00 / 10:48
#
#play
#1x
#2x
#5x
#Question 2
#Write an alternate version of the Ruby "flatten" method for arrays that gives the same results as the built-in method, without using the built-in method at any point.
#
##ONE MORE QUESTION after this one. The last question is a bigger task, but does not need to be answered with actual, runnable code.

class Array

  def flattened
    array_within = false

    self.each_with_index do |item,index|
      if item.class == Array
        temp_array = item
        array_within = true
        starting_index = index
        next_index = nil
        item.each do |array_item|
          # if we have already found an item to insert in the flattened array from this array
          # within the array then add the next item to the next spot in our array
          next_index = next_index.nil? ?  starting_index : next_index +=1

          # if this is the first item to replace then replace the array at this spot
          if next_index == starting_index
            self[starting_index] = array_item
          ## otherwise we already flattened this array and want to insert the rest of the items after
          else
            self.insert(next_index,array_item)
          end
        end
      end
    end


    # recurse until we dont find any arrays
    if array_within == true
      self.flattened
    else
      return self
    end

  end

end

# i recognize this is not the most efficient solution, but it is the first one I found and it works

## [1,2,[3,4]].flattened
# => [1, 2, 3, 4]
#1.9.3p194 :343 > [1,2,[3,4,[3,3]]].flattened
# => [1, 2, 3, 4, 3, 3]
#0:00 / 29:07
#
#play
#1x
#2x
#5x
#Question 3
#You have lists of customers from five different sources. Each source has several thousand entries, possibly with overlap and inexact duplication (i.e., multiple, slightly different entries for the same person), and in each entry, one primary name and up to ten aliases, which may include exact duplicates, completely different names, initials, or trivial spelling differences (e.g. "george ford", "g. Rumford Ford", "Georgie Ford", and "georgerford"). Each name has a "best" spelling, which usually includes both upper- and lowercase letters. Your task is to create a master index, with one entry for each unique customer, having a canonical "best" name, a list of all aliases, and references back to the original source records. Describe your strategy for building such an index.  There's no need to write actual code, just give a high-level step-by-step description of the overall process.
#
#THIS IS THE LAST QUESTION. When you hit "Submit" on this page, you are done.
#I would use a couple database tables and create an index on the "best names" on a table called master_index.
#In my other table of aliases I'd reference the best name with a foreign key reference.
#
#For removing dupliates and slightyl different entires I'd do some matching to see if the name is similar to a name we already have.
#We could flag as a possible duplicate and have a human review.
#
#This isn't my best work but to be frank I don't really like this problem/type of problem and I am hungry.
#
#I think the other two problems demonstrate I can code, and for this type of problem I'd prefer to discuss with a coworker and have more details about the problem.  Why are we trying to build this index?
#What is the problem the customer is experiencing?  Then we can come to the best solution together.
#
#Thanks for your time,
#~Josh
#0:00 / 6:18
#
#play#
#1x
#2x
#5x
#© 2012 Interview Zensupport@interviewzen.com#
#