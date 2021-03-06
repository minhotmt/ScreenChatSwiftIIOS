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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        messageLabel.numberOfLines = 0
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        backgroundMessage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backgroundMessage)
        addSubview(messageLabel)
        backgroundMessage.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        backgroundMessage.layer.cornerRadius = 10
        
        let contrains = [
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25),
            messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            backgroundMessage.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -15),
            backgroundMessage.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -15),
            backgroundMessage.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 15),
            backgroundMessage.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 15)
        ]
        NSLayoutConstraint.activate(contrains)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
