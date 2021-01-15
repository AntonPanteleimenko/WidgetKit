//
//  ModelEntry.swift
//  WidgetApp
//
//  Created by Anton Panteleimenko on 04.01.2021.
//

import WidgetKit
import SwiftUI

public struct Model: TimelineEntry {
    
    public var date: Date
    public var widgetData: [JSONModel]
    public var isPlaceholder = false
}

extension Model {
    
    static var stub: Model {
        Model(date: Date(),
              widgetData: [JSONModel(
                            country: "Ukraine",
                            code: "UA",
                            confirmed: 1078251,
                            recovered: 733558,
                            critical: 177,
                            deaths: 18927,
                            latitude: 48.379433,
                            longitude: 31.16558,
                            lastChange: "2021-01-04T08:03:24+01:00",
                            lastUpdate: "2021-01-04T08:03:24+01:00")])
    }
    
    static var placeholder: Model {
        Model(date: Date(),
              widgetData: [JSONModel(
                            country: "-",
                            code: "-",
                            confirmed: 1000,
                            recovered: 1000,
                            critical: 1000,
                            deaths: 1000,
                            latitude: 0.44,
                            longitude: 44.0,
                            lastChange: "2021-01-04T08:03:24+01:00",
                            lastUpdate: "2021-01-04T10:00:04+01:00")],
              isPlaceholder: true)
        
    }
}
