//
//  ContryFlag.swift
//  100Days
//
//  Created by kandavel on 08/09/22.
//

import SwiftUI

struct ContryFlag: View {
    @State var countrylist : [String] = ["Russia","Poland", "Spain", "US"]
    var randomNumber  : Int =  Int.random(in: 0...2)
    @State var isShowAlert : Bool = false
    var body: some View {
        VStack {
            ForEach(0..<countrylist.count) { number in
                VStack {
                    let name  =  countrylist[number]
                    Button {
                        isShowAlert = true
                    } label: {
                        CustomModifier(imageName: name)
                    }
                 Text("Country Name :: \(name)")
                }
            }.padding(5)
        }.padding(20).alert("Answer", isPresented: $isShowAlert) {
            Button("Continue", role: .destructive) {
                countrylist.shuffle()
            }
        }
    }
}

struct ContryFlag_Previews: PreviewProvider {
    static var previews: some View {
        ContryFlag()
    }
}
