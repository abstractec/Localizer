//
//  AddItemViewController.swift
//  Localizer
//
//  Created by John Haselden on 01/07/2018.
//  Copyright © 2018 John Haselden. All rights reserved.
//

import Cocoa

class AddItemViewController: NSViewController {
    var delegate: AddItemDelegate?
    @IBOutlet weak var nameField: NSTextField!
    @IBOutlet var descriptionField: NSTextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }

    @IBAction func save(_ sender: Any) {
        let name = nameField.stringValue
        let info = descriptionField.string

        if name.count > 0 && info.count > 0 {
            let item = Item(name: name, details: info)

            if let delegate = delegate {
                delegate.addItem(item)
                self.dismiss(sender)

            }
        } else {
            let alert = NSAlert()
            alert.messageText = "Please enter a name and a description"

            alert.runModal()
        }
    }

    @IBAction func cancel(_ sender: Any) {
        self.dismiss(sender)
    }
    
}

protocol AddItemDelegate {
    func addItem(_ item: Item)
}
