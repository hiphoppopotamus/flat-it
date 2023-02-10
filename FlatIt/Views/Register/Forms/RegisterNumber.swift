//
//  RegisterNumber.swift
//  FlatIt
//
//  Created by Euan Widjaja on 5/02/23.
//

import SwiftUI
import iPhoneNumberField

struct RegisterNumber: View {
    
    @Binding var path: [RegistrationStep]

    @Binding var name: String
    @Binding var date: String
    @Binding var month: String
    @Binding var year: String
    @Binding var email: String
    @Binding var phoneNumber: String
    
    @State var d: String = ""

    
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
                    .textFieldStyle(TextFieldDisabledStyle(size: 24))
                    .padding([.leading, .trailing, .top], 20)
                InputDivider()
                    .padding(.top, 5.0)
            }
            
            Group {
                // TODO: Move to style struct/modifier
                iPhoneNumberField("(000) 000-0000", text: $phoneNumber)
                    .flagHidden(false)
                    .prefixHidden(false)
                    .flagSelectable(true)
                    .font(UIFont(size: 30, weight: .bold, design: .rounded))
                    .clearButtonMode(.never)
                    .padding([.leading, .trailing, .top], 20)
                    .fixedSize()
                    .onSubmit {
                        if isValidNumber() {
                            path.append(.nameStep)
                        }
                    }
                InputDivider()
                    .padding(.top, 5.0)
                
                Text("Also can I get \nyour number please lol")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .padding(.top, 10.0)
            }
            
            Spacer()

            RegisterButton(
                label: "Continue",
                toStep: .nameStep,
                path: $path,
                disabled: !isValidNumber()
            )
            .padding(.top, 50.0)
            
        }
        .frame(maxHeight: UIScreen.main.bounds.height / 1.6, alignment: .top)
        .multilineTextAlignment(.center)
    }
}

extension RegisterNumber {
    
    // From: https://stackoverflow.com/a/41782027
    private func isValidNumber() -> Bool {
        
        // TODO: Extract to constant
        let username = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
        let mailServer = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
        let emailRegex = username + "@" + mailServer + "[A-Za-z]{2,8}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        return emailPredicate.evaluate(with: email)
    }
}

struct RegisterNumber_Previews: PreviewProvider {
    static var previews: some View {
        RegisterNumber(
            path: .constant([]),
            name: .constant("Euan Widjaja"),
            date: .constant("12"),
            month: .constant("12"),
            year: .constant("2000"),
            email: .constant("euan.widjhaja@xeroc.com"),
            phoneNumber: .constant("0224298706")
        )
    }
}
