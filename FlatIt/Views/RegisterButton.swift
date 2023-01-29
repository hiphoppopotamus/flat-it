//
//  RegisterButton.swift
//  FlatIt
//
//  Created by Euan Widjaja on 29/01/23.
//

import SwiftUI

struct RegisterButton: View {
    
    var label: String
    
    var body: some View {
        Button(action: {}) {
            Text(label)
        }
        .buttonStyle(RegisterButtonStyle())
    }
}

struct RegisterButtonStyle: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 18.0, weight: .bold, design: .rounded))
            .padding([.leading, .trailing], 40.0)
            .padding([.top, .bottom], 10.0)
            .overlay(
                Capsule().stroke(Color.black, lineWidth: 3)
            )
    }
}

struct PillButton_Previews: PreviewProvider {
    static var previews: some View {
        RegisterButton(label: "Continue")
    }
}
