//
//  FlatmateRow.swift
//  FlatIt
//
//  Created by Euan Widjaja on 20/01/23.
//

import SwiftUI

struct FlatmateRow: View {
    
    let flatmate: Flatmate
    
    var body: some View {
        HStack {
            FlatmateImage(image: Image("euan"))
            Text("\(flatmate.firstName) \(flatmate.lastName)")
                .font(.headline)
                .padding(.leading, 10.0)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay(
            RoundedRectangle(cornerRadius: 15.0)
                .stroke(.clear, lineWidth: 3)
        )
    }
}

struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(15.0)
    }
}

struct FlatmateRow_Previews: PreviewProvider {
    static var flatmates = FlatmatesData().flatmates
    
    static var previews: some View {
        FlatmateRow(flatmate: flatmates[0])
            .environmentObject(FlatmatesData())
    }
}

////
////  FlatmateRow.swift
////  FlatIt
////
////  Created by Euan Widjaja on 20/01/23.
////
//
//import SwiftUI
//
//struct FlatmateRow: View {
//    
//    let flatmate: Flatmate
//    
//    var body: some View {
//        Button(action: {}) {
//            HStack {
//                FlatmateImage(image: Image("euan"))
//                Text("\(flatmate.firstName) \(flatmate.lastName)")
//                    .font(.headline)
//                    .padding(.leading, 10.0)
//            }
//        }
//        .buttonStyle(GradientButtonStyle())
//    }
//}
//
//struct GradientButtonStyle: ButtonStyle {
//    func makeBody(configuration: Self.Configuration) -> some View {
//        configuration.label
//            .padding()
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .foregroundColor(Color.white)
//            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing))
//            .cornerRadius(15.0)
//            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
//    }
//}
//
//struct FlatmateRow_Previews: PreviewProvider {
//    static var flatmates = FlatmatesData().flatmates
//    
//    static var previews: some View {
//        FlatmateRow(flatmate: flatmates[0])
//            .environmentObject(FlatmatesData())
//    }
//}
