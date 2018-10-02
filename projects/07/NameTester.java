/* NameTester.java is a 'driver' to test class Name
 * Begun by: Prof. Adams, for CS 214 at Calvin College
 * Student: Ian Christensen, for CS 214 at Calvin College
 * Date: Spring, 2018
 */

import java.util.Scanner;

public class NameTester {

	/* Function: main, the main driver that tests class Name
	 * Parameter: args, an array of string arguments
	 * Precondition: file must be running
	 * Returns: text that confirms the tests have passed
	 */
	public static void main(String[] args) {
		Scanner keyboard = new Scanner(System.in);
		Name aName = new Name("John", "Paul", "Jones");
		assert aName.getFirst().equals("John");
		assert aName.getMiddle().equals("Paul");
		assert aName.getLast().equals("Jones");
		assert aName.toString().equals("John Paul Jones");
		assert aName.lfmiFormat().equals("Jones, John P.");
		System.out.println("\n" + aName);

		aName.setFirst("Joel");
		aName.setMiddle("Saul");
		aName.setLast("James");
		assert aName.getFirst().equals("Joel");
		assert aName.getMiddle().equals("Saul");
		assert aName.getLast().equals("James");
		System.out.println(aName);

		aName.newName(keyboard);
		System.out.println("You entered: " + aName);

		System.out.println("All tests passed!\n");
	}
}

class Name {

	// private initialization of Name attributes
	private String myFirst, myMiddle, myLast;

	// constructor methods for Name
	public Name(String first, String middle, String last) {
		myFirst = first;
		myMiddle = middle;
		myLast = last;
	}

	// Accessor methods for Name object
	public String getFirst() { return myFirst; }
	public String getMiddle() { return myMiddle; }
	public String getLast() { return myLast; }

	// Mutator methods for Name object
	public void setFirst(String aFirst) { myFirst = aFirst; }
	public void setMiddle(String aMiddle) { myMiddle = aMiddle; }
	public void setLast(String aLast) { myLast = aLast; }

	/* Procedure: toString, stringifies the Name object
	 * Precondition: myFirst, myMiddle, and myLast exist
	 * Returns: a stringified Name object
	 */
	public String toString() {
		return myFirst + ' ' + myMiddle + ' ' + myLast;
	}

	/* Procedure: lfmiFormat (lfmi), formats the Name object
	 * Precondition: myFirst, myMiddle, and myLast exist
	 * Returns: a formatted Name string
	 */
	public String lfmiFormat() {
		return myLast + ", " + myFirst + " " + myMiddle.charAt(0) + ".";
	}

	/* Function: newName, allows the user to change the Name object
	 * Parameter: keyboard, Scanner object
	 * Precondition: Name object has been initialized
	 */
	public void newName(Scanner keyboard) {
		System.out.print("Enter the first name: ");
		myFirst = keyboard.nextLine();
		System.out.print("Enter the middle name: ");
		myMiddle = keyboard.nextLine();
		System.out.print("Enter the last name: ");
		myLast = keyboard.nextLine();
	}
};
