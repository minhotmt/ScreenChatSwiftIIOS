//
//  CommingTableViewCell.swift
//  DemoScreenChat
//
//  Created by MinhNV on 5/28/19.
//  Copyright © 2019 MinhNV. All rights reserved.
//

import UIKit

class CommingTableViewCell: UITableViewCell {
    
    let messageLabel = UILabel()
    let backgroundMessage = UIView()
    let iconFriend = UIImageView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        messageLabel.numberOfLines = 0
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        backgroundMessage.translatesAutoresizingMaskIntoConstraints = false
        iconFriend.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backgroundMessage)
        addSubview(messageLabel)
        addSubview(iconFriend)
        iconFriend.contentMode = .scaleAspectFit
        iconFriend.image = #imageLiteral(resourceName: "girl1")
        iconFriend.clipsToBounds = true
        iconFriend.layer.cornerRadius = 22
        backgroundMessage.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        backgroundMessage.layer.cornerRadius = 10
        
        let contrains = [
            iconFriend.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            iconFriend.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            iconFriend.widthAnchor.constraint(equalToConstant: 44),
            iconFriend.heightAnchor.constraint(equalToConstant: 44),
            messageLabel.leadingAnchor.constraint(equalTo: iconFriend.trailingAnchor, constant: 25),
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
