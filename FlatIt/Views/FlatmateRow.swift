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
        HStack(alignment: .bottom) {
            FlatmateImage(image: Image("euan"))
            VStack(alignment: .leading, spacing: 0.0) {
                Text("\(flatmate.firstName) \(flatmate.lastName)")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                
                Divider()
                    .frame(height: 1.0)
                    .overlay(.gray)
                    .padding(.top, 3.0)
                    .padding(.bottom, 9.5) //based on overlay so 7 + lineWidth
                
                Button(action: {}) {
                    HStack(spacing: 0) {
                        Text("DISHES")
                            .font(.system(size: 11, weight: .bold, design: .rounded))
                            .padding([.leading], 12.0)
                            .padding([.top, .bottom], 3.0)
                            .padding([.trailing], 6.0)
                            .foregroundColor(.black)
                        
                        Text("2 DAYS")
                            .font(.system(size: 11, weight: .bold, design: .rounded))
                            .padding([.trailing], 12.0)
                            .padding([.top, .bottom], 3.0)
                            .padding([.leading], 8.0)
                            .foregroundColor(.white)
                            .background(.black)
                    }
                }
                .clipShape(Capsule())
                .overlay(
                    Capsule()
                        .stroke(.blue, lineWidth: 2.5)
                )
//need to fix the wrid oadding from stroke thing.
                
            }
            .padding(.leading, 6.0)
//            .background(.blue)
        }
        .padding([.leading, .top, .bottom])
        .frame(maxWidth: .infinity, alignment: .leading)
        .clipShape(RoundedRectangle(cornerRadius: 15.0))
        .overlay(
            RoundedRectangle(cornerRadius: 15.0)
                .stroke(.blue, lineWidth: 3)
        )
    }
}

struct FlatmateRow_Previews: PreviewProvider {
    static var flatmates = FlatmatesData().flatmates
    
    static var previews: some View {
        VStack {
            FlatmateRow(flatmate: flatmates[0])
                .environmentObject(FlatmatesData())
            Spacer()
        }
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
