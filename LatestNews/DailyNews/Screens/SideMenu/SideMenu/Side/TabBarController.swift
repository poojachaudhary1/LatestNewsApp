//
//  ViewController.swift
//  LatestNews
//
//  Created by Pooja on 3/1/22.
//

import UIKit

class TabBarController: UITabBarController {

    var feedVC = NewsViewController()
   
    weak var menuDelegate: SlideMenuDelegate?


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureTabBar()
        setupMenuButton()

    }

    func configureTabBar() {
        feedVC.title = "Latest News"
        feedVC.tabBarItem = UITabBarItem(title: "Latest News", image: UIImage(systemName: "house"), tag: 0)


        let feedNavigationController = UINavigationController(rootViewController: feedVC)
        viewControllers = [feedNavigationController]

    }

    private func setupMenuButton() {
        let menuButton = UIBarButtonItem(image: UIImage(named: "hamburger.png"),
                                         style: .plain, target: self, action: #selector(openMenu))
        feedVC.navigationItem.leftBarButtonItem = menuButton
        feedVC.navigationItem.leftBarButtonItem?.tintColor = .black
    }

    @objc func openMenu() {
        menuDelegate?.configureSlideMenu()
    }


}
