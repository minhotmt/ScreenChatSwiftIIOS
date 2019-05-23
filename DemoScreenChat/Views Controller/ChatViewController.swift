//
//  ChatViewController.swift
//  DemoScreenChat
//
//  Created by MinKo on 5/23/19.
//  Copyright © 2019 Minko. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let chatCellId = "MessageCell"
    var messagess: [String] = []

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
//        self.tableView.register(UINib.init(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: productCellId)
        self.tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: chatCellId)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = UIColor(white: 0.85, alpha: 1)
        
        self.messagess.append("This may be a dumb suggestion")
        self.messagess.append("This may be a dumb suggestion, but did you try cleaning and rebuilding? Xcode can sometimes continue to appear to have the error if you used its auto-complete suggestion.")
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messagess.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: chatCellId) as! ChatTableViewCell
        cell.messageLabel.text = messagess[indexPath.row]
        cell.isComming = indexPath.row % 2 == 0
        return cell
    }

    @IBAction func sendAction(_ sender: Any) {
        if self.txtInput.text!.isEmpty {
            print("Empty")
            return
        }
        self.messagess.append(self.txtInput.text!)
        self.txtInput.text = ""
        self.tableView.reloadData()
    }
}
