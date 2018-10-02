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
				return new Temperature((myDegrees - 32.0) * 5.0 / 9.0, 'C');
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
