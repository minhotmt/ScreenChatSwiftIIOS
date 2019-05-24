//
//  ChatViewController.swift
//  DemoScreenChat
//
//  Created by MinhNV on 5/24/19.
//  Copyright © 2019 MinhNV. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let chatCellId = "ChatCell"
    var messagess: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtInput: UITextField!
    @IBOutlet weak var viewInput: UIView!
    @IBOutlet weak var btnSend: UIButton!
    var contrainViewInputBottom: NSLayoutConstraint!
    var contrainTableBottom: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareView()
        //register tableview
        self.tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: chatCellId)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .black
        
        //prepare messagess
        self.messagess.append("This may be a dumb suggestion")
        self.messagess.append("This may be a dumb suggestion, but did you try cleaning and rebuilding? Xcode can sometimes continue to appear to have the error if you used its auto-complete suggestion.")
        self.messagess.append("This may be a dumb suggestion")
        self.messagess.append("This may be a dumb suggestion, but did you try cleaning and rebuilding? Xcode can sometimes continue to appear to have the error if you used its auto-complete suggestion.")
        self.messagess.append("This may be a dumb suggestion")
        self.messagess.append("This may be a dumb suggestion, but did you try cleaning and rebuilding? Xcode can sometimes continue to appear to have the error if you used its auto-complete suggestion.")
        self.messagess.append("This may be a dumb suggestion")
        self.messagess.append("This may be a dumb suggestion, but did you try cleaning and rebuilding? Xcode can sometimes continue to appear to have the error if you used its auto-complete suggestion.")
        self.messagess.append("This may be a dumb suggestion")
        self.messagess.append("This may be a dumb suggestion, but did you try cleaning and rebuilding? Xcode can sometimes continue to appear to have the error if you used its auto-complete suggestion.")
        self.messagess.append("This may be a dumb suggestion")
        self.messagess.append("This may be a dumb suggestion, but did you try cleaning and rebuilding? Xcode can sometimes continue to appear to have the error if you used its auto-complete suggestion.")
        self.messagess.append("This may be a dumb suggestion")
        
        self.view.translatesAutoresizingMaskIntoConstraints = false
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        contrainViewInputBottom = NSLayoutConstraint(item: viewInput, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        contrainTableBottom = NSLayoutConstraint(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: viewInput, attribute: .top, multiplier: 1, constant: 0)
        view.addConstraint(contrainViewInputBottom)
        view.addConstraint(contrainTableBottom)
        scrollToLastRow()
        tableView.keyboardDismissMode = .onDrag
   
    }
    

    func prepareView(){
        
        //View
        
        //ViewInput
        self.viewInput.translatesAutoresizingMaskIntoConstraints = false
        self.viewInput.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.viewInput.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.viewInput.heightAnchor.constraint(equalToConstant: 60).isActive = true
        self.viewInput.backgroundColor = .green
        
        //Button
        self.btnSend.translatesAutoresizingMaskIntoConstraints = false
        self.btnSend.trailingAnchor.constraint(equalTo: viewInput.trailingAnchor, constant: -20).isActive = true
        self.btnSend.topAnchor.constraint(equalTo: viewInput.topAnchor, constant: 10).isActive = true
        self.btnSend.bottomAnchor.constraint(equalTo: viewInput.bottomAnchor, constant: -10).isActive = true
        self.btnSend.widthAnchor.constraint(equalToConstant: 100).isActive = true
        self.btnSend.setTitleColor(.red, for: .normal)
        
        //Textinput
        self.txtInput.translatesAutoresizingMaskIntoConstraints = false
        self.txtInput.trailingAnchor.constraint(equalTo: btnSend.leadingAnchor, constant: 10).isActive = true
        self.txtInput.topAnchor.constraint(equalTo: viewInput.topAnchor, constant: 10).isActive = true
        self.txtInput.leadingAnchor.constraint(equalTo: viewInput.leadingAnchor, constant: 30).isActive = true
        self.txtInput.bottomAnchor.constraint(equalTo: viewInput.bottomAnchor, constant: -10).isActive = true
        self.txtInput.layer.cornerRadius = 15.0
        self.txtInput.layer.borderWidth = 2.0
        self.txtInput.layer.borderColor = UIColor.red.cgColor
        
        //TableView
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
    
    func scrollToLastRow() {
        let indexPath = NSIndexPath(row: messagess.count - 1, section: 0)
        self.tableView.scrollToRow(at: indexPath as IndexPath, at: .bottom, animated: false)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            contrainViewInputBottom.constant = -keyboardSize.height
            view.layoutIfNeeded()
            scrollToLastRow()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        scrollToLastRow()
    }
    
    
    @objc func keyboardWillHide(notification: NSNotification) {
        contrainViewInputBottom.constant = 0
        view.layoutIfNeeded()
        scrollToLastRow()
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
            print("Empty Message")
            return
        }
        self.messagess.append(self.txtInput.text!)
        self.txtInput.text = ""
        self.tableView.reloadData()
        scrollToLastRow()
        view.layoutIfNeeded()
    }
}
