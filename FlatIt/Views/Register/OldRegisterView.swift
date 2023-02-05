//import SwiftUI
//
//struct RegisterView: View {
//
//    @State var name: String = ""
//    
//    @State var dateOfBirth: Date
//    @State var date: String
//    @State var month: String
//    @State var year: String
//
//    @State var email: String
//    @State var phoneNumber: String
//    
//    @State var step: RegistrationStep = .nameStep
//    
//    var body: some View {
//        
//        VStack(alignment: .center) {
//            TopDivider()
//            
//            Group {
//                TextField("Enter your name", text: $name)
//                    .textFieldStyle(TextFieldOutlineStyle(size: 30))
//                    .padding([.leading, .trailing, .top], 20)
//                InputDivider()
//                    .padding(.top, 5.0)
//                
//                if (step == .nameStep) {
//                    Text("What's your full name?")
//                        .font(.system(size: 20, weight: .bold, design: .rounded))
//                        .padding(.top, 10.0)
//                }
//            }
//            
//            if (step != .nameStep) {
//                Group {
//                    HStack() {
//                        TextField("DD", text: $date)
//                        TextField("MM", text: $month)
//                        TextField("YYYY", text: $year)
//                    }
//                    .fixedSize()
//                    .textFieldStyle(TextFieldOutlineStyle(size: 30))
//                    .padding([.leading, .trailing, .top], 20)
//                    InputDivider()
//                        .padding(.top, 5.0)
//                    
//                    if (step == .dobStep) {
//                        Text("Hey Euan Widjaja,\nwhen’s your birthday?")
//                            .font(.system(size: 20, weight: .bold, design: .rounded))
//                            .padding(.top, 10.0)
//                    }
//                }
//            }
//
//            if (step != .nameStep && step != .dobStep) {
//                Group {
//                    TextField("Enter your email", text: $email)
//                        .textFieldStyle(TextFieldOutlineStyle(size: 24))
//                        .padding([.leading, .trailing, .top], 20)
//                    InputDivider()
//                        .padding(.top, 5.0)
//                    
//                    if (step == .emailStep) {
//                        Text("What's your email?")
//                            .font(.system(size: 20, weight: .bold, design: .rounded))
//                            .padding(.top, 10.0)
//                    }
//                }
//            }
//            
//            if (step == .phoneNumberStep) {
//                Group {
//                    TextField("Enter your number", text: $phoneNumber)
//                        .textFieldStyle(TextFieldOutlineStyle(size: 30))
//                        .padding([.leading, .trailing, .top], 20)
//                    InputDivider()
//                        .padding(.top, 5.0)
//                    
//                    if (step == .phoneNumberStep) {
//                        Text("Also can I get \nyour number please lol")
//                            .font(.system(size: 20, weight: .bold, design: .rounded))
//                            .padding(.top, 10.0)
//                    }
//                }
//            }
//            
//
//            Spacer()
//            
//            // If not correct/invalid then don't be tappable
//            RegisterButton(
//                label: "Continue",
//                step: $step
//            )
//                .padding(.top, 50.0)
//            
//        }
//        .frame(maxHeight: UIScreen.main.bounds.height / 1.6, alignment: .top)
//        .multilineTextAlignment(.center)
//
//    }
//}
//
//
//struct TextFieldOutlineStyle: TextFieldStyle {
//    var size: CGFloat
//    func _body(configuration: TextField<Self._Label>) -> some View {
//        configuration
//            .autocorrectionDisabled(true)
//            .font(.system(size: size, weight: .bold, design: .rounded))
//    }
//}
//
//struct TextFieldDisabledStyle: TextFieldStyle {
//    var size: CGFloat
//    func _body(configuration: TextField<Self._Label>) -> some View {
//        configuration
//            .disabled(true)
//            .opacity(0.5)
//            .font(.system(size: size, weight: .bold, design: .rounded))
//    }
//}
//
//struct TopDivider: View {
//    var body: some View {
//        Divider()
//            .frame(width: UIScreen.main.bounds.width / 1.5, height: 1.4)
//            .overlay(.black)
//    }
//}
//
//struct InputDivider: View {
//    var body: some View {
//        VStack(spacing: 5.0) {
//            Divider()
//                .frame(width: UIScreen.main.bounds.width / 1.6, height: 1.4)
//                .overlay(.black)
//                .padding(.leading, 25.0)
//            Divider()
//                .frame(width: UIScreen.main.bounds.width / 1.6, height: 1.4)
//                .overlay(.black)
//                .padding(.trailing, 25.0)
//        }
//    }
//}
//
//
//struct RegisterView_Previews: PreviewProvider {
//    static var previews: some View {
//        RegisterView(
//            name: "",
//            dateOfBirth: Date.now,
//            date: "",
//            month: "",
//            year: "",
//            email: "",
//            phoneNumber: ""
//        )
//    }
//}
