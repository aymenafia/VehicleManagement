//
//  SelectionListView.swift
//  VehicleManagement
//
//  Created by Aymen Afia on 06.03.25.
//

import SwiftUI

// MARK: - Selection List View

struct SelectionListView<Item: Hashable & CustomStringConvertible>: View {
    
    // MARK: - Properties
    
    let title: String?
    let items: [Item]
    let onSelect: (Item) -> Void
    let placeholder: String
    
    // MARK: - State
    
    @State private var searchText: String = ""
    
    // MARK: - Computed Properties
    
    private var filteredItems: [Item] {
        guard !searchText.isEmpty else { return items }
        return items.filter { $0.description.lowercased().contains(searchText.lowercased()) }
    }
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Color.theme.backgroundLightColor
                .ignoresSafeArea()
            
            VStack {
                searchBarView
                    .padding(.horizontal)
                
                listSection
            }
            .padding(2)
        }
    }
    
    private var searchBarView: some View {
        SearchBar(text: $searchText, placeholder: placeholder)
    }
    
    private var listSection: some View {
        Section(header: sectionHeader) {
            List(filteredItems, id: \.self) { item in
                itemRow(for: item)
            }
            .listStyle(PlainListStyle())
        }
    }
    
    private var sectionHeader: some View {
        HStack {
            Text(title ?? "")
                .body1()
                .foregroundColor(Color.theme.primaryColor)
                .padding()
            Spacer()
        }
    }
    
    private func itemRow(for item: Item) -> some View {
        HStack {
            Text(item.description)
                .foregroundColor(Color.theme.fontDarkColor)
                .body2()
            Spacer()
            
            Circle()
                .foregroundColor(Color.theme.backgroundDarkColor)
                .frame(width: 24, height: 24)
                .overlay(
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color.gray)
                        .body1()
                )
        }
        .contentShape(Rectangle())
        .onTapGesture {
            onSelect(item)
        }
        .listRowBackground(Color.theme.backgroundLightColor)
        .listRowSeparator(.visible, edges: .all)
        .listRowSeparatorTint(Color.theme.backgroundDarkColor, edges: .all)
    }
}

// MARK: - Preview

struct SelectionListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SelectionListView(
                title: "Select an Option",
                items: ["Option 1", "Option 2", "Option 3"],
                onSelect: { selected in
                    print("Selected: \(selected)")
                },
                placeholder: "Search..."
            )
            .previewLayout(.sizeThatFits)
            .padding()
            .preferredColorScheme(.light)
            
            SelectionListView(
                title: "Select an Option",
                items: ["Option 1", "Option 2", "Option 3"],
                onSelect: { selected in
                    print("Selected: \(selected)")
                },
                placeholder: "Search..."
            )
            .previewLayout(.sizeThatFits)
            .padding()
            .preferredColorScheme(.dark)
        }
    }
}
