//
//  ViewController.swift
//  Localizer
//
//  Created by John Haselden on 01/07/2018.
//  Copyright © 2018 John Haselden. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    var delegate: WelcomeDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func createNew(_ sender: Any) {
        
    }

    @IBAction func openExisting(_ sender: Any) {
    }

    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if let controller = segue.destinationController as? NewProjectViewController {
            controller.delegate = self
        }
    }

}

extension ViewController: NewProjectDelegate {
    func createProject(_ project: Project) {
        if let delegate = delegate {
            delegate.createProject(project)
            self.dismiss(nil)
        }
    }

}

protocol WelcomeDelegate {
    func createProject(_ project: Project)
    func selectedProject(_ project: Project)
}

