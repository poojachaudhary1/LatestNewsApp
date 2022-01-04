//
//  SideMenuCell.swift
//  LatestNews
//
//   Created by Pooja on 2/1/22.
//

import UIKit
import TinyConstraints
import RxSwift
import RxCocoa

class SideMenuCell: UITableViewCell {

    var tableView: UITableView!
    var arrowButton = UIButton()
    var sources: [Sources]? {
        didSet {

        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
//        configureTableView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBinding() {
        
        
    }

    private func setupViews() {
        arrowButton = UIButton(frame: .init(x: 0, y: 0, width: 50, height: 50))

    }
    
    private func configureTableView() {
        tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(SideMenuSourcesCell.self, forCellReuseIdentifier: "cellId")
        tableView.dataSource = self
        addSubview(tableView)
        tableView.edgesToSuperview(insets: .top(60), usingSafeArea: true)
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = 40
        tableView.separatorStyle = .none
    }
}

extension SideMenuCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sources?.count == 0 {
            return 0
        }
        return sources!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as? SideMenuSourcesCell else { return UITableViewCell() }
        cell.sourcesNames = sources?[indexPath.row]
        
        return cell
    }
    
    
}

