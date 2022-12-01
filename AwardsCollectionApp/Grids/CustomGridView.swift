//
//  CustomGridView.swift
//  AwardsCollectionApp
//
//  Created by Alexey Efimov on 17.11.2021.
//  Changed by Ivanov Mikhail on 10.06.2022
//

import SwiftUI

struct CustomGridView<Content, T>: View where Content: View {
    let items: [T]
    let columns: Int
    let content: (CGFloat, T ) -> Content
    var rows: Int {
        items.count / columns
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    ForEach(0...rows, id: \.self) { rowIndex in
                        HStack {
                            ForEach(0..<columns, id: \.self) { columnIndex in
                                if let index = indexFor(row: rowIndex, column: columnIndex) {
                                    content(geometry.size.width / CGFloat(columns), items[index])
                                } else {
                                    Spacer()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func indexFor(row: Int, column: Int) -> Int? {
        let index = row * columns + column
        return index < items.count ? index : nil
    }
}

struct CustomGridView_Previews: PreviewProvider {
    static var previews: some View {
        CustomGridView(items: [11, 3, 7, 17, 5, 2, 1], columns: 3) { itemSize, item  in
            Text("\(item)")
                .frame(width: itemSize, height: itemSize)
        }
    }
}
