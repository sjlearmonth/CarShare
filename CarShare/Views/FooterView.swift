//
//  FooterView.swift
//  CarShare
//
//  Created by Stephen Learmonth on 10/09/2020.
//  Copyright © 2020 Stephen Learmonth. All rights reserved.
//

import UIKit

protocol FooterViewDelegate: class {
    func handleFindALift()
}

class FooterView: UIView {

    // MARK: - Properties
    
    weak var delegate: FooterViewDelegate?
    
    private let findALiftButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Find A Lift", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(handleFindALift), for: .touchUpInside)
        return button
    }()
    
    private let offerALiftButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Offer A Lift", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(handleOfferALift), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [findALiftButton, offerALiftButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillProportionally
        return stackView
    }()

    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func handleFindALift() {
        delegate?.handleFindALift()
    }
    
    @objc func handleOfferALift() {
        print("DEBUG: Offer A Lift Clicked ")
    }

    // MARK: - Helper Functions
    
    private func configureUI() {
        
        self.addSubview(buttonsStackView)
        buttonsStackView.centerY(inView: self)
        buttonsStackView.anchor(left: leftAnchor, right: rightAnchor,
                                paddingLeft: 32, paddingRight: 32)
    }
}
