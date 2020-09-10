//
//  HomeTBC.swift
//  CarShare
//
//  Created by Stephen Learmonth on 08/09/2020.
//  Copyright © 2020 Stephen Learmonth. All rights reserved.
//

import UIKit
import Firebase

class HomeTBC: UITabBarController {
    
    // MARK: - Properties
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeNav = UINavigationController(rootViewController: HomeTVC())
        homeNav.navigationBar.prefersLargeTitles = true
        homeNav.navigationBar.topItem?.title = "Home"
        homeNav.navigationBar.barStyle = .black
        homeNav.navigationBar.backgroundColor = .systemGreen
        homeNav.tabBarItem = .init(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        
        let groupsVC = GroupsVC()
        groupsVC.tabBarItem = .init(title: "Groups", image: UIImage(systemName: "person.3.fill"), tag: 1)
        
        let chatVC = ChatVC()
        chatVC.tabBarItem = .init(title: "Chat", image: UIImage(systemName: "speaker.fill"), tag: 2)

        let activeOffersVC = ActiveOffersVC()
        activeOffersVC.tabBarItem = .init(title: "Active Offers", image: UIImage(systemName: "cart"), tag: 3)

        let moreVC = MoreVC()
        moreVC.tabBarItem = .init(title: "More", image: UIImage(systemName: "plus.app.fill"), tag: 4)

        let tabBarItems = [homeNav, groupsVC, chatVC, activeOffersVC, moreVC]
        viewControllers = tabBarItems
    }
    
    
}
