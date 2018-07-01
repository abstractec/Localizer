//
//  NewProjectViewController.swift
//  Localizer
//
//  Created by John Haselden on 01/07/2018.
//  Copyright © 2018 John Haselden. All rights reserved.
//

import Cocoa

class NewProjectViewController: NSViewController {

    @IBOutlet weak var projectNameField: NSTextField!
    @IBOutlet var projectDescriptionField: NSTextView!

    var delegate: NewProjectDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func save(_ sender: Any) {
        let name = projectNameField.stringValue
        let info = projectDescriptionField.string

        if name.count > 0 && info.count > 0 {
            let project = Project(name: name, details: info)

            if let delegate = delegate {
                delegate.createProject(project)
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

protocol NewProjectDelegate {
    func createProject(_ project: Project)
}
