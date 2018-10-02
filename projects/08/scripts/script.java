Script started on Mon 09 Apr 2018 08:08:17 PM EDT
igc2@noyce-kilby:~/workspace/214/projects/08/java$ ls
Makefile  script.java  Temp.java  Tester.java
igc2@noyce-kilby:~/workspace/214/projects/08/java$ cat Temp.java Tester.java[1@M[1@a[1@k[1@e[1@f[1@i[1@l[1@e[1@ 
Tester: Temp.class Tester.class

Temp.class: Temp.java
	javac -deprecation Temp.java

Tester.class: Tester.java
	javac -deprecation Tester.java

clean:
	rm -f *.class *~ *# *.o
/* Temp.java implements class Temperature
 * Author: Ian Christensen, CS 214 at Calvin College
 * Date: Spring, 2018
 */

import java.util.Scanner;

class Temperature {

	/* Function: Temperature, constructor for Temperature object
	 * Parameters: degrees, a double; scale, a char
	 * Preconditions: the parameters must make a valid temperature
	 * Returns: a Temperature object
	 */
	public Temperature(final double degrees, final char scale) {
		validTemperature(degrees, scale);
		myDegrees = degrees;
		myScale = Character.toUpperCase(scale);
	}

	/* Function: getDegrees, accessor for degrees variable
	 * Parameters: Temperature object
	 * Preconditions: myDegrees is initialized as a double value
	 * Returns: myDegrees, a double
	 */
	public final double getDegrees() { 
		return myDegrees;
	}

	/* Function: getScale, accessor for degrees variable
	 * Parameters: Temperature object
	 * Preconditions: myScale is initialized as a char value
	 * Returns: myScale, a double
	 */
	public final char getScale() {
		return myScale;
	}

	/* Function: toCelsius, mutator for scale conversion
	 * Parameters: Temperature object
	 * Preconditions: myScale and myDegrees are initialized
	 * Returns: new Temperature object with myScale == 'C'
	 */
	public final Temperature toCelsius() {
		switch (myScale) {
			case 'C':
				return new Temperature(myDegrees, 'C');
			case 'F':
				return new Temperature((myDegrees - 32.0) * (5.0 / 9.0), 'C');
			case 'K':
				return new Temperature(myDegrees - 273.15, 'C');
		}
		return null;
	}

	/* Function: toFahrenheit, mutator for scale conversion
	 * Parameters: Temperature object
	 * Preconditions: myScale and myDegrees are initialized
	 * Returns: new Temperature object with myScale == 'F'
	 */
	public final Temperature toFahrenheit() {
		switch (myScale) {
			case 'C':
				return new Temperature(myDegrees * 1.8 + 32.0, 'F');
			case 'F':
				return new Temperature(myDegrees, 'F');
			case 'K':
				return new Temperature((myDegrees - 273.15) * 1.8 + 32.0, 'F');
		}
		return null;
	}

	/* Function: toKelvin, mutator for scale conversion
	 * Parameters: Temperature object
	 * Preconditions: myScale and myDegrees are initialized
	 * Returns: new Temperature object with myScale == 'K'
	 */
	public final Temperature toKelvin() {
		switch (myScale) {
			case 'C':
				return new Temperature(myDegrees + 273.15, 'K');
			case 'F':
				return new Temperature((myDegrees + 459.67) * 5.0 / 9.0, 'K');
			case 'K':
				return new Temperature(myDegrees, 'K');
		}
		return null;
	}

	/* Function: fromString, input for user strings
	 * Parameters: temperature_string, a string
	 * Preconditions: temperature_string is in format "0.0 C"
	 * Returns: new Temperature object
	 */
	public final static Temperature fromString(String temperature_string) {
		String[] temperature = temperature_string.split(" ");
		double degrees = Double.parseDouble(temperature[0]);
		char scale = temperature[1].charAt(0);
		return new Temperature(degrees, scale);
	}

	/* Function: toString, stringifies a Temperature object
	 * Parameters: Temperature Object
	 * Preconditions: myDegrees and myScale are initialized
	 * Returns: String format of a Temperature object
	 */
	public final String toString() {
		return String.format("%.2f %C", myDegrees, myScale);
	}

	/* Function: raise, mutator that increments a temperature's degree
	 * Parameters: raiseIncrement, a double
	 * Preconditions: the result cannot exceed the Planck Temperature
	 * Returns: new Temperature object with raised degree
	 */
	public final Temperature raise(final double raiseIncrement) {
		return new Temperature(myDegrees + raiseIncrement, myScale);
	}

	/* Function: lower, mutator that decrements a temperature's degree
	 * Parameters: lowerIncrement, a double
	 * Preconditions: the result cannot deceed absolute zero
	 * Returns: new Temperature object with lowered degree
	 */
	public final Temperature lower(final double lowerIncrement) {
		return new Temperature(myDegrees - lowerIncrement, myScale);
	}

	/* Function: equalTo, equality operator for temperature regardless of scale
	 * Parameters: otherTemperature, a Temperature object
	 * Preconditions: otherTemperature is a valid Temperature object
	 * Returns: true if equal, false if not equal
	 */
	public final boolean equalTo(final Temperature otherTemperature) {
		switch (myScale) {
			case 'C':
				return myDegrees == otherTemperature.toCelsius().getDegrees();
			case 'F':
				return myDegrees == otherTemperature.toFahrenheit().getDegrees();
			case 'K':
				return myDegrees == otherTemperature.toKelvin().getDegrees();
		}
		return false;
	}

	/* Function: lessThan, less than operator for temperature regardless of scale
	 * Parameters: otherTemperature, a Temperature object
	 * Preconditions: otherTemperature is a valid Temperature object
	 * Returns: true if less than, false if not less than
	 */
	public final boolean lessThan(final Temperature otherTemperature) {
		switch (myScale) {
			case 'C':
				return myDegrees < otherTemperature.toCelsius().getDegrees();
			case 'F':
				return myDegrees < otherTemperature.toFahrenheit().getDegrees();
			case 'K':
				return myDegrees < otherTemperature.toKelvin().getDegrees();
		}
		return false;
	}

	/* Function: validTemperature, assesses whether the degree and scale are valid
	 * Parameters: degrees, a double; scale, a char
	 * Preconditions: degrees and scale exist
	 * Returns: true, if a valid temperature
	 */
	public final boolean validTemperature(final double degrees, final char scale) {
		try {
			switch (scale) {
				case 'C':
					if (degrees > -273.15 && degrees < 141683385000000005000000000000273.15)
						return true;
					else
						throw new Exception("Degree must be between absolute zero and the Planck temperature");
				case 'F':
					if (degrees > -459.67 && degrees < 255030093000000008999999999999540.33)
						return true;
					else
						throw new Exception("Degree must be between absolute zero and the Planck temperature");
				case 'K':
					if (degrees > 0.0 && degrees < 141683385000000005000000000000000.0)
						return true;
					else
						throw new Exception("Degree must be between absolute zero and the Planck temperature");
				default:
					throw new Exception("Scale must be Celsius, Fahrenheit, or Kelvin (i.e. C, F, K)");
			}
		} catch (Exception ex) { 
			System.out.println("Invalid temperature:" + ex.getMessage());
		}
		return false;
	}

	// private declaration of variables
	private double myDegrees;
	private char myScale;
}
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

		int i = 0;
		System.out.println("Celsius   |   Fahrenheit   |   Kelvin");
		while (base.lessThan(limit)) {
			System.out.println(base.toCelsius() + "   |   " + base.toFahrenheit() + "   |   " + base.toKelvin());
			base = base.raise(step);
			i++;
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
igc2@noyce-kilby:~/workspace/214/projects/08/java$ ls
Makefile  script.java  Temp.java  Tester.java
igc2@noyce-kilby:~/workspace/214/projects/08/java$ make
javac -deprecation Temp.java
javac -deprecation Tester.java
igc2@noyce-kilby:~/workspace/214/projects/08/java$ ls
Makefile  script.java  Temperature.class  Temp.java  Tester.class  Tester.java
igc2@noyce-kilby:~/workspace/214/projects/08/java$ java -ea Tester
Testing Constructor... Passed!
Testing toCelsius... Passed!
Testing toFahrenheit... Passed!
Testing toKelvin... Passed!
Testing fromString... Passed!
Testing toString... 	Expected Output: 86 F	Output: 86.00 F
Testing raise... Passed!
Testing lower... Passed!
Testing equalTo... Passed!
Testing lessThan... Passed!
Testing validTemperature... (should throw three errors) 
Invalid temperature:Scale must be Celsius, Fahrenheit, or Kelvin (i.e. C, F, K)
Invalid temperature:Degree must be between absolute zero and the Planck temperature
Invalid temperature:Degree must be between absolute zero and the Planck temperature
Passed!

Passed All Tests!

Enter the base temperature: 0 F
Enter the limit temperature: 100 C
Enter the step value: 2.5
Celsius   |   Fahrenheit   |   Kelvin
-17.78 C   |   0.00 F   |   255.37 K
-16.39 C   |   2.50 F   |   256.76 K
-15.00 C   |   5.00 F   |   258.15 K
-13.61 C   |   7.50 F   |   259.54 K
-12.22 C   |   10.00 F   |   260.93 K
-10.83 C   |   12.50 F   |   262.32 K
-9.44 C   |   15.00 F   |   263.71 K
-8.06 C   |   17.50 F   |   265.09 K
-6.67 C   |   20.00 F   |   266.48 K
-5.28 C   |   22.50 F   |   267.87 K
-3.89 C   |   25.00 F   |   269.26 K
-2.50 C   |   27.50 F   |   270.65 K
-1.11 C   |   30.00 F   |   272.04 K
0.28 C   |   32.50 F   |   273.43 K
1.67 C   |   35.00 F   |   274.82 K
3.06 C   |   37.50 F   |   276.21 K
4.44 C   |   40.00 F   |   277.59 K
5.83 C   |   42.50 F   |   278.98 K
7.22 C   |   45.00 F   |   280.37 K
8.61 C   |   47.50 F   |   281.76 K
10.00 C   |   50.00 F   |   283.15 K
11.39 C   |   52.50 F   |   284.54 K
12.78 C   |   55.00 F   |   285.93 K
14.17 C   |   57.50 F   |   287.32 K
15.56 C   |   60.00 F   |   288.71 K
16.94 C   |   62.50 F   |   290.09 K
18.33 C   |   65.00 F   |   291.48 K
19.72 C   |   67.50 F   |   292.87 K
21.11 C   |   70.00 F   |   294.26 K
22.50 C   |   72.50 F   |   295.65 K
23.89 C   |   75.00 F   |   297.04 K
25.28 C   |   77.50 F   |   298.43 K
26.67 C   |   80.00 F   |   299.82 K
28.06 C   |   82.50 F   |   301.21 K
29.44 C   |   85.00 F   |   302.59 K
30.83 C   |   87.50 F   |   303.98 K
32.22 C   |   90.00 F   |   305.37 K
33.61 C   |   92.50 F   |   306.76 K
35.00 C   |   95.00 F   |   308.15 K
36.39 C   |   97.50 F   |   309.54 K
37.78 C   |   100.00 F   |   310.93 K
39.17 C   |   102.50 F   |   312.32 K
40.56 C   |   105.00 F   |   313.71 K
41.94 C   |   107.50 F   |   315.09 K
43.33 C   |   110.00 F   |   316.48 K
44.72 C   |   112.50 F   |   317.87 K
46.11 C   |   115.00 F   |   319.26 K
47.50 C   |   117.50 F   |   320.65 K
48.89 C   |   120.00 F   |   322.04 K
50.28 C   |   122.50 F   |   323.43 K
51.67 C   |   125.00 F   |   324.82 K
53.06 C   |   127.50 F   |   326.21 K
54.44 C   |   130.00 F   |   327.59 K
55.83 C   |   132.50 F   |   328.98 K
57.22 C   |   135.00 F   |   330.37 K
58.61 C   |   137.50 F   |   331.76 K
60.00 C   |   140.00 F   |   333.15 K
61.39 C   |   142.50 F   |   334.54 K
62.78 C   |   145.00 F   |   335.93 K
64.17 C   |   147.50 F   |   337.32 K
65.56 C   |   150.00 F   |   338.71 K
66.94 C   |   152.50 F   |   340.09 K
68.33 C   |   155.00 F   |   341.48 K
69.72 C   |   157.50 F   |   342.87 K
71.11 C   |   160.00 F   |   344.26 K
72.50 C   |   162.50 F   |   345.65 K
73.89 C   |   165.00 F   |   347.04 K
75.28 C   |   167.50 F   |   348.43 K
76.67 C   |   170.00 F   |   349.82 K
78.06 C   |   172.50 F   |   351.21 K
79.44 C   |   175.00 F   |   352.59 K
80.83 C   |   177.50 F   |   353.98 K
82.22 C   |   180.00 F   |   355.37 K
83.61 C   |   182.50 F   |   356.76 K
85.00 C   |   185.00 F   |   358.15 K
86.39 C   |   187.50 F   |   359.54 K
87.78 C   |   190.00 F   |   360.93 K
89.17 C   |   192.50 F   |   362.32 K
90.56 C   |   195.00 F   |   363.71 K
91.94 C   |   197.50 F   |   365.09 K
93.33 C   |   200.00 F   |   366.48 K
94.72 C   |   202.50 F   |   367.87 K
96.11 C   |   205.00 F   |   369.26 K
97.50 C   |   207.50 F   |   370.65 K
98.89 C   |   210.00 F   |   372.04 K
igc2@noyce-kilby:~/workspace/214/projects/08/java$ java -ea Tester
Testing Constructor... Passed!
Testing toCelsius... Passed!
Testing toFahrenheit... Passed!
Testing toKelvin... Passed!
Testing fromString... Passed!
Testing toString... 	Expected Output: 86 F	Output: 86.00 F
Testing raise... Passed!
Testing lower... Passed!
Testing equalTo... Passed!
Testing lessThan... Passed!
Testing validTemperature... (should throw three errors) 
Invalid temperature:Scale must be Celsius, Fahrenheit, or Kelvin (i.e. C, F, K)
Invalid temperature:Degree must be between absolute zero and the Planck temperature
Invalid temperature:Degree must be between absolute zero and the Planck temperature
Passed!

Passed All Tests!

Enter the base temperature: 0 K
Enter the limit temperature: 212 F
Enter the step value: 20.0
Invalid temperature:Degree must be between absolute zero and the Planck temperature
Celsius   |   Fahrenheit   |   Kelvin
Invalid temperature:Degree must be between absolute zero and the Planck temperature
Invalid temperature:Degree must be between absolute zero and the Planck temperature
-273.15 C   |   -459.67 F   |   0.00 K
-253.15 C   |   -423.67 F   |   20.00 K
-233.15 C   |   -387.67 F   |   40.00 K
-213.15 C   |   -351.67 F   |   60.00 K
-193.15 C   |   -315.67 F   |   80.00 K
-173.15 C   |   -279.67 F   |   100.00 K
-153.15 C   |   -243.67 F   |   120.00 K
-133.15 C   |   -207.67 F   |   140.00 K
-113.15 C   |   -171.67 F   |   160.00 K
-93.15 C   |   -135.67 F   |   180.00 K
-73.15 C   |   -99.67 F   |   200.00 K
-53.15 C   |   -63.67 F   |   220.00 K
-33.15 C   |   -27.67 F   |   240.00 K
-13.15 C   |   8.33 F   |   260.00 K
6.85 C   |   44.33 F   |   280.00 K
26.85 C   |   80.33 F   |   300.00 K
46.85 C   |   116.33 F   |   320.00 K
66.85 C   |   152.33 F   |   340.00 K
86.85 C   |   188.33 F   |   360.00 K
igc2@noyce-kilby:~/workspace/214/projects/08/java$ make clean          ls
Makefile  script.java  Temperature.class  Temp.java  Tester.class  Tester.java
igc2@noyce-kilby:~/workspace/214/projects/08/java$ make clean
rm -f *.class *~ *# *.o
igc2@noyce-kilby:~/workspace/214/projects/08/java$ ls
Makefile  script.java  Temp.java  Tester.java
igc2@noyce-kilby:~/workspace/214/projects/08/java$ exit

Script done on Mon 09 Apr 2018 08:09:41 PM EDT
