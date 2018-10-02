-- temp.ads declares the Temperature type and its operations
-- Author: Ian Christensen, for CS 214 at Calvin College
-- Date: Spring, 2018

package Temperature_Package is
	type Temperature is private;

	procedure Init(Tm: out Temperature; Degrees: in Float; Scale: in Character);
	function getDegrees(Tm: in Temperature) return Float;
	function getScale(Tm: in Temperature) return Character;
	function toCelsius(Tm: in Temperature) return Temperature;
	function toFahrenheit(Tm: in Temperature) return Temperature;
	function toKelvin(Tm: in Temperature) return Temperature;
	function fromString(Tm: in Temperature) return Temperature;
	procedure toString(Tm: in Temperature);
	function raiseTemp(Tm: in Temperature; RaiseInc: in Float) return Temperature;
	function lowerTemp(Tm: in Temperature; LowerInc: in Float) return Temperature;
	function equalTo(Temp1, Temp2: in Temperature) return Boolean;
	function lessThan(Temp1, Temp2: in Temperature) return Boolean;
	function validTemperature(Degrees: in Float; Scale: in Character) return Boolean;
	
	private
	type Temperature is record
		MyDegrees : Float;
		MyScale : Character;
	end record;
	aTemp : Temperature;
end Temperature_Package;
