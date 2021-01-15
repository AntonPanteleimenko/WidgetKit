//
//  StatsWidgetLarge.swift
//  WidgetApp
//
//  Created by Anton Panteleimenko on 04.01.2021.
//

import SwiftUI
import WidgetKit

struct StatsWidgetLarge: View {
    
    struct Constants {
        static var primaryColor: Color = Color(red: 18 / 255, green: 58 / 255, blue: 92 / 255)
        static var secondaryColor: Color = Color(red: 255 / 255, green: 150 / 255, blue: 76 / 255)
    }
    
    @Environment(\.widgetFamily) var widgetFamily
    
    var data: Model
    
    var fontTitle: Font!
    var fontDate: Font!
    var fontUnits: Font!
    var fontCategory: Font!
    var spacing: CGFloat!
    
    fileprivate let supplementaryTools: SupplementaryTools = SupplementaryTools()
    
    var colors = [Color.red,
                  Color.yellow,
                  Color.green,
                  Constants.secondaryColor]
    
    init(data: Model) {
        self.data = data
        self.setWidgetFamilyValues(for: widgetFamily)
    }
    
    var body: some View {
        
        VStack(alignment: .center, spacing: spacing) {
            
            HStack(spacing: spacing) {
                
                Text("Total Confirmed Cases In Ukraine")
                    .font(fontTitle)
                    .fontWeight(.bold)
                    .background(Constants.primaryColor)
                    .foregroundColor(Color.white)
                    .lineLimit(nil)
                    .minimumScaleFactor(0.5)
                    .fixedSize(horizontal: false, vertical: true)
                let date = supplementaryTools.getDate(value: data.widgetData[0].lastUpdate)
                Text(date)
                    .font(fontDate)
                    .fontWeight(.bold)
                    .background(Constants.primaryColor)
                    .foregroundColor(Color.white)
                    .lineLimit(0)
                    .minimumScaleFactor(0.5)
            }
            .padding()
            
            Divider()
                .background(Color.white)
            
            HStack(spacing: spacing) {
                let covidData = data.widgetData[0]
                if covidData.confirmed == 0 && covidData.deaths == 0 {
                    
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.gray)
                } else {
                    self.addBranchToGraph(with: covidData.confirmed, by: data.widgetData[0], of: "confirmed", using: supplementaryTools, about: data, applying: colors[0], adding: spacing, fontUnits: fontUnits, fontCategory: fontCategory, backgroundColor: Constants.primaryColor)
                    self.addBranchToGraph(with: covidData.recovered, by: data.widgetData[0], of: "recovered", using: supplementaryTools, about: data, applying: colors[1], adding: spacing, fontUnits: fontUnits, fontCategory: fontCategory, backgroundColor: Constants.primaryColor)
                    self.addBranchToGraph(with: covidData.deaths, by: data.widgetData[0], of: "deaths", using: supplementaryTools, about: data, applying: colors[2], adding: spacing, fontUnits: fontUnits, fontCategory: fontCategory, backgroundColor: Constants.primaryColor)
                    self.addBranchToGraph(with: covidData.critical, by: data.widgetData[0], of: "critical", using: supplementaryTools, about: data, applying: colors[3], adding: spacing, fontUnits: fontUnits, fontCategory: fontCategory, backgroundColor: Constants.primaryColor)
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
            .background(Constants.primaryColor)
        }
        .edgesIgnoringSafeArea(.all)
        .background(Constants.primaryColor)
    }
    
    mutating fileprivate func setWidgetFamilyValues(for widgetFamily: WidgetFamily) {
        switch widgetFamily {
        case .systemLarge:
            self.spacing = CGFloat(15)
            self.fontTitle = Font.custom("Futura-Medium", size: 20)
            self.fontDate = Font.custom("Futura-Medium", size: 13)
            self.fontUnits = Font.custom("Futura-Medium", size: 12)
            self.fontCategory = Font.custom("Futura-Medium", size: 15)
        default:
            self.spacing = CGFloat(15)
            self.fontTitle = Font.custom("Futura-Medium", size: 20)
            self.fontDate = Font.custom("Futura-Medium", size: 13)
            self.fontUnits = Font.custom("Futura-Medium", size: 12)
            self.fontCategory = Font.custom("Futura-Medium", size: 15)
        }
    }
}

struct StatsWidgetLarge_Previews: PreviewProvider {
    static var previews: some View {
        StatsWidgetLarge(data: Model.stub)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
