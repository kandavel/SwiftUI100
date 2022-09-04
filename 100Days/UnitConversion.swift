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
    let unitList  = ["Meter","kilometer","yards"]
    @State var selectedUnit : String  =  ""
    @State var output : Int  = 0
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
                Section {
                    Picker("Select the Expected Output", selection:$selectedUnit) {
                        ForEach(unitList,id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.automatic)
                }
                
                Section {
                    Text("Output In  \(selectedUnit) :: \(result)")
                }header: {
                    Text("OutPut ::")
                }
            }.navigationTitle("Unit Conversion").navigationBarTitleDisplayMode(.large).foregroundColor(Color.red).toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        isButtonPressed = false
                    }
                }
            }
        }
    }
}

struct UnitConversion_Previews: PreviewProvider {
    static var previews: some View {
        UnitConversion()
    }
}
