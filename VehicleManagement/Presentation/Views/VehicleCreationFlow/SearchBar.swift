//
//  SearchBar.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 06.03.25.
//

import SwiftUI

// MARK: - Search Bar Component

struct SearchBar: View {
    
    // MARK: - Properties
    
    @Binding var text: String
    
    let placeholder: String
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.theme.backgroundDarkColor)
            
            HStack {
                TextField(placeholder, text: $text)
                    .body1()
                    .foregroundColor(Color.theme.fontLightColor)
                    .padding(.leading, 12)
                    .padding(.trailing, 36)
                
                Spacer()
                
                Image("Search")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .frame(width: 16, height: 16)
                    .padding(.trailing, 8)
            }
            .padding(.vertical, 8)
        }
        .frame(height: 36)
        .padding(.horizontal)
    }
}

// MARK: - Preview

struct SearchBar_Previews: PreviewProvider {
    @State static var text = ""
    
    static var previews: some View {
        Group {
            SearchBar(
                text: $text,
                placeholder: "Search brand..."
            )
            .previewLayout(.sizeThatFits)
            .padding()
            .preferredColorScheme(.light)
            
            SearchBar(
                text: $text,
                placeholder: "Search brand..."
            )
            .previewLayout(.sizeThatFits)
            .padding()
            .preferredColorScheme(.dark)
        }
    }
}
