//
//  ProjectViewController.swift
//  Localizer
//
//  Created by John Haselden on 01/07/2018.
//  Copyright © 2018 John Haselden. All rights reserved.
//

import Cocoa

class ProjectViewController: NSViewController {
    @IBOutlet weak var titleLabel: NSTextField!
    @IBOutlet weak var itemTableView: NSTableView!

    private var project: Project?

    weak var itemViewController: ItemViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }

    override func viewDidAppear() {
        self.performSegue(withIdentifier: NSStoryboardSegue.Identifier(rawValue: "welcome_segue"),
                          sender: nil)
    }

    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if let controller = segue.destinationController as? ViewController {
            controller.delegate = self
        } else if let controller = segue.destinationController as? AddItemViewController {
            controller.delegate = self
        } else if let controller = segue.destinationController as? ItemViewController {
            self.itemViewController = controller
        }
    }

    @IBAction func addItem(_ sender: Any) {
        self.performSegue(withIdentifier: NSStoryboardSegue.Identifier(rawValue: "add_item_segue"),
                          sender: nil)
    }

    func configureUI() {
        guard let project = project else {
            return
        }

        titleLabel.stringValue = project.name
        itemTableView.reloadData()

    }

}

extension ProjectViewController: NSTableViewDelegate {
    func tableViewSelectionDidChange(_ notification: Notification) {
        let idx = itemTableView.selectedRow

        print ("got a row")

        if let project = self.project, let itemViewController = itemViewController, idx < project.items.count {
            let item = project.items[idx]
            itemViewController.item = item
        }
        
    }
}

extension ProjectViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        if let project = self.project {
            return project.items.count
        }

        return 0
    }

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if let project = self.project, row < project.items.count {
            let item = project.items[row]

            var identifier: String?
            var value: String?

            if (tableColumn?.identifier)!.rawValue == "itemName" {
                identifier = "nameCell"
                value = item.name
            } else {
                identifier = "detailsCell"
                value = item.details
            }

            if let identifier = identifier,
                let value = value,
                let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: identifier),
                                                                       owner: nil) as? NSTableCellView {
                cell.textField?.stringValue = value
                return cell
            }

        }

        return nil

    }

}

extension ProjectViewController: WelcomeDelegate {
    func createProject(_ project: Project) {
        NSLog("create Project")
        self.project = project

        configureUI()
    }

    func selectedProject(_ project: Project) {
        NSLog("select project")

        self.project = project
        configureUI()
    }

}

extension ProjectViewController: AddItemDelegate {
    func addItem(_ item: Item) {
        if let project = self.project {
            project.items.append(item)

            self.configureUI()
        }
    }
}
