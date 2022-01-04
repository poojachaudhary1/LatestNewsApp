//
//  ContainerController.swift
//  LatestNews
//
//  Created by Pooja on 3/1/22.
//

import UIKit
import TinyConstraints

class ContainerController: UIViewController {

    let tabBar = TabBarController()
    private var isMenuHidden = true

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTabBarView()
    }

    func setupTabBarView() {
        view.addSubview(tabBar.view)
        addChild(tabBar)
        tabBar.didMove(toParent: self)
    }

}



