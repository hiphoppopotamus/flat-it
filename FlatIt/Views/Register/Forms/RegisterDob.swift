//
//  RegisterDob.swift
//  FlatIt
//
//  Created by Euan Widjaja on 5/02/23.
//

import SwiftUI
import Combine

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
                        TextField(date.isEmpty ? "DD" : "\(date) ", text: $date.maximumCharacters(2))
                            .numberInput(with: $date)
                        TextField(month.isEmpty ? "MM" : "\(month)", text: $month.maximumCharacters(2))
                            .numberInput(with: $month)
                        TextField(year.isEmpty ? "YYYY" : " \(year)", text: $year.maximumCharacters(4))
                            .numberInput(with: $year)
                    }
                    .onSubmit {
                        if isValidDob() {
                            path.append(.emailStep)
                        }
                    }
                    .keyboardType(.numberPad)
                }
                .fixedSize()
                .textFieldStyle(TextFieldOutlineStyle(size: 30))
                .padding([.leading, .trailing, .top], 20)
                InputDivider()
                    .padding(.top, 5.0)
                
                Text("Hey \(name),\nwhen’s your birthday?")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .padding(.top, 10.0)
            }
            
            Spacer()

            RegisterButton(
                label: "Continue",
                toStep: .emailStep,
                path: $path,
                disabled: !isValidDob()
            )
            .padding(.top, 50.0)
            
        }
        .frame(maxHeight: UIScreen.main.bounds.height / 1.6, alignment: .top)
        .multilineTextAlignment(.center)
    }
}

extension RegisterDob {
    
    private func isValidDob() -> Bool {
        if (date.isEmpty && month.isEmpty && year.isEmpty) {
            return false
        }
        
        let dateString = "\(month)/\(date)/\(year)"
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        
        guard let dob = formatter.date(from: dateString) else {
            return false
        }
        
        guard let minimumDob = Calendar.current.date(byAdding: .year, value: -120, to: Date()) else {
            return false
        }
        
        guard let maximumDob = Calendar.current.date(byAdding: .year, value: -14, to: Date()) else {
            return false
        }
        
        return dob > minimumDob && dob < maximumDob
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

// From: https://stackoverflow.com/a/68167518
extension Binding where Value == String {
    func maximumCharacters(_ limit: Int) -> Self {
        if self.wrappedValue.count > limit {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.dropLast())
            }
        }
        return self
    }
}

struct InputNumbers: ViewModifier {
    @Binding var value: String
    
    func body(content: Content) -> some View {
        content
            .onReceive(Just(value)) { number in
                let filtered = number.filter { Set("0123456789").contains($0) }
                if filtered != number {
                    self.value = filtered
                }
            }
    }
}

extension View {
    // TODO: move to viewmodifiersfile
    func numberInput(with value: Binding<String>) -> some View {
        modifier(InputNumbers(value: value))
    }
}
