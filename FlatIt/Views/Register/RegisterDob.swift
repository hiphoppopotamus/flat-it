//
//  RegisterDob.swift
//  FlatIt
//
//  Created by Euan Widjaja on 5/02/23.
//

import SwiftUI

struct RegisterDob: View {
    
    @Binding var path: [RegistrationStep]
    
    @Binding var name: String
    @Binding var date: String
    @Binding var month: String
    @Binding var year: String
    
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
                .textFieldStyle(TextFieldOutlineStyle(size: 30))
                .padding([.leading, .trailing, .top], 20)
                InputDivider()
                    .padding(.top, 5.0)
                
                    Text("Hey Euan Widjaja,\nwhen’s your birthday?")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .padding(.top, 10.0)
            }
            
            Spacer()
            // If not correct/invalid then don't be tappable
            RegisterButton(
                label: "Continue",
                toStep: .emailStep,
                path: $path
            )
            .padding(.top, 50.0)
            
        }
        .frame(maxHeight: UIScreen.main.bounds.height / 1.6, alignment: .top)
        .multilineTextAlignment(.center)
    }
}

struct RegisterDob_Previews: PreviewProvider {
    static var previews: some View {
        RegisterDob(
            path: .constant([]),
            name: .constant("Euan Widjaja"),
            date: .constant("12"),
            month: .constant("12"),
            year: .constant("2000")
        )
    }
}
