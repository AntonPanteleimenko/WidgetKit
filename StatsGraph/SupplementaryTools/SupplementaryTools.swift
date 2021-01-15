//
//  SupplementaryTools.swift
//  WidgetApp
//
//  Created by Anton Panteleimenko on 04.01.2021.
//

import WidgetKit
import SwiftUI

public class SupplementaryTools {
    
    func getHeight(with data: Model, value: CGFloat, height: CGFloat) -> CGFloat {
        
        let percent = value / CGFloat(data.widgetData[0].confirmed)
        
        return percent * height
    }
    
    func getDate(value: String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        
        let date: Date = dateFormatterGet.date(from: value) ?? Date()
        return dateFormatterGet.string(from: date)
    }
    
    func addCommas(to int: Int) -> String {
        let largeNumber = int
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formattedNumber = numberFormatter.string(from: NSNumber(value:largeNumber))
        guard let unwrappedString = formattedNumber else { return "" }
        return unwrappedString
    }
}
