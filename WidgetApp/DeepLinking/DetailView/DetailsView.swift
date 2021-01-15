//
//  DetailsView.swift
//  WidgetApp
//
//  Created by Anton Panteleimenko on 13.01.2021.
//

import SwiftUI

struct DetailsView: View {
    
    var details: Details
    @State var shouldRefresh: Bool
    
    var body: some View {
        WebView(url: URL(string: details.url), reload: $shouldRefresh)
    }
}
