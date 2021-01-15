//
//  View+addText.swift
//  WidgetApp
//
//  Created by Anton Panteleimenko on 04.01.2021.
//

import WidgetKit
import SwiftUI

extension View {
    func addText(with title: String, and value: Int, fontSize: CGFloat, backgroundColor: Color, textColor: Color, using tools: SupplementaryTools) -> some View {
        return Text("\(title) " + "\(tools.addCommas(to: value))")
            .fontWeight(.bold)
            .font(Font.custom("Futura-Medium", size: fontSize))
            .frame(maxWidth: .infinity,
                   maxHeight: 60,
                   alignment: .center)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .lineLimit(0)
            .minimumScaleFactor(0.5)
    }
}
