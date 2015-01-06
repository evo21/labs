Read the manual page for a unix command with man or woman. What command did you read about? What does it do? Bonus: Do a command we didn't cover in class.

 * I read the doc on 'wc', which is a utility that displays the number of lines, words, and bytes (in that order) for each input file, or for an input.  The order of output is always line, word, byte, and file name, unless -options are chosen, which report only the info requested by the -option.


 Describe 2 methods that strings have but symbols don't...
* '.swapcase' ==> Returns a copy of str with uppercase alphabetic characters converted to lowercase and lowercase characters converted to uppercase.
* e.g., "IheartTACOS".swapcase   #=> "iHEARTtacos"

* '.to_i' ==> Returns the result of interpreting leading characters in str as an integer (Default is base 10). If there is not a valid number at the start of str, 0 is returned.

 ...and vice versa. 
* '.id2name' ==> Returns the name or string corresponding to sym.
* e.g., :ihearttacos.id2name   #=> "ihearttacos" (returns a string)

* '.to_proc' ==> Returns a Proc object which respond to the given method by sym.  (I have no idea what this means, but i's an undefined method for a string.)


Pick a method defined on the Enumerable class (arrays, etc). What does it do and when might you use it?
* '.map' -- Used with { |obj| block } ==> Returns a new array with the results of running block once for every element in the array.
* e.g., [1,2,3,4].map {|foo| foo*foo*foo}  #=> [1, 8, 27, 64]
