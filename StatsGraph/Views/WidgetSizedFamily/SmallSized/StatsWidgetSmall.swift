//
//  StatsWidgetSmall.swift
//  WidgetApp
//
//  Created by Anton Panteleimenko on 04.01.2021.
//

import SwiftUI
import WidgetKit

struct StatsWidgetSmall: View {
    
    struct Constants {
        static var primaryColor: Color = Color(red: 18 / 255, green: 58 / 255, blue: 92 / 255)
        static var secondaryColor: Color = Color(red: 255 / 255, green: 150 / 255, blue: 76 / 255)
    }
    
    var data: Model
    
    let emojiDetails = URL(string: "emoji://ExplodingHead")
    
    fileprivate let supplementaryTools: SupplementaryTools = SupplementaryTools()
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            let widgetData = data.widgetData[0]
            Text("Ukraine")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .background(Constants.primaryColor)
            
            Divider()
                .background(Color.white)
            
            self.addText(with: "Total:",
                         and: widgetData.confirmed + widgetData.critical + widgetData.deaths + widgetData.recovered,
                         fontSize: 12,
                         backgroundColor: Constants.primaryColor,
                         textColor: Color.white,
                         using: supplementaryTools)
            self.addText(with: "Deaths:",
                         and: widgetData.deaths,
                         fontSize: 12,
                         backgroundColor: Constants.secondaryColor,
                         textColor: Color.black,
                         using: supplementaryTools)
            self.addText(with: "Confirmed:",
                         and: widgetData.confirmed,
                         fontSize: 12,
                         backgroundColor: Constants.primaryColor,
                         textColor: Color.white,
                         using: supplementaryTools)
            self.addText(with: "Recovered:",
                         and: widgetData.recovered,
                         fontSize: 12,
                         backgroundColor: Constants.secondaryColor,
                         textColor: Color.black,
                         using: supplementaryTools)
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        .edgesIgnoringSafeArea(.all)
        .background(Color.clear)
        .widgetURL(emojiDetails)
    }
}

struct StatsWidgetSmall_Previews: PreviewProvider {
    static var previews: some View {
        StatsWidgetSmall(data: Model.stub)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
