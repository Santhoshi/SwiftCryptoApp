////
//  SearchBarViewComponent.swift
//  SwiftCryptoApp
//
//  Created by Santhoshi Guduru on 8/18/23.
//  
//

import SwiftUI

struct SearchBarViewComponent: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack{
           Image(systemName: "magnifyingglass")
                .foregroundColor(
                    searchText.isEmpty ? Color.theme.secondaryText : Color.theme.accent
                )
            
            TextField("Search by name or symbol...", text: $searchText)
                .foregroundColor(Color.theme.accent)
                .disableAutocorrection(true)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundColor(Color.theme.accent)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            searchText = ""
                            UIApplication.shared.endEditing()
                        }
                    ,alignment: .trailing
                )
            
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.theme.background)
                .shadow(color: Color.theme.accent.opacity(0.15), radius: 10, x: 0, y: 0)
            )
        .padding()
    }
}

struct SearchBarViewComponent_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            SearchBarViewComponent(searchText:.constant(""))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
            
            SearchBarViewComponent(searchText: .constant(""))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
        
        
    }
}
