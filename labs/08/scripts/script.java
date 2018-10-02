Script started on Thu 05 Apr 2018 02:14:00 PM EDT
igc2@kernighan:~/workspace/214/labs/08/java$ ls
Makefile  Name.java  NameTester.java  script.java
igc2@kernighan:~/workspace/214/labs/08/java$ cat Name.java NameTester.java Name    MakeFi  file
/* Name.java implements class Name
 * Begun by: Prof. Adams, for CS 214 at Calvin College
 * Student: Ian Graham Christensen, for CS 214 at Calvin College
 * Date: Spring, 2018
 */

// the Name class appears outside of the rest of the program
class Name {

  // Name object constructor with initialization  
  public Name(final String first, final String middle, final String last) {
      myFirst = first;
      myMiddle = middle;
      myLast = last;
  }
 
  // extractor for first name of a Name object
  public final String getFirst() {
      return myFirst;
  }

  // extractor for middle name of a Name object
  public final String getMiddle() {
      return myMiddle;
  }

  // extractor for last name of a Name object
  public final String getLast() {
      return myLast;
  }
  
  // return string created by piecing together first, middle, and last names
  public final String toString() {
      return myFirst + ' ' + myMiddle + ' ' + myLast;
  }

  private String myFirst, myMiddle, myLast;  // private instance variables
}
/* NameTester.java is a 'driver' to test class Name
 * Begun by: Prof. Adams, for CS 214 at Calvin College
 * Student: Ian Graham Christensen, for CS 214 at Calvin College
 * Date: Spring, 2018
 */

public class NameTester  
{
  public static void main(String[] args)
  {
      Name aName = new Name("John", "Paul", "Jones");
      assert aName.getFirst().equals("John") ;
      assert aName.getMiddle().equals("Paul") ;
      assert aName.getLast().equals("Jones") ;
      System.out.println(aName);
      assert aName.toString().equals("John Paul Jones");
      System.out.println("All tests passed!");
  }
}
NameTester: Name.class NameTester.class

Name.class: Name.java
	javac -deprecation Name.java

NameTester.class: NameTester.java
	javac -deprecation NameTester.java

clean:
	rm -f *.class *~ *# *.o
igc2@kernighan:~/workspace/214/labs/08/java$ make
javac -deprecation Name.java
javac -deprecation NameTester.java
igc2@kernighan:~/workspace/214/labs/08/java$ java NameTester
John Paul Jones
All tests passed!
igc2@kernighan:~/workspace/214/labs/08/java$ make clean
rm -f *.class *~ *# *.o
igc2@kernighan:~/workspace/214/labs/08/java$ ls
Makefile  Name.java  NameTester.java  script.java
igc2@kernighan:~/workspace/214/labs/08/java$ exit

Script done on Thu 05 Apr 2018 02:14:46 PM EDT
