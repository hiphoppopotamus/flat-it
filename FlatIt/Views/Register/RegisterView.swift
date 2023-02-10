import SwiftUI

struct RegisterView: View {

    @State private var path = [RegistrationStep]()
    
    @State var name: String = ""
    @State var date: String = ""
    @State var month: String = ""
    @State var year: String = ""
    @State var email: String = ""
    @State var phoneNumber: String = ""
    
    var body: some View {
        
        
        NavigationStack(path: $path) {
            RegisterEntry(path: $path)
                .navigationDestination(for: RegistrationStep.self) { step in
                    switch step {
                    case .nameStep:
                        RegisterName(
                            path: $path,
                            name: $name
                        )

                    case .dobStep:
                        RegisterDob(
                            path: $path,
                            name: $name,
                            date: $date,
                            month: $month,
                            year: $year
                        )
                        
                    case .emailStep:
                        RegisterEmail(
                            path: $path,
                            name: $name,
                            date: $date,
                            month: $month,
                            year: $year,
                            email: $email
                        )
                        
                    case .phoneNumberStep:
                        RegisterNumber(
                            path: $path,
                            name: $name,
                            date: $date,
                            month: $month,
                            year: $year,
                            email: $email,
                            phoneNumber: $phoneNumber
                        )
                    }
                }
        }
    }
}

struct TextFieldOutlineStyle: TextFieldStyle {
    var size: CGFloat
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .font(.system(size: size, weight: .bold, design: .rounded))
            .autocorrectionDisabled(true)
    }
}

struct TextFieldDisabledStyle: TextFieldStyle {
    var size: CGFloat
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .disabled(true)
            .opacity(0.5)
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
        RegisterView()
    }
}
