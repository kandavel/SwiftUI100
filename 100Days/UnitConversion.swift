//
//  UnitConversion.swift
//  100Days
//
//  Created by kandavel on 03/09/22.
//

import SwiftUI

struct UnitConversion: View {
    @State var input : Int =  0
    @FocusState var isButtonPressed : Bool
    @State var inputDouble  : Double  = 0.0
    let unitList  = ["Distance", "Mass", "Temperature", "Time"]
    @State var selectedUnit : String  =  ""
    @State private var inputUnit: Dimension = UnitLength.meters
    @State private var outputUnit: Dimension = UnitLength.yards
    @State var output : Int  = 0
    let unitTypes = [
        [UnitLength.meters, UnitLength.kilometers, UnitLength.feet, UnitLength.yards, UnitLength.miles],
        [UnitMass.grams, UnitMass.kilograms, UnitMass.ounces, UnitMass.pounds],
        [UnitTemperature.celsius, UnitTemperature.fahrenheit, UnitTemperature.kelvin],
        [UnitDuration.hours, UnitDuration.minutes, UnitDuration.seconds]
    ]
    
    @State var selectedUnits = 0
    let formatter: MeasurementFormatter
        
    init() {
        formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .long
    }
    
    
    var result  : String {
        var outputDouble : Double  =  0.0
        switch selectedUnit {
            case "Feet":
            outputDouble =  3.28084
            case "kilometer":
            outputDouble =  0.001
            case "Miles":
            outputDouble =   0.000621371
            case "yards":
            outputDouble = 1.09361
            default:
            outputDouble =   1.0
            }
            let outputData  = inputDouble * outputDouble
            let outputString = outputData.formatted()
            return "\(outputString)"
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Input in Meters", value: $inputDouble, format: .number).focused($isButtonPressed)
                }header: {
                    Text("Enter the  Input In Meters ::")
                }
                
                Picker("Conversion", selection: $selectedUnits) {
                    ForEach(0..<unitList.count) {
                        Text(unitList[$0])
                    }
                }
                    
                Picker("Convert from", selection: $inputUnit) {
                    ForEach(unitTypes[selectedUnits], id: \.self) {
                        Text(formatter.string(from: $0).capitalized)
                    }
                }
                
                Picker("Convert to", selection: $outputUnit) {
                    ForEach(unitTypes[selectedUnits], id: \.self) {
                        Text(formatter.string(from: $0).capitalized)
                    }
                }
                
                Section {
                    Text(result)
                } header: {
                    Text("Result")
                }
               
            }.navigationTitle("Unit Conversion").navigationBarTitleDisplayMode(.large).foregroundColor(Color.red).toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        isButtonPressed = false
                    }
                }
            }.onChange(of: selectedUnits) { newSelection in
                let units = unitTypes[newSelection]
                inputUnit = units[0]
                outputUnit = units[1]
            }
        }
    }
}

struct UnitConversion_Previews: PreviewProvider {
    static var previews: some View {
        UnitConversion()
    }
}
