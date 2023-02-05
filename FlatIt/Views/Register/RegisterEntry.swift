//
//  RegisterEntry.swift
//  FlatIt
//
//  Created by Euan Widjaja on 5/02/23.
//

import SwiftUI

struct RegisterEntry: View {
    
    @Binding var path: [RegistrationStep]
    
    var body: some View {
        VStack(alignment: .center) {
            TopDivider()
            Text("Welcome\nTo\nTutor\ntime\n: )")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .padding(.top, 10.0)
            Spacer()
            Button("placeholder") {
                path.append(.nameStep)
            }
            
        }
        .frame(maxHeight: UIScreen.main.bounds.height / 1.6, alignment: .top)
        .multilineTextAlignment(.center)
    }
}

struct RegisterEntry_Previews: PreviewProvider {
    static var previews: some View {
        RegisterEntry(path: .constant([]))
    }
}
