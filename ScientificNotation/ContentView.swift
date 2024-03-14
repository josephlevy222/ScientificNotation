//
//  ContentView.swift
//  ScientificNotation
//
//  Created by Joseph Levy on 3/13/24.
//

import SwiftUI

struct ContentView: View {
	let numbers: [Double] = {
		var pi = -3.1415926535
		var array = [pi/5e6]
		for _ in 0...10 {
			array = array + [-array.last!*50.0]
		}
		array = array + [13.54321567788, 0.5123456789, 0.0]
		return array
	}()
	@State var format = "%#.4g"
    var body: some View {
		VStack(alignment: .leading) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
			ForEach(numbers, id: \.self) { number in
				Text(String(scientific: number, format: format, exponentExclusion: 0..<3 )+"\t\t for \(String(format: format, number))").font(.title2)
			}
			TextField("Format", text: $format).border(.black)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
