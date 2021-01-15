//
//  WidgetEntryView.swift
//  WidgetApp
//
//  Created by Anton Panteleimenko on 04.01.2021.
//

import WidgetKit
import SwiftUI

struct WidgetEntryView: View {
    
    @Environment(\.widgetFamily) var widgetFamily
    var data: Model
    
    var body: some View {
        switch widgetFamily {
        case .systemSmall:
            StatsWidgetSmall(data: data)
        case .systemLarge:
            StatsWidgetLarge(data: data)
        case .systemMedium:
            StatsWidgetMedium(data: data)
        default:
            Text("Undetected family size")
        }
    }
}

struct StatsWidgetEntryView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WidgetEntryView(data: Model.stub)
                .previewContext(WidgetPreviewContext(family: .systemLarge))
                .environment(\.colorScheme, .dark)
        }
    }
}
