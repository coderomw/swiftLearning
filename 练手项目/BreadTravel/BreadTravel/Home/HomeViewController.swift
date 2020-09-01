//
//  HomeViewController.swift
//  BreadTravel
//
//  Created by lei xu on 2020/8/26.
//  Copyright © 2020 lei xu. All rights reserved.
//

import Alamofire

struct homeParam: Encodable {
    var next_start: String
    
}


class HomeViewController: UIViewController {
    lazy var tableView = UITableView()
    var addBtnView: UIImageView!
    static let cellName = "homeCell"
    var itemDatas = [HomeElementData]()
    var nextPage = 0
    var isHidden: Bool = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: loadNewData)
        tableView.mj_footer = MJRefreshAutoFooter(refreshingBlock: loadMoreData)
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: Self.cellName)
        tableView.dataSource=self
        tableView.delegate=self
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        addBtnView = UIImageView.init()
        addBtnView.backgroundColor = UIColor.white
        addBtnView.layer.cornerRadius = 30
        addBtnView.clipsToBounds = true
//        addBtnView.layer.ani
        let imagePath: String? = Bundle.main.path(forResource: "homepage_addButton_animated@2x", ofType: "gif")
        addBtnView.kf.setImage(with: ImageResource(downloadURL: URL(fileURLWithPath: imagePath!)))
        view.addSubview(addBtnView)
        addBtnView.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.bottom.equalTo(view).offset(-40)
            make.width.height.equalTo(60)
        }
        
        tableView.mj_header?.beginRefreshing()
    }
    
    
    
    
    func loadNewData() {
        nextPage = 0
        loadData()
    }
    
    func loadMoreData() {
        loadData()
    }
    
    func loadData() {
        var param: homeParam? = nil
        if nextPage > 0 {
            param = homeParam(next_start: String(nextPage))
        }
        AF.request(API.homeListApi, method: .get, parameters: param).responseJSON { [weak self](response) in
            switch response.result {
            case .success(let json):
                let jsonString = JSONString(from: json)/*json as? String else {return}*/
                guard let homeModel = jsonString.kj.model(type: HomeListModel.self) as? HomeListModel else {return}
                let elements = homeModel.data?.elements
                if self?.nextPage == 0 {
                    self?.itemDatas.removeAll()
                }
                for listItem in elements ?? [] {
                    guard let elementItem = listItem.data?.first else {continue}
                    self?.itemDatas.append(elementItem)
                }
                self?.tableView.reloadData()
                self?.nextPage = homeModel.data?.next_start as! Int
                
            case .failure(_):
                break
            }
            self?.tableView.mj_header?.endRefreshing()
            self?.tableView.mj_footer?.endRefreshing()
        }
    }
    
    
    
    func hideAddBtnAnimated() {
        if isHidden {return}
        let functionName = #function
        print(functionName)
        isHidden = true
        UIView.animate(withDuration: 0.7, animations: {
            let newFrame = CGRect.init(x: self.addBtnView.frame.origin.x, y: 1000, width: self.addBtnView.frame.size.width, height: self.addBtnView.frame.size.height)
            self.addBtnView.frame = newFrame
            self.addBtnView.transform = CGAffineTransform.init(rotationAngle: CGFloat.pi / 2)
        }) { (boolValue) in
            
        }
    }
    
    func showAddBtnAnimated() {
        if !isHidden {return}
        let functionName = #function
        print(functionName)
        isHidden = false
        UIView.animate(withDuration: 0.7, animations: {
            let newFrame = CGRect.init(x: self.addBtnView.frame.origin.x, y: UIScreen.main.bounds.size.height - 100, width: self.addBtnView.frame.size.width, height: self.addBtnView.frame.size.height)
            self.addBtnView.frame = newFrame
            self.addBtnView.transform = CGAffineTransform.init(rotationAngle: 0.0).inverted()
        }) { (booValue) in
            
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let functionName = #function
        print(functionName, "\(scrollView.isTracking)", "\(scrollView.isDecelerating)", "\(scrollView.isDragging)")
        if scrollView.isDragging  {
            hideAddBtnAnimated()
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let functionName = #function
        print(functionName, "\(scrollView.isTracking)", "\(scrollView.isDecelerating)", "\(scrollView.isDragging)")
         if !scrollView.isDragging{
            showAddBtnAnimated()
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let functionName = #function
        print("----"+functionName, "\(scrollView.isTracking)", "\(scrollView.isDecelerating)", "\(scrollView.isDragging)")
//        if scrollView.isDragging || scrollView.isDecelerating || scrollView.isTracking {
            showAddBtnAnimated()
//        }
    }
    
}

extension HomeViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        tableView.mj_footer?.isHidden = itemDatas.count==0
        return itemDatas.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.cellName) as? HomeTableViewCell
        let cellModel = itemDatas[indexPath.section]
        cell?.setModel(cellModel)
        return cell!;
    }
    
}

extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        10
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        UIView.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    
}
