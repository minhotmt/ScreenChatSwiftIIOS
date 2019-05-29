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
    let commingCellId = "CommingCell"
    let txtInputTextView = UITextView()
    var messagess: [String] = []
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewInput: UIView!
    @IBOutlet weak var btnSend: UIButton!
    var contrainViewInputBottom: NSLayoutConstraint!
    var contrainHeighTextView: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareView()
        //register tableview
        self.tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: chatCellId)
        self.tableView.register(CommingTableViewCell.self, forCellReuseIdentifier: commingCellId)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        //prepare messagess
        self.messagess.append("Text messaging")
        self.messagess.append("Text messaging, or texting, is the act of composing and sending electronic messages, typically consisting of alphabetic and numeric characters, between two or more users of mobile devices, desktops/laptops, or other type of compatible computer. ")
        self.messagess.append("Text messaging, or texting, is the act of composing and sending electronic messages, typically consisting of alphabetic and numeric characters, between two or more users of mobile devices, desktops/laptops, or other type of compatible computer. ")
        self.messagess.append("Text messaging")
        
        self.messagess.append("Text messaging, or texting, is the act of composing and sending electronic messages, typically consisting of alphabetic and numeric characters, between two or more users of mobile devices, desktops/laptops, or other type of compatible computer. ")
        self.messagess.append("Text messaging")
        
        self.messagess.append("Text messaging, or texting, is the act of composing and sending electronic messages, typically consisting of alphabetic and numeric characters, between two or more users of mobile devices, desktops/laptops, or other type of compatible computer. ")
        self.messagess.append("Text messaging")
        
        self.view.translatesAutoresizingMaskIntoConstraints = false
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        contrainViewInputBottom = NSLayoutConstraint(item: viewInput, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        view.addConstraint(contrainViewInputBottom)
        scrollToLastRow()
        tableView.keyboardDismissMode = .onDrag
    }
    
    
    func prepareView(){
        
        self.view.addSubview(txtInputTextView)
        
        //ViewInput
        self.viewInput.translatesAutoresizingMaskIntoConstraints = false
        self.viewInput.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.viewInput.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.viewInput.heightAnchor.constraint(lessThanOrEqualToConstant: 250).isActive = true
        self.viewInput.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        //Button Send
        self.btnSend.translatesAutoresizingMaskIntoConstraints = false
        self.btnSend.trailingAnchor.constraint(equalTo: viewInput.trailingAnchor, constant: -10).isActive = true
        self.btnSend.bottomAnchor.constraint(equalTo: viewInput.bottomAnchor, constant: -10).isActive = true
        self.btnSend.widthAnchor.constraint(equalToConstant: 100).isActive = true
        self.btnSend.heightAnchor.constraint(equalToConstant: 45).isActive = true
        self.btnSend.setTitleColor(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), for: .normal)
        self.btnSend.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
        //txttextview
        self.txtInputTextView.translatesAutoresizingMaskIntoConstraints = false
        contrainHeighTextView = self.txtInputTextView.heightAnchor.constraint(equalToConstant: 45)
        self.txtInputTextView.bottomAnchor.constraint(equalTo: viewInput.bottomAnchor, constant: -10).isActive = true
        self.txtInputTextView.leadingAnchor.constraint(equalTo: viewInput.leadingAnchor, constant: 20).isActive = true
        self.txtInputTextView.trailingAnchor.constraint(equalTo: btnSend.leadingAnchor, constant: 10).isActive = true
        self.txtInputTextView.topAnchor.constraint(equalTo: viewInput.topAnchor, constant: 10).isActive = true
        self.txtInputTextView.layer.borderColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        self.txtInputTextView.layer.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        self.txtInputTextView.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        self.txtInputTextView.font = .systemFont(ofSize: 18)
        self.txtInputTextView.layer.cornerRadius = 16
        self.txtInputTextView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 5, right: 10)
        self.txtInputTextView.isScrollEnabled = true
        self.txtInputTextView.delegate = self
        contrainHeighTextView.isActive = true
        textViewDidChange(self.txtInputTextView)
        
        //TableView
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: viewInput.topAnchor, constant: -10).isActive = true
        
        //InputAccessoryView
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        customView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        let btnBack = UIButton()
        let btnNext = UIButton()
        let btnEnter = UIButton()
        let btnImage = UIButton()
        customView.addSubview(btnNext)
        customView.addSubview(btnBack)
        customView.addSubview(btnEnter)
        customView.addSubview(btnImage)
        btnBack.setTitle("Next", for: .normal)
        btnNext.setTitle("Back", for: .normal)
        btnEnter.setTitle("Enter", for: .normal)
        btnImage.setImage(#imageLiteral(resourceName: "girl1"), for: .normal)
        
        btnNext.translatesAutoresizingMaskIntoConstraints = false
        btnNext.addTarget(self, action: #selector(actionNext), for: .touchUpInside)
        btnNext.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 10).isActive = true
        btnNext.centerYAnchor.constraint(equalTo: customView.centerYAnchor).isActive = true
        btnNext.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btnNext.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        btnBack.translatesAutoresizingMaskIntoConstraints = false
        btnBack.leadingAnchor.constraint(equalTo: btnNext.trailingAnchor, constant: 20).isActive = true
        btnBack.centerYAnchor.constraint(equalTo: customView.centerYAnchor).isActive = true
        
        btnEnter.translatesAutoresizingMaskIntoConstraints = false
        btnEnter.addTarget(self, action: #selector(actionEnter), for: .touchUpInside)
        btnEnter.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -20).isActive = true
        btnEnter.centerYAnchor.constraint(equalTo: customView.centerYAnchor).isActive = true
        
        btnImage.translatesAutoresizingMaskIntoConstraints = false
        btnImage.leadingAnchor.constraint(equalTo: btnBack.trailingAnchor, constant: 20).isActive = true
        btnImage.centerYAnchor.constraint(equalTo: customView.centerYAnchor).isActive = true
        btnImage.widthAnchor.constraint(equalToConstant: 35).isActive = true
        btnImage.heightAnchor.constraint(equalToConstant: 35).isActive = true
        self.txtInputTextView.inputAccessoryView = customView
        //End - InputAccessoryView
        
    }
    
    @objc func actionNext(sender: UIButton!) {
        print("Back Action")
    }
    
    @objc func actionEnter(sender: UIButton!){
        if self.txtInputTextView.text!.isEmpty {
            print("Empty Message")
            return
        }
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy 'at' hh:mm"
        let result = formatter.string(from: date)
        print(result)
        self.messagess.append(self.txtInputTextView.text!)
        self.txtInputTextView.text = ""
        if self.txtInputTextView.frame.size.height >= 45 {
            contrainHeighTextView.isActive = false
            contrainHeighTextView = self.txtInputTextView.heightAnchor.constraint(equalToConstant: 45)
            contrainHeighTextView.isActive = true
        }
        self.tableView.reloadData()
        scrollToLastRow()
        view.layoutIfNeeded()
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
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messagess.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: chatCellId) as! ChatTableViewCell
        let commingCell = self.tableView.dequeueReusableCell(withIdentifier: commingCellId) as! CommingTableViewCell
        if indexPath.row % 2 == 0 {
            cell.messageLabel.text = messagess[indexPath.row]
            cell.selectionStyle = .none
            return cell
        } else {
            commingCell.messageLabel.text = messagess[indexPath.row]
            commingCell.selectionStyle = .none
            return commingCell
        }
    }
    
    @IBAction func sendAction(_ sender: Any) {
        if self.txtInputTextView.text!.isEmpty {
            print("Empty Message")
            return
        }
        self.messagess.append(self.txtInputTextView.text!)
        self.txtInputTextView.text = ""
        if self.txtInputTextView.frame.size.height >= 45 {
            contrainHeighTextView.isActive = false
            contrainHeighTextView = self.txtInputTextView.heightAnchor.constraint(equalToConstant: 50)
            contrainHeighTextView.isActive = true
        }
        view.layoutIfNeeded()
        self.tableView.reloadData()
        scrollToLastRow()
        
    }
    
    var previousRect = CGRect.zero
}

extension ChatViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.frame.size.height >= 200 {
            print("Limit height")
            contrainHeighTextView.isActive = false
            return
        }
        
        //Get event textview newline
        let pos = textView.endOfDocument
        let currentRect = textView.caretRect(for: pos)
        self.previousRect = self.previousRect.origin.y == 0.0 ? currentRect : previousRect
        if(currentRect.origin.y > previousRect.origin.y){
            //resize height of UITextView
            let size = CGSize(width: textView.frame.width, height: .infinity)
            let estimatedSize = textView.sizeThatFits(size)
            textView.constraints.forEach { (constraint) in
                if constraint.firstAttribute == .height {
                    print("resize")
                    constraint.constant = estimatedSize.height
                }
            }
        }
        previousRect = currentRect
    }
    
}
