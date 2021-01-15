//
//  View+addBranchToGraph.swift
//  WidgetApp
//
//  Created by Anton Panteleimenko on 04.01.2021.
//

import WidgetKit
import SwiftUI

extension View {
    func addBranchToGraph(with value: Int, by type: JSONModel, of topic: String, using tools: SupplementaryTools, about data: Model, applying color: Color, adding spacing: CGFloat, fontUnits: Font, fontCategory: Font, backgroundColor: Color) -> some View {
        
        return VStack(alignment: .center, spacing: spacing) {
            
            Text("\(tools.addCommas(to: value))")
                .fontWeight(.bold)
                .font(fontUnits)
                .frame(alignment: .center)
                .background(backgroundColor)
                .foregroundColor(Color.white)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
            
            GeometryReader { graph in
                
                VStack {
                    Spacer(minLength: 0)
                    RoundedRectangle(cornerRadius: 5)
                        .fill(color)
                        .frame(height: tools.getHeight(with: data,
                                                       value: CGFloat(value),
                                                       height: graph.frame(in: .global).height))
                }
            }
            
            Text(topic)
                .font(fontCategory)
                .background(backgroundColor)
                .foregroundColor(Color.white)
                .lineLimit(0)
                .minimumScaleFactor(0.5)
        }
    }
}
