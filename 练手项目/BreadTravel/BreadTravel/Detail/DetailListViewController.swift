//
//  DetailListViewController.swift
//  BreadTravel
//
//  Created by lei xu on 2020/9/2.
//  Copyright © 2020 lei xu. All rights reserved.
//

import UIKit

class DetailListViewController: UIViewController {
    var tableView: UITableView!
    var itemsData: [Any]?
    static let cellName = "detailListCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView()
        tableView.mj_header=MJRefreshNormalHeader.init(refreshingBlock: loadNewData)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(DetailListCell.self, forCellReuseIdentifier: Self.cellName)
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets.zero)
        }
        
    }
    
    func loadNewData() {
        
    }
    
    func loadMoreData() {
        
    }

}





extension DetailListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemsData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.cellName)
        
        return cell!
    }
    
    
}

extension DetailListViewController: UITableViewDelegate {
    
}
