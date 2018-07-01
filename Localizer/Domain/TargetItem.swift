//
//  TargetItem.swift
//  Localizer
//
//  Created by John Haselden on 01/07/2018.
//  Copyright © 2018 John Haselden. All rights reserved.
//

import Cocoa

class TargetItem: NSObject {
    var value: String
    var created: Date

    var item: String
    var language: String

    init(value: String, item: Item, language: String) {
        self.created = Date()
        self.value = value
        self.item = item.uuid
        self.language = language

        super.init()
    }

}
