Script started on Wed 25 Apr 2018 08:50:09 PM EDT
igc2@wirth:~/workspace/214/labs/11/ruby$ cat threaded_array_sum.rb
# array_sum.rb sums the values in an array
#
# Begun by: Prof. Adams, for CS 214 at Calvin College
# Completed by: Ian Christensen, for CS 214 at Calvin College
# Date: Spring, 2018
#
# Usage: ruby array_sum.rb <inFileName>

# make certain the input file was specified on the command-line
def checkCommandLine
  if ARGV.length != 2
     puts "\nUsage: sum <inFileName> <numThreads>\n\n"
     exit(1)
  end
end

# return: an array containing the values from the file
#  whose name was specified on the command-line
def readFile
   strArray = IO.readlines( ARGV[0] )
   intArray = Array.new( Integer(strArray[0]) )
   for i in 2..strArray.size
      if  !strArray[i].nil?
         intArray[i-2] = Integer( strArray[i].chomp )
      end
   end
   intArray 
end

def sumSlice(values, id, sliceSize)
  start = id * sliceSize
  stop = start + sliceSize - 1
  myTotal = 0
  for i in start..stop
     myTotal += values[i]
  end
  myTotal
end

def sumInParallel(values, numThreads)
sliceSize = values.size / numThreads
threadArray = Array.new( numThreads )
result = 0
lock = Mutex.new

(1..numThreads-1).each do | i |
    threadArray[i] = Thread.new { 
                      myTotal = sumSlice(values, 
                                           i,
                                           sliceSize) 
                      lock.synchronize {
                          result += myTotal
                      }
    }
end

myTotal  = sumSlice(values, 0, sliceSize)

leftovers = values.size % numThreads
if leftovers > 0
   for i in values.size-leftovers..values.size-1
      myTotal += values[i]
   end
end

lock.synchronize {
   result += myTotal
}

for i in 1..numThreads-1
   threadArray[i].join
end

result
end

def main
   checkCommandLine
   values = readFile
   startTime = Time.now
   total = sumInParallel(values, Integer(ARGV[1]))
   endTime = Time.now
   interval = (endTime - startTime).to_f
   puts "\nThe sum is #{total}\n"
   printf(" and computing it took %.9f seconds.\n\n", interval)
end

main
igc2@wirth:~/workspace/214/labs/11/ruby$ ruby threaded_array_sum.rb /home/. cs/214 /labs/11/numbers/10000000numbers.txt 1

The sum is 505053538
 and computing it took 0.410032905 seconds.

igc2@wirth:~/workspace/214/labs/11/ruby$ ruby threaded_array_sum.rb /home/cs/214//labs/11/numbers/10000000numbers.txt 1 4

The sum is 505053538
 and computing it took 0.418155253 seconds.

igc2@wirth:~/workspace/214/labs/11/ruby$ exit

Script done on Wed 25 Apr 2018 08:51:47 PM EDT
