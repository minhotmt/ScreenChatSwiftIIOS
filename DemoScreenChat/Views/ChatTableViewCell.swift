//
//  ChatTableViewCell.swift
//  DemoScreenChat
//
//  Created by MinhNV on 5/24/19.
//  Copyright © 2019 MinhNV. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    let messageLabel = UILabel()
    let backgroundMessage = UIView()
    var contrainRight: NSLayoutConstraint!
    var contrainLeft: NSLayoutConstraint!
    
    var isComming: Bool!{
        didSet{
            messageLabel.textColor = isComming ? .white : .red
            backgroundMessage.backgroundColor = isComming ? .red : .white
            
            if isComming {
                contrainRight.isActive = false
                contrainLeft.isActive =  true
            } else {
                contrainRight.isActive = true
                contrainLeft.isActive = false
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        messageLabel.numberOfLines = 0
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        backgroundMessage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backgroundMessage)
        addSubview(messageLabel)
        contrainLeft = self.messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32)
        contrainRight = self.messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        backgroundMessage.backgroundColor = .white
        backgroundMessage.layer.cornerRadius = 10
        let contrains = [messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 32),
                         messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
                         messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
                         backgroundMessage.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -16),
                         backgroundMessage.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -15),
                         backgroundMessage.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 15),
                         backgroundMessage.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 15)
        ]
        NSLayoutConstraint.activate(contrains)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
