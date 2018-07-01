//
//  ItemViewController.swift
//  Localizer
//
//  Created by John Haselden on 01/07/2018.
//  Copyright © 2018 John Haselden. All rights reserved.
//

import Cocoa

class ItemViewController: NSViewController {

    @IBOutlet weak var itemNameLabel: NSTextField!
    @IBOutlet weak var itemKeyField: NSTextField!

    var item: Item? {
        didSet {
            configureUI()
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }

    func configureUI() {
        if let item = item {
            itemNameLabel.stringValue = item.name

            if let itemKey = item.itemKey {
                itemKeyField.stringValue = itemKey
            }
        }
    }
    
}
