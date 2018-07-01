//
//  Item.swift
//  Localizer
//
//  Created by John Haselden on 01/07/2018.
//  Copyright © 2018 John Haselden. All rights reserved.
//

import Cocoa

class Item: NSObject {
    var uuid: String
    var name: String
    var created: Date
    var details: String
    var itemKey: String?

    init(name: String, details: String) {
        self.created = Date()
        self.name = name
        self.details = details
        self.uuid = UUID.init().uuidString

        super.init()
    }

}
