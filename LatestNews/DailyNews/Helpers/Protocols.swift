//
//  Protocols.swift
//  LatestNews
//
//  Created by Pooja on 2/1/22.
//

import UIKit
import RxCocoa

protocol SlideMenuDelegate: class {
    func configureSlideMenu()
}
protocol SourcesViewControllerDelegate: class {
    func pushToSourcesVC(source: UIViewController)
}

    
