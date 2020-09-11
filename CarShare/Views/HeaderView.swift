//
//  HeaderView.swift
//  CarShare
//
//  Created by Stephen Learmonth on 10/09/2020.
//  Copyright © 2020 Stephen Learmonth. All rights reserved.
//

import UIKit

class HeaderView: UIView {

    // MARK: - Properties
    
    private let headerImageView: UIImageView = {
        let hiv = UIImageView()
        hiv.image = UIImage(named: "Stephen")
        hiv.contentMode = .scaleAspectFill
        hiv.clipsToBounds = true
        hiv.setHeight(height: 180)
        return hiv
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Good Morning, Stephen"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.backgroundColor = .clear
        label.textColor = .white
        return label
    }()

    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helper Functions
    
    private func configureUI() {
        
        self.addSubview(headerImageView)
        headerImageView.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor,
                               bottom: bottomAnchor, right: rightAnchor,
                               paddingTop: 0, paddingLeft: 0,
                               paddingBottom: 0, paddingRight: 0)
        
        self.addSubview(headerLabel)
        headerLabel.anchor(left: leftAnchor, bottom: bottomAnchor,
                           paddingLeft: 12, paddingBottom: 30)
        
        
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.clear.cgColor , UIColor.black.cgColor]
        gradient.locations = [0.85, 1]
        self.layer.addSublayer(gradient)
        gradient.frame = self.frame

    }
}
