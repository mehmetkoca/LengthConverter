//
//  ContentView.swift
//  LengthConverter
//
//  Created by Mehmet Koca on 25.04.2020.
//  Copyright © 2020 Mehmet Koca. All rights reserved.
//

import SwiftUI

enum Length: String, CaseIterable {
    
    case meter = "Meter"
    case kilometer = "Kilometer"
    case feet = "Feet"
    case miles = "Miles"
    
    var mainLengthSymbol: String {
        switch self {
        case .meter:
            return "m"
        case .kilometer:
            return "km"
        case .feet:
            return "ft"
        case .miles:
            return "mi"
        }
    }
}

struct ContentView: View {
    
    private let lengts = Length.allCases
    @State private var mainLengthIndex = 0
    @State private var mainLengthValue = ""
    @State private var destinationLengthIndex = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Select main length")) {
                    Picker("Main Length", selection: $mainLengthIndex) {
                        ForEach(0..<Length.allCases.count) {
                            Text("\(self.lengts[$0].rawValue)")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    TextField("\(mainLengthResultValue)", text: $mainLengthValue)
                        .keyboardType(.decimalPad)
                }
            }
            .navigationBarTitle("Length Converter")
        }
    }
}

// MARK: - Computed Properties

extension ContentView {

    var mainLengthResultValue: String {
        return "\(Double(mainLengthValue) ?? 0.0) \(lengts[mainLengthIndex].mainLengthSymbol)"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
