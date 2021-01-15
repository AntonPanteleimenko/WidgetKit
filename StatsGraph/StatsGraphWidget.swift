//
//  StatsGraphWidget.swift
//  StatsGraphWidget
//
//  Created by Anton Panteleimenko on 04.01.2021.
//

import WidgetKit
import SwiftUI

@main
struct StatsGraphWidget: Widget {
    
    private let kind: String = "CovidStatsWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: GraphTimelineProvider(), content: { data in
            
            WidgetEntryView(data: data)
                .background(Color(.black))
        })
        .description(Text("Covid-19 stats in Ukraine"))
        .configurationDisplayName(Text("Covid Stats"))
        .supportedFamilies([.systemLarge, .systemMedium, .systemSmall])
        .onBackgroundURLSessionEvents {
            (sessionIdentifier, competion) in
            if sessionIdentifier == self.kind {
                // SOME KIND OF PROCESSING //
                competion()
            }
        }
    }
}

struct CovidStatsWidget_Previews: PreviewProvider {
    static var previews: some View {
        WidgetEntryView(data: Model.stub)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
