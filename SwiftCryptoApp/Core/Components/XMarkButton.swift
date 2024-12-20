////
//  XMarkButton.swift
//  SwiftCryptoApp
//
//  Created by Santhoshi Guduru on 8/22/23.
//  
//

import SwiftUI

struct XMarkButton: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button(action: {
            print("on tap of xmark")
            dismiss()
        }, label:  {
            Image(systemName: "xmark")
                .font(.headline)
        } )
    }
}

struct XMarkButton_Previews: PreviewProvider {
    static var previews: some View {
        XMarkButton()
            .previewLayout(.sizeThatFits)
    }
}
