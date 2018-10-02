/* Tester.java implements class Temperature
 * Author: Ian Christensen, CS 214 at Calvin College
 * Date: Spring, 2018
 */

import java.util.Scanner;
import java.text.DecimalFormat;

public class Tester {

	/* Function: main, acts as a driver for Temperature class
	 * Parameters: String[] args, a list of strings
	 * Preconditions: file is running
	 * Returns: results of runTests and outputTable
	 */
	public static void main(String[] args) {
		runTests();
		outputTable();
	}

	public static void outputTable() {
		Scanner keyboard = new Scanner(System.in);
		System.out.print("Enter the base temperature: ");
		String baseStr = keyboard.nextLine();
		System.out.print("Enter the limit temperature: ");
		String limitStr = keyboard.nextLine();
		System.out.print("Enter the step value: ");
		double step = keyboard.nextDouble();
		Temperature base = Temperature.fromString(baseStr);
		Temperature limit = Temperature.fromString(limitStr);

		System.out.println("Celsius   |   Fahrenheit   |   Kelvin");
		while (base.lessThan(limit)) {
			System.out.println(base.toCelsius() + "   |   " + base.toFahrenheit() + "   |   " + base.toKelvin());
			base = base.raise(step);
		}
	}

	public static void runTests() {
		DecimalFormat truncate = new DecimalFormat("#.##");

		// constructor
		System.out.print("Testing Constructor... ");
		Temperature aTemp = new Temperature(25.0, 'C');
		assert truncate.format(aTemp.getDegrees()).equals("25");
		assert aTemp.getScale() == 'C';
		System.out.print("Passed!\n");

		// toCelsius
		System.out.print("Testing toCelsius... ");
		aTemp = aTemp.toCelsius();
		assert truncate.format(aTemp.getDegrees()).equals("25");
		assert aTemp.getScale() == 'C';
		System.out.print("Passed!\n");

		// toFahrenheit
		System.out.print("Testing toFahrenheit... ");
		aTemp = aTemp.toFahrenheit();
		assert truncate.format(aTemp.getDegrees()).equals("77");
		assert aTemp.getScale() == 'F';
		System.out.print("Passed!\n");

		// toKelvin
		System.out.print("Testing toKelvin... ");
		aTemp = aTemp.toKelvin();
		assert truncate.format(aTemp.getDegrees()).equals("298.15");
		assert aTemp.getScale() == 'K';
		System.out.print("Passed!\n");

		// fromString
		System.out.print("Testing fromString... ");
		aTemp = aTemp.fromString("86 F");
		assert truncate.format(aTemp.getDegrees()).equals("86");
		assert aTemp.getScale() == 'F';
		System.out.print("Passed!\n");

		// toString
		System.out.println("Testing toString... \tExpected Output: 86 F\tOutput: " + aTemp);

		// raise
		System.out.print("Testing raise... ");
		aTemp = aTemp.raise(10.0);
		assert truncate.format(aTemp.getDegrees()).equals("96");
		assert aTemp.getScale() == 'F';
		System.out.print("Passed!\n");

		// lower
		System.out.print("Testing lower... ");
		aTemp = aTemp.lower(10.0);
		assert truncate.format(aTemp.getDegrees()).equals("86");
		assert aTemp.getScale() == 'F';
		System.out.print("Passed!\n");

		// equalTo
		System.out.print("Testing equalTo... ");
		Temperature aTemp2 = aTemp.toCelsius();
		assert aTemp.equalTo(aTemp2);
		aTemp2 = aTemp2.raise(10.0);
		assert !(aTemp.equalTo(aTemp2));
		System.out.print("Passed!\n");

		// lessThan
		System.out.print("Testing lessThan... ");
		assert aTemp.lessThan(aTemp2);
		aTemp2 = aTemp2.lower(10.0);
		assert !(aTemp.lessThan(aTemp2));
		System.out.print("Passed!\n");

		// validTemperature
		System.out.print("Testing validTemperature... (should throw three errors) \n");
		assert aTemp.validTemperature(10.0, 'F');
		assert aTemp.validTemperature(10.0, 'J') == false;
		assert aTemp.validTemperature(-100.0, 'K') == false;
		assert aTemp.validTemperature(151683385000000005000000000000000.0, 'K') == false;
		System.out.println("Passed!\n");

		System.out.println("Passed All Tests!\n");
	}
}
