//
//  RegisterEmail.swift
//  FlatIt
//
//  Created by Euan Widjaja on 5/02/23.
//

import SwiftUI

struct RegisterEmail: View {
    
    @Binding var path: [RegistrationStep]

    @Binding var name: String
    @Binding var date: String
    @Binding var month: String
    @Binding var year: String
    @Binding var email: String
    
    var body: some View {
        VStack(alignment: .center) {
            TopDivider()
            
            Group {
                TextField("Enter your name", text: $name)
                    .textFieldStyle(TextFieldDisabledStyle(size: 30))
                    .padding([.leading, .trailing, .top], 20)
                InputDivider()
                    .padding(.top, 5.0)
            }
            
            Group {
                HStack {
                    Group {
                        TextField(date.isEmpty ? "DD" : "\(date) ", text: $date)
                        TextField(month.isEmpty ? "MM" : "\(month)", text: $month)
                        TextField(year.isEmpty ? "YYYY" : " \(year)", text: $year)
                    }
                    
                }
                .fixedSize()
                .textFieldStyle(TextFieldDisabledStyle(size: 30))
                .padding([.leading, .trailing, .top], 20)
                InputDivider()
                    .padding(.top, 5.0)
            }
            
            Group {
                TextField("Enter your email", text: $email)
                    .onSubmit {
                        if isValidEmail() {
                            path.append(.phoneNumberStep)
                        }
                    }
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                    .textFieldStyle(TextFieldOutlineStyle(size: 24))
                    .padding([.leading, .trailing, .top], 20)
                InputDivider()
                    .padding(.top, 5.0)
                
                Text("What's your email?")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .padding(.top, 10.0)
            }
            
            Spacer()

            RegisterButton(
                label: "Continue",
                toStep: .phoneNumberStep,
                path: $path,
                disabled: !isValidEmail()
            )
            .padding(.top, 50.0)
        }
        .frame(maxHeight: UIScreen.main.bounds.height / 1.6, alignment: .top)
        .multilineTextAlignment(.center)
    }
}

extension RegisterEmail {
    
    // From: https://stackoverflow.com/a/41782027
    private func isValidEmail() -> Bool {
        
        // TODO: Extract to constant
        let username = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
        let mailServer = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
        let emailRegex = username + "@" + mailServer + "[A-Za-z]{2,8}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        return emailPredicate.evaluate(with: email)
    }
}


struct RegisterEmail_Previews: PreviewProvider {
    static var previews: some View {
        RegisterEmail(
            path: .constant([]),
            name: .constant("Euan Widjaja"),
            date: .constant("12"),
            month: .constant("12"),
            year: .constant("2000"),
            email: .constant("euan.widjhaja@xeroc.com")
        )
    }
}
