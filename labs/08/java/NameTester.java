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
