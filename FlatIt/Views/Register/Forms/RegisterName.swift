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
        VStack(alignment: .leading) {
            TopDivider2()
            
            Group {
                TextField("Enter your name", text: $name)
                    .onSubmit {
                        if isValidName() {
                            path.append(.dobStep)
                        }
                    }
                    .textFieldStyle(TextFieldOutlineStyle(size: 30))
                    .padding(.top, 20)
                
                InputDivider2()
                    .padding(.top, 5.0)
                
                HStack {
                    Spacer()
                    Text("What's your full name?")
                        .multilineTextAlignment(.trailing)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                    .padding(.top, 10.0)
                }
            }
//            .padding(.leading, 30.0)
            Spacer()
            

            HStack {
                Spacer()
                RegisterButton(
                    label: "Continue",
                    toStep: .dobStep,
                    path: $path,
                    disabled: !isValidName()
                )
                .padding(.top, 50.0)
            }
            
        }
        .frame(maxWidth: UIScreen.main.bounds.width / 1.2,
               maxHeight: UIScreen.main.bounds.height / 1.6)
//        .multilineTextAlignment(.leading)
    }
}



struct TopDivider2: View {
    var body: some View {
        Divider()
            .frame(height: 1.4)
            .overlay(.black)
    }
}

struct InputDivider2: View {
    var body: some View {
//        VStack(spacing: 5.0) {
            Divider()
                .frame(height: 1.4)
                .overlay(.black)
//                .padding(.trailing, 25.0)
//            Divider()
//                .frame(width: UIScreen.main.bounds.width / 1.4, height: 1.4)
//                .overlay(.black)
//                .padding(.leading, 25.0)
//        }
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
