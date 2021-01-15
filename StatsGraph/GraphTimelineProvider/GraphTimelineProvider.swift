//
//  GraphTimelineProvider.swift
//  WidgetApp
//
//  Created by Anton Panteleimenko on 04.01.2021.
//

import WidgetKit
import SwiftUI

struct GraphTimelineProvider : TimelineProvider {
    
    typealias Entry = Model
    fileprivate let coronaLoader = CoronaLoader()
    
    func getSnapshot(in context: Context, completion: @escaping (Entry) -> Void) {
        
        if context.isPreview {
            completion(Entry.placeholder)
        } else {
            coronaLoader.getData { (result) in
                switch result {
                case .success(let data):
                    let date = Date()
                    let entry = Model(date: date, widgetData: data)
                    completion(entry)
                case .failure(_):
                    completion(Entry.placeholder)
                }
            }
        }
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        
        coronaLoader.getData { (result) in
            switch result {
            case .success(let data):
                let date = Date()
                let entry = Model(date: date, widgetData: data)
                let timeline = Timeline(entries: [entry], policy: .after(Date().addingTimeInterval(60 * 10)))
                completion(timeline)
            case .failure(_):
                let entry = Model.placeholder
                let timeline = Timeline(entries: [entry], policy: .after(Date().addingTimeInterval(60 * 2)))
                completion(timeline)
            }
        }
    }
    
    func placeholder(in context: Context) -> Entry {
        Entry.placeholder
    }
    
    func scheduleAReload() {
        WidgetCenter.shared.reloadTimelines(ofKind: "com.homeLTD.coronaLoader-detail")

        WidgetCenter.shared.getCurrentConfigurations { result in
            guard case .success(let widgets) = result else { return }
            if let widget = widgets.first(
                where: { widget in
                    let intent = widget.configuration
                    return intent!.description == "Covid-19 stats in Ukraine"
                }
            ) {
                WidgetCenter.shared.reloadTimelines(ofKind: widget.kind)
            }
        }
    }
}
