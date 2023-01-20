//
//  FlatmateImage.swift
//  FlatIt
//
//  Created by Euan Widjaja on 20/01/23.
//

import SwiftUI

struct FlatmateImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .frame(width: 60.0, height: 60.0)
            .clipShape(RoundedRectangle(cornerRadius: 13.0))
            
        
    }
}

struct FlatmateImage_Previews: PreviewProvider {
    static var previews: some View {
        FlatmateImage(image: Image("euan"))
    }
}
