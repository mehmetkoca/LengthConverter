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
            .gesture(DragGesture().onChanged{_ in
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                                to: nil,
                                                from: nil,
                                                for: nil)
            })
            .navigationBarTitle("Length Converter")
        }
    }
}

// MARK: - Computed Properties

private extension ContentView {
    
    var mainLength: Length {
        lengths[mainLengthIndex]
    }
    
    var mainLengthSymbol: String {
        mainLength.lengthSymbol
    }
    
    var mainLengthNumericValue: Double {
        Double(mainLengthValue) ?? 0.0
    }

    var mainLengthResultValue: String {
        "\(mainLengthNumericValue) \(mainLength.lengthSymbol)"
    }
    
    var destinationLengthResultValue: Double {
        mainLength.convert(to: destinationLength, value: mainLengthNumericValue)
        
    }

    var destinationLength: Length {
        lengths[destinationLengthIndex]
    }
    
    var destinationLengthSymbol: String {
        lengths[destinationLengthIndex].lengthSymbol
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
