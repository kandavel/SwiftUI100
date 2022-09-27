//
//  ForgroundStyle.swift
//  100Days
//
//  Created by kandavel on 10/09/22.
//

import SwiftUI

struct ForgroundStyle: View {
    var body: some View {
        ZStack {
            HStack {
                Image(systemName: "triangle.fill")
                Text("Hello, world!").foregroundStyle(.ultraThickMaterial)
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 40, height: 20)
            }
            .foregroundColor(Color.red)
        }
    }
}

struct ForgroundStyle_Previews: PreviewProvider {
    static var previews: some View {
        ForgroundStyle()
    }
}
