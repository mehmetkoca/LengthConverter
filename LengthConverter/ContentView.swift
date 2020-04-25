//
//  ContentView.swift
//  LengthConverter
//
//  Created by Mehmet Koca on 25.04.2020.
//  Copyright © 2020 Mehmet Koca. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    private let lengths = Length.allCases
    @State private var mainLengthIndex = 0
    @State private var mainLengthValue = ""
    @State private var destinationLengthIndex = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Select main length")) {
                    Picker("Main Length", selection: $mainLengthIndex) {
                        ForEach(0..<Length.allCases.count) {
                            Text("\(self.lengths[$0].rawValue)")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    TextField("\(mainLengthResultValue)", text: $mainLengthValue)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Select destination length")) {
                    Picker("Main Length", selection: $destinationLengthIndex) {
                        ForEach(0..<Length.allCases.count) {
                            Text("\(self.lengths[$0].rawValue)")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Result")) {
                    Text("\(destinationLengthResultValue, specifier: "%.2f") \(destinationLengthSymbol)")
                }
                
            }
            .navigationBarTitle("Length Converter")
        }
    }
}

// MARK: - Computed Properties

private extension ContentView {
    
    var mainLength: Length {
        return lengths[mainLengthIndex]
    }
    
    var mainLengthSymbol: String {
        return mainLength.lengthSymbol
    }
    
    var mainLengthNumericValue: Double {
        return Double(mainLengthValue) ?? 0.0
    }

    var mainLengthResultValue: String {
        return "\(mainLengthNumericValue) \(mainLength.lengthSymbol)"
    }
    
    var destinationLengthResultValue: Double {
        let result = mainLength.convert(to: destinationLength, value: mainLengthNumericValue)
        return result
    }

    var destinationLength: Length {
        return lengths[destinationLengthIndex]
    }
    
    var destinationLengthSymbol: String {
        return lengths[destinationLengthIndex].lengthSymbol
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
