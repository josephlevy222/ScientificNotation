//
//  ScientificNotation.swift
//  ScientificNotation
//
//  Created by Joseph Levy on 3/13/24.
//

import Foundation

func scientificNotation(format: String = "%g",_ x: Double, exponentExclusion: any RangeExpression<Int> = 0...1) -> String {
	let exponent = (x == 0) ? 0 : Int(log10(abs(x)).rounded(.down))
	if exponentExclusion.contains(exponent)  { return String(format: format, x).trimmingCharacters(in: [" "]) }
	let mantissa =  x/pow(10.0, Double(exponent))
	return String(format: format, mantissa).trimmingCharacters(in: [" "])
	+ "×10" + (exponent < 0 ? "⁻" : "") + String(abs(exponent)).map(expDigits).joined()
	
	func expDigits(_ cDigit: Character) -> String {
		["0":"⁰","1":"¹","2":"²","3":"³","4":"⁴","5":"⁵","6":"⁶","7":"⁷","8":"⁸","9":"⁹"][String(cDigit)] ?? ""
	}
}
	
extension String {
	init(scientific: Double, format: String = "%g", exponentExclusion: any RangeExpression<Int> = 0...1) {
		self = scientificNotation(format: format, scientific, exponentExclusion: exponentExclusion)
	}
}


func scientificString(_ input: String, format: String = "%g", 
					  exponentExclusion: any RangeExpression<Int> = 0...1 ) -> String {
	let components = input.components(separatedBy: " ")
	var result: String = ""
	
	for component in components {
		if let number = Double(component) {
			// If the component is a convertible number, add it to the result
			result += scientificNotation(format: format, number, exponentExclusion: exponentExclusion) + " "
		} else {
			// Otherwise, add the word to the result
			result += (component) + " "
		}
	}

	return result
}
