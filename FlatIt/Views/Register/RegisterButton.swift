//
//  RegisterButton.swift
//  FlatIt
//
//  Created by Euan Widjaja on 29/01/23.
//

import SwiftUI

struct RegisterButton: View {
    
    var label: String
    var toStep: RegistrationStep
    @Binding var path: [RegistrationStep]
    var disabled = false

    var body: some View {
        Button(action: {
            path.append(toStep)
        }) {
            Text(label)
        }
        .buttonStyle(RegisterButtonStyle(disabled: disabled))
        .disabled(disabled)
    }
}


struct RegisterButtonStyle: ButtonStyle {
    
    var disabled: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 18.0, weight: .bold, design: .rounded))
            .padding([.leading, .trailing], 40.0)
            .padding([.top, .bottom], 10.0)
            .foregroundColor(disabled ? .gray : .black)
            .overlay(
                disabled ?
                Capsule().stroke(Color.gray, lineWidth: 3) :
                Capsule().stroke(Color.black, lineWidth: 3)
            )
    }
}

struct PillButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            RegisterButton(
                label: "Continue",
                toStep: .nameStep,
                path: .constant([])
            )
            RegisterButton(
                label: "Continue",
                toStep: .nameStep,
                path: .constant([]),
                disabled: true
            )
        }
    }
}
