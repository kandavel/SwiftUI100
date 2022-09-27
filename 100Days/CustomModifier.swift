//
//  CustomModifier.swift
//  100Days
//
//  Created by kandavel on 26/09/22.
//

import SwiftUI

struct CustomModifier: View {
    let imageName : String
    var body: some View {
        Image(imageName).renderingMode(.original).clipShape(Capsule())
    }
}

