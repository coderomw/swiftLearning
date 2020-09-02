//
//  HomeTableViewCell.swift
//  BreadTravel
//
//  Created by lei xu on 2020/8/26.
//  Copyright © 2020 lei xu. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    var coverImgView: UIImageView!
    var titleLab: UILabel!
    var timeLab: UILabel!
    var locationLab: UILabel!
    var userImgView: UIImageView!
    var userNameLab: UILabel!
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        coverImgView = UIImageView.init()
        coverImgView.layer.cornerRadius = 5
        coverImgView.clipsToBounds = true
        coverImgView.contentMode = .scaleAspectFill
        
        titleLab = UILabel.init()
        titleLab.textColor=UIColor.white
        titleLab.font=UIFont.boldSystemFont(ofSize: 19)
        
        let lineView = UIView.init()
        lineView.backgroundColor=UIColor.init(red: 66/255.0, green: 188/255.0, blue: 203/255.0, alpha: 1.0)
        lineView.layer.cornerRadius=2
        
        timeLab = UILabel.init()
        timeLab.textColor=UIColor.white
        timeLab.font=UIFont.systemFont(ofSize: 11)
        
        locationLab = UILabel.init()
        locationLab.textColor=UIColor.white
        locationLab.font=UIFont.systemFont(ofSize: 11)
        
        userImgView = UIImageView.init()
        userImgView.layer.cornerRadius = 15
        userImgView.clipsToBounds = true
        
        userNameLab = UILabel.init()
        userNameLab.textColor = UIColor.white
        userNameLab.font = UIFont.systemFont(ofSize: 11)
        
        contentView.addSubview(coverImgView)
        contentView.addSubview(titleLab)
        contentView.addSubview(lineView)
        contentView.addSubview(timeLab)
        contentView.addSubview(locationLab)
        contentView.addSubview(userImgView)
        contentView.addSubview(userNameLab)
        
        coverImgView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(self.contentView).offset(10)
            make.right.equalTo(self.contentView).offset(-10)
        }
        titleLab.snp.makeConstraints { (make) in
            make.top.equalTo(coverImgView).offset(10)
            make.left.equalTo(coverImgView).offset(10)
            make.right.equalTo(coverImgView).offset(-10)
            make.height.equalTo(35)
        }
        lineView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLab.snp_bottomMargin).offset(5)
            make.left.equalTo(titleLab)
            make.width.equalTo(4)
            make.height.equalTo(26)
        }
        timeLab.snp.makeConstraints { (make) in
            make.leftMargin.equalTo(lineView).offset(5)
            make.top.equalTo(lineView)
            make.right.equalTo(coverImgView)
            make.height.equalTo(13)
        }
        locationLab.snp.makeConstraints { (make) in
            make.left.equalTo(timeLab)
            make.bottom.equalTo(lineView)
            make.right.equalTo(timeLab)
            make.height.equalTo(13)
        }
        userImgView.snp.makeConstraints { (make) in
            make.left.equalTo(coverImgView).offset(10)
            make.bottom.equalTo(coverImgView).offset(-10)
            make.width.height.equalTo(30)
        }
        userNameLab.snp.makeConstraints { (make) in
            make.centerY.equalTo(userImgView)
            make.left.equalTo(userImgView.snp_rightMargin).offset(15)
            make.right.equalTo(coverImgView)
            make.height.equalTo(20)
        }
    }
    
    
    func setModel(_ model: HomeElementDataType4) {
        let url = URL(string: model.cover_image)
        coverImgView.kf.indicatorType = .activity
        coverImgView.kf.setImage(with: url)
        titleLab.text = model.name
        
        var viewCountStr: String = String(model.view_count)
        
        if model.view_count/10000 > 0 {
            let wCount = model.view_count/10000
            viewCountStr = String(wCount) + "万 "
        }
        
        timeLab.text = model.first_day + "  " + model.day_count + "天  " + viewCountStr + "浏览"
        locationLab.text = model.popular_place_str
        
        userImgView.kf.setImage(with: URL(string: model.user.avatar_m))
        userNameLab.text = model.user.name
        let userNameStr: NSMutableAttributedString = NSMutableAttributedString.init(string: "by  " + model.user.name)
        userNameStr.addAttribute(.font, value: UIFont.init(name: "Helvetica-Oblique", size: 11.0) as Any, range: NSRange.init(location: 0, length: 1))
        userNameLab.attributedText = userNameStr
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
