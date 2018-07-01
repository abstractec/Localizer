//
//  Project.swift
//  Localizer
//
//  Created by John Haselden on 01/07/2018.
//  Copyright © 2018 John Haselden. All rights reserved.
//

import Cocoa

class Project: NSObject {
    var name: String
    var created: Date
    var details: String

    var items: [Item] = []
    var targets: [Target] = []

    init(name: String, details: String) {
        self.created = Date()
        self.name = name
        self.details = details

        super.init()
    }
}
