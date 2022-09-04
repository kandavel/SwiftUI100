//
//  ContentView.swift
//  100Days
//
//  Created by kandavel on 21/08/22.
//

import SwiftUI

struct ContentView: View {
    @State var count : Int =  0
    let fruitList = ["Pine","Apple","orange"]
    @State var selectedFruit : String  = ""
    @FocusState var isButtonPressed : Bool
    var updatedCount : Int {
       let updatedCount  =  count + 1
       return updatedCount
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your Picker", selection: $selectedFruit) {
                        ForEach(fruitList,id: \.self) {
                            Text($0)
                        }
                    }
                } header: {
                    Text("This is the Section one")
                }
                Section {
                    TextField("Enter the Value", value: $count, format: .number).keyboardType(.decimalPad).focused($isButtonPressed)
                    Picker("Select the Fruit", selection: $selectedFruit) {
                        ForEach(fruitList,id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("This is the Section two")
                }
                
                Section {
                    Text("updated Count :: \(updatedCount)")
                } header: {
                    Text("Result").bold()
                }
            }.navigationTitle("100Days")
        }.toolbar {
            ToolbarItemGroup(placement: .keyboard, content: {
                Spacer()
                Button("Done") {
                    isButtonPressed  = false
                }
            })
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
