//
//  AlertMessageView.swift
//  100Days
//
//  Created by kandavel on 07/09/22.
//

import SwiftUI

struct AlertMessageView: View {
    @State  var isAlertPresented : Bool = false
    var body: some View {
        Button("Show Alert") {
            isAlertPresented = true
        }.alert("Presenting a alertView", isPresented: $isAlertPresented) {
            Button("Cancel", role: .destructive, action: {
                isAlertPresented = true
            })
            Button("Ok", role: .cancel, action: {
                
            })
        } message: {
            Text("This is the alertMessage")
        }
    }
}

struct AlertMessageView_Previews: PreviewProvider {
    static var previews: some View {
        AlertMessageView(isAlertPresented: false)
    }
}
