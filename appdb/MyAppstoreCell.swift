//
//  MyAppstoreCell.swift
//  appdb
//
//  Created by ned on 26/04/2019.
//  Copyright © 2019 ned. All rights reserved.
//

import UIKit
import Cartography

class MyAppstoreCell: UICollectionViewCell {

    var name: UILabel!
    var bundleId: UILabel!
    var installButton: RoundedButton!
    var moreImageButton: UIButton!
    
    func configure(with app: MyAppstoreApp) {
        name.text = app.name + " (\(app.size))"
        bundleId.text = app.bundleId
        installButton.linkId = app.id
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
    }
    
    func setup() {
        theme_backgroundColor = Color.veryVeryLightGray
        contentView.theme_backgroundColor = Color.veryVeryLightGray
        
        contentView.layer.cornerRadius = 6
        contentView.layer.borderWidth = 1 / UIScreen.main.scale
        contentView.layer.theme_borderColor = Color.borderCgColor
        layer.backgroundColor = UIColor.clear.cgColor
        
        // Name
        name = UILabel()
        name.theme_textColor = Color.title
        name.font = .systemFont(ofSize: 18.5~~16.5)
        name.numberOfLines = 1
        name.makeDynamicFont()
        
        // Bundle id
        bundleId = UILabel()
        bundleId.theme_textColor = Color.darkGray
        bundleId.font = .systemFont(ofSize: 14~~13)
        bundleId.numberOfLines = 1
        bundleId.makeDynamicFont()
        
        // Install button
        installButton = RoundedButton()
        installButton.titleLabel?.font = .boldSystemFont(ofSize: 13)
        installButton.makeDynamicFont()
        installButton.setTitle("Install".localized().uppercased(), for: .normal)
        installButton.theme_tintColor = Color.softGreen
        
        // More button
        moreImageButton = UIButton(type: .custom)
        moreImageButton.setImage(#imageLiteral(resourceName: "more"), for: .normal)
        moreImageButton.alpha = 0.9
        moreImageButton.isUserInteractionEnabled = false
        
        contentView.addSubview(name)
        contentView.addSubview(bundleId)
        contentView.addSubview(installButton)
        contentView.addSubview(moreImageButton)
        
        constrain(name, bundleId, installButton, moreImageButton) { name, bundleId, button, more in
            
            more.centerY == more.superview!.centerY
            more.left == more.superview!.left + Global.size.margin.value
            more.width == (22~~20)
            more.height == more.width
            
            button.right == button.superview!.right - Global.size.margin.value
            button.centerY == button.superview!.centerY

            name.left == more.right + Global.size.margin.value
            name.right == name.superview!.right - 100 - Global.size.margin.value
            name.top == name.superview!.top + (18~~12)
            
            bundleId.left == name.left
            bundleId.right == name.right
            bundleId.bottom == bundleId.superview!.bottom - (18~~12)
            
        }
    }
}
