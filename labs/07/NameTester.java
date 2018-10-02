/* NameTester.java is a 'driver' to test class Name
 * Begun by: Prof. Adams, for CS 214 at Calvin College
 * Student: Ian Christensen, for CS 214 at Calvin College
 * Date: Spring, 2018
 */

// Driver for testing the name class
public class NameTester {
	public static void main(String[] args) {
		Name aName = new Name("John", "Paul", "Jones");
		assert aName.getFirst().equals("John");
		assert aName.getMiddle().equals("Paul");
		assert aName.getLast().equals("Jones");
		System.out.println(aName);
		assert aName.toString().equals("John Paul Jones");
		System.out.println("All tests passed!");
	}
}

// Class for a name object
class Name {
	private String myFirst, myMiddle, myLast;
	public Name(String first, String middle, String last) {
		myFirst = first;
		myMiddle = middle;
		myLast = last;
	}
	public String getFirst() { return myFirst; }
	public String getMiddle() { return myMiddle; }
	public String getLast() { return myLast; }
	public String toString() { return myFirst + ' ' + myMiddle + ' ' + myLast; }
};
