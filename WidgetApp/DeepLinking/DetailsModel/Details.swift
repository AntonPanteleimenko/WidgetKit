//
//  Details.swift
//  WidgetApp
//
//  Created by Anton Panteleimenko on 13.01.2021.
//

import Foundation

public struct Details: Identifiable {
    public let url: String
    public var id: String {
        return url
    }
    init(url: String) {
        self.url = url
    }
}
