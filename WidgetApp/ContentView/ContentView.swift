//
//  ContentView.swift
//  WidgetApp
//
//  Created by Anton Panteleimenko on 04.01.2021.
//

import SwiftUI
import WidgetKit
import WebKit

struct ContentView: View {
    
    @State var visibleDetails: Details?
    @State var shouldRefresh = true
    private var link = "https://covid19.gov.ua/en/"
    
    var body: some View {
        Button(action: {
            WidgetCenter.shared.reloadAllTimelines()
        }) {
            HStack {
                Image(systemName: "trash")
                    .font(.title)
                Text("Reload all timelines")
                    .fontWeight(.semibold)
                    .font(.title)
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.red)
            .cornerRadius(40)
        }
        .onOpenURL { url in
            visibleDetails = Details(url: link)
        }
        .sheet(item: $visibleDetails, content: { details in
            DetailsView(details: details, shouldRefresh: shouldRefresh)
        })
    }
}
