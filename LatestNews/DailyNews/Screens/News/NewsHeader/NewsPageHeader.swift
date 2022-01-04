//
//  NewsPageHeader.swift
//  LatestNews
//
//  Created by Pooja on 2/1/22
//

import UIKit
import TinyConstraints

class NewsPageHeader: UICollectionReusableView {

    let feedHeaderController = NewsHeaderController()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(feedHeaderController.view)
        feedHeaderController.view.edgesToSuperview()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
