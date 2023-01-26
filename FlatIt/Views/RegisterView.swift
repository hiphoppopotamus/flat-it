import SwiftUI

struct RegisterView: View {
    
    @State var name: String
//    @State var dateOfBirth: Date
//    @State var email: String
//    @State var password: String
    
    var body: some View {
        VStack(alignment: .center) {
            TopDivider()
                .padding(.bottom, 20.0)
            
            TextField("Enter your name", text: $name)
                .textFieldStyle(OutlinedTextFieldStyle())
                .padding([.leading, .trailing], 50)

            InputDivider()
                .padding(.top, 5.0)
            
            Text("What's your full name")
                .font(.system(size: 24, weight: .bold, design: .rounded))
        }
        

    }
}

struct OutlinedTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .autocorrectionDisabled(true)
            .multilineTextAlignment(.center)
            .font(.system(size: 36, weight: .bold, design: .rounded))
    }
}

struct TopDivider: View {
    var body: some View {
        Divider()
            .frame(width: UIScreen.main.bounds.width / 1.5, height: 2.0)
            .overlay(.gray)
    }
}

struct InputDivider: View {
    var body: some View {
        VStack {
            Divider()
                .frame(width: UIScreen.main.bounds.width / 1.6, height: 2.0)
                .overlay(.gray)
                .padding(.leading, 25.0)
            Divider()
                .frame(width: UIScreen.main.bounds.width / 1.6, height: 2.0)
                .overlay(.gray)
                .padding(.trailing, 25.0)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(
            name: ""
        )
    }
}
