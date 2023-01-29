import SwiftUI

struct RegisterView: View {
    
    @State var name: String
    @State var dateOfBirth: String
    @State var email: String
    @State var phoneNumber: String
    
    var body: some View {
        
        VStack(alignment: .center) {
            TopDivider()
            
            Group {
                TextField("Enter your name", text: $name)
                    .textFieldStyle(OutlinedTextFieldStyle(size: 30))
                    .padding([.leading, .trailing, .top], 20)
                InputDivider()
                    .padding(.top, 5.0)
//                    Text("What's your full name?")
//                        .font(.system(size: 20, weight: .bold, design: .rounded))
//                        .padding(.top, 10.0)
            }
            
            Group {
                TextField("Enter your bday", text: $dateOfBirth)
                    .textFieldStyle(OutlinedTextFieldStyle(size: 30))
                    .padding([.leading, .trailing, .top], 20)
                InputDivider()
                    .padding(.top, 5.0)
//                    Text("Hey Euan Widjaja,\nwhen’s your birthday?")
//                        .font(.system(size: 20, weight: .bold, design: .rounded))
//                        .padding(.top, 10.0)
            }


            Group {
                TextField("Enter your email", text: $email)
                    .textFieldStyle(OutlinedTextFieldStyle(size: 24))
                    .padding([.leading, .trailing, .top], 20)
                InputDivider()
                    .padding(.top, 5.0)
//                    Text("What's your email?")
//                        .font(.system(size: 20, weight: .bold, design: .rounded))
//                        .padding(.top, 10.0)
            }
//
            Group {
                TextField("Enter your number", text: $phoneNumber)
                    .textFieldStyle(OutlinedTextFieldStyle(size: 30))
                    .padding([.leading, .trailing, .top], 20)
                InputDivider()
                    .padding(.top, 5.0)
                Text("Also can I get \nyour number please lol")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .padding(.top, 10.0)
            }
            
            Spacer()
            
            RegisterButton(label: "Continue")
                .padding(.top, 50.0)
        }
        .frame(maxHeight: UIScreen.main.bounds.height / 1.6, alignment: .top)
        .background(.red)
        .multilineTextAlignment(.center)

    }
}

struct OutlinedTextFieldStyle: TextFieldStyle {
    var size: CGFloat
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .autocorrectionDisabled(true)
            .font(.system(size: size, weight: .bold, design: .rounded))
    }
}

struct TopDivider: View {
    var body: some View {
        Divider()
            .frame(width: UIScreen.main.bounds.width / 1.5, height: 1.4)
            .overlay(.black)
    }
}

struct InputDivider: View {
    var body: some View {
        VStack(spacing: 5.0) {
            Divider()
                .frame(width: UIScreen.main.bounds.width / 1.6, height: 1.4)
                .overlay(.black)
                .padding(.leading, 25.0)
            Divider()
                .frame(width: UIScreen.main.bounds.width / 1.6, height: 1.4)
                .overlay(.black)
                .padding(.trailing, 25.0)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(
            name: "",
            dateOfBirth: "",
            email: "",
            phoneNumber: ""
        )
    }
}
