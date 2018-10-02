-- temperature_package.adb defines operations for the Temperature type
-- Author: Ian Christensen, CS 214 at Calvin College
-- Date: Spring, 2018


with Ada.Text_IO, Ada.Float_Text_IO, Ada.Characters.Handling, Ada.Exceptions;
use  Ada.Text_IO, Ada.Float_Text_IO, Ada.Characters.Handling, Ada.Exceptions;

package body temperature_package is

	-- Subroutine: Init, constructor for Temperature object
	-- Precondition: Degree and Scale must be valid for a temperature
	-- Input: Degrees, a Float; Scale, a Character
	-- Output: a Temperature object
	procedure Init(Tm: out Temperature; Degrees: in Float; Scale: in Character) is
	begin
		if validTemperature(Degrees, Scale) then
			Tm.MyDegrees := Degrees;
			Tm.MyScale := To_Upper(Scale);
		end if;
	end Init;

	-- Subroutine: getDegrees, accessor for degrees variable
	-- Precondition: myDegrees is initialized as a double value
	-- Input: Tm, a Temperature object
	-- Output: MyDegrees, a double
	function getDegrees(Tm: in Temperature) return Float is
	begin
		return Tm.MyDegrees;
	end getDegrees;

	-- Subroutine: getScale, accessor for degrees variable
	-- Precondition: myScale is initialized as a char value
	-- Input: Tm, a Temperature object
	-- Output: myScale, a double
	function getScale(Tm: in Temperature) return Character is
	begin
		return Tm.MyScale;
	end getScale;

	-- Subroutine: toCelsius, mutator for scale conversion
	-- Precondition: myScale and myDegrees are initialized
	-- Input: Tm, a Temperature object
	-- Output: new Temperature object with myScale == 'C'
	function toCelsius(Tm: in Temperature) return Temperature is
	aTemp : Temperature;
	begin
		case getScale(Tm) is
			when 'C' =>
				Init(aTemp, getDegrees(Tm), 'C');
				return aTemp;
			when 'F' =>
				Init(aTemp, (getDegrees(Tm) - 32.0) * 5.0 / 9.0, 'C');
				return aTemp;
			when 'K' =>
				Init(aTemp, getDegrees(Tm) - 273.15, 'C');
				return aTemp;
			when others =>
				return aTemp;
		end case;
	end toCelsius;

	-- Subroutine: toFahrenheit, mutator for scale conversion
	-- Precondition: myScale and myDegrees are initialized
	-- Input: Tm, a Temperature object
	-- Output: new Temperature object with myScale == 'F'
	function toFahrenheit(Tm: in Temperature) return Temperature is
	aTemp : Temperature;
	begin
		case getScale(Tm) is
			when 'C' =>
				Init(aTemp, getDegrees(Tm) * 1.8 + 32.0, 'F');
				return aTemp;
			when 'F' =>
				Init(aTemp, getDegrees(Tm), 'F');
				return aTemp;
			when 'K' =>
				Init(aTemp, (getDegrees(Tm) - 273.15) * 1.8 + 32.0, 'F');
				return aTemp;
			when others =>
				return aTemp;
		end case;
	end toFahrenheit;

	-- Subroutine: toKelvin, mutator for scale conversion
	-- Precondition: myScale and myDegrees are initialized
	-- Input: Tm, a Temperature object
	-- Output: new Temperature object with myScale == 'K'
	function toKelvin(Tm: in Temperature) return Temperature is
	aTemp : Temperature;
	begin
		case getScale(Tm) is
			when 'C' =>
				Init(aTemp, getDegrees(Tm) + 273.15, 'K');
				return aTemp;
			when 'F' =>
				Init(aTemp, (getDegrees(Tm) + 459.67) * 5.0 / 9.0, 'K');
				return aTemp;
			when 'K' =>
				Init(aTemp, getDegrees(Tm), 'K');
				return aTemp;
			when others =>
				return aTemp;
		end case;
	end toKelvin;

	-- Subroutine: fromString, input for user strings
	-- Precondition: temperature_string is in format "0.0 C     "
	-- Input: String_Temp, a String
	-- Output: new Temperature object
	function fromString(Tm: in Temperature) return Temperature is
	aDegr : Float;
	aChar, empty : Character;
	aTemp : Temperature;
	begin
		Get(aDegr);
		Get(empty);
		Get(aChar);
		Init(aTemp, aDegr, aChar);
		return aTemp;
	end fromString;

	-- Subroutine: toString, stringifies a Temperature object
	-- Precondition: myDegrees and myScale are initialized
	-- Input: Tm, a Temperature object
	-- Output: String format of a Temperature object
	procedure toString(Tm: in Temperature) is
	begin
		Put(getDegrees(Tm));
		Put(" ");
		Put(getScale(Tm));
	end toString;

	-- Subroutine: raiseTemp, mutator that increments a temperature's degree
	-- Postcondition: the result cannot exceed the Planck Temperature
	-- Input: Tm, a Temperature object; RaiseInc, a float
	-- Output: new Temperature object with raised degree
	function raiseTemp(Tm: in Temperature; RaiseInc: in Float) return Temperature is
	aTemp : Temperature;
	begin
		Init(aTemp, getDegrees(Tm) + RaiseInc, getScale(Tm));
		return aTemp;
	end raiseTemp;

	-- Subroutine: lowerTemp, mutator that decrements a temperature's degree
	-- Postcondition: the result cannot deceed absolute zero
	-- Input: Tm, a Temperature object; LowerInc, a float
	-- Output: new Temperature object with lowered degree
	function lowerTemp(Tm: in Temperature; LowerInc: in Float) return Temperature is
	aTemp : Temperature;
	begin
		Init(aTemp, getDegrees(Tm) - LowerInc, getScale(Tm));
		return aTemp;
	end lowerTemp;

	-- Subroutine: equalTo, equality operator for temperature regardless of scale
	-- Preconditions: Temp1 and Temp2 are a valid Temperature objects
	-- Input: Temp1, Temp2, Temperature objects
	-- Output: true if equal, false if not equal
	function equalTo(Temp1, Temp2: in Temperature) return Boolean is
	begin
		case getScale(Temp1) is
			when 'C' =>
				return getDegrees(Temp1) = getDegrees(toCelsius(Temp2));
			when 'F' =>
				return getDegrees(Temp1) = getDegrees(toFahrenheit(Temp2));
			when 'K' =>
				return getDegrees(Temp1) = getDegrees(toKelvin(Temp2));
			when others =>
				return False;
		end case;
	end equalTo;

	-- Subroutine: lessThan, less than operator for temperature regardless of scale
	-- Precondition: Temp1 and Temp2 are a valid Temperature objects
	-- Input: Temp1, Temp2, Temperature objects
	-- Output: true if less than, false if not less than
	function lessThan(Temp1, Temp2: in Temperature) return Boolean is
	begin
		case getScale(Temp1) is
			when 'C' =>
				return getDegrees(Temp1) < getDegrees(toCelsius(Temp2));
			when 'F' =>
				return getDegrees(Temp1) < getDegrees(toFahrenheit(Temp2));
			when 'K' =>
				return getDegrees(Temp1) < getDegrees(toKelvin(Temp2));
			when others =>
				return False;
		end case;
	end lessThan;

	-- Subroutine: validTemperatureerature, assesses whether the degree and scale are valid
	-- Precondition: Tm, Degrees, and Scale exist
	-- Input: degrees, a double; scale, a char
	-- Output: true, if a valid temperature
	function validTemperature(Degrees: in Float; Scale: in Character) return Boolean is
	DegreesEx, ScaleEx, Ex : exception;
	begin
		case Scale is
			when 'C' =>
				if (degrees >= -273.15 and degrees <= 141683385000000005000000000000273.15) then
					return True;
				else
					Raise_Exception(DegreesEx'Identity, "Degree must be between absolute zero and the Planck temperature");
				end if;
			when 'F' =>
				if (degrees >= -459.67 and degrees <= 255030093000000008999999999999540.33) then
					return True;
				else
					Raise_Exception(DegreesEx'Identity, "Degree must be between absolute zero and the Planck temperature");
				end if;
			when 'K' =>
				if (degrees >= 0.0 and degrees <= 141683385000000005000000000000000.0) then
					return True;
				else
					Raise_Exception(DegreesEx'Identity, "Degree must be between absolute zero and the Planck temperature");
				end if;
			when others =>
				Raise_Exception(ScaleEx'Identity, "Scale must be Celsius, Fahrenheit, or Kelvin (i.e. C, F, K)");
		end case;
	end validTemperature;
end temperature_package;
