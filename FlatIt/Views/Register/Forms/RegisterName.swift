//
//  RegisterName.swift
//  FlatIt
//
//  Created by Euan Widjaja on 5/02/23.
//

import SwiftUI

struct RegisterName: View {
    
    @Binding var path: [RegistrationStep]
    @Binding var name: String

    var body: some View {
        VStack(alignment: .center) {
            TopDivider()
            
            Group {
                TextField("Enter your name", text: $name)
                    .onSubmit {
                        if isValidName() {
                            path.append(.dobStep)
                        }
                    }
                    .textFieldStyle(TextFieldOutlineStyle(size: 30))
                    .padding([.leading, .trailing, .top], 20)
                InputDivider()
                    .padding(.top, 5.0)
                
                Text("What's your full name?")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .padding(.top, 10.0)
            }
            Spacer()
            

            RegisterButton(
                label: "Continue",
                toStep: .dobStep,
                path: $path,
                disabled: !isValidName()
            )
            .padding(.top, 50.0)
        }
        .frame(maxHeight: UIScreen.main.bounds.height / 1.6, alignment: .top)
        .multilineTextAlignment(.center)
    }
}

extension RegisterName {
    
    private func isValidName() -> Bool {
        return !name.isEmpty
    }
}

struct RegisterName_Previews: PreviewProvider {
    static var previews: some View {
        RegisterName(
            path: .constant([]),
            name: .constant("Euan Widjaja")
        )
    }
}
