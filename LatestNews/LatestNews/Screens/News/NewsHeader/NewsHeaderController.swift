//
//  NewsHeaderController.swift
//  LatestNews
//
//  Created by Pooja on 2/1/22.
//

import UIKit
import SafariServices
import RxSwift
import RxCocoa
import RxDataSources

class NewsHeaderController: BaseListController, UICollectionViewDelegateFlowLayout {

    let cellId = "cellId"
    let viewModel: NewsHeaderViewModel
    private let disposeBag = DisposeBag()
    
    init(_ viewModel: NewsHeaderViewModel = NewsHeaderViewModel()) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        
        viewModel.loadPageTrigger.onNext(())

        let dataSource = RxCollectionViewSectionedReloadDataSource<PresentationSection>(configureCell: { 
            (ds, cv, ip, news) in
            guard let cell = cv.dequeueReusableCell(withReuseIdentifier: self.cellId, for: ip) as? NewsHeaderCell else { return UICollectionViewCell() }
            cell.newsEverything = news
            cell.scrollIndicator.currentPage = ip.item
            return cell
        })
        
        viewModel.news
            .observeOn(MainScheduler.instance)
            .map {
                news in [PresentationSection(header: "", items: news)]
        }
        .bind(to: collectionView.rx.items(dataSource: dataSource))
    .disposed(by: disposeBag)
        
        collectionView.rx.modelSelected(EverythingPresentation.self)
            .subscribe(onNext: { [weak self]
                news in
                guard let self = self else { return }
                let safariVC = SFSafariViewController(url: URL(string: news.url)!)
                self.show(safariVC, sender: nil)
            })
        .disposed(by: disposeBag)
        
    }
    
    func configureCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.register(NewsHeaderCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.dataSource = nil
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: view.frame.width / 1.2)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}
