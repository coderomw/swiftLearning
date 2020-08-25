//
//  ViewController2.swift
//  GoogleNow
//
//  Created by lei xu on 2020/8/25.
//  Copyright © 2020 lei xu. All rights reserved.
//

import UIKit
import SnapKit

class ViewController2: UIViewController {

    var dismissBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        dismissBtn = UIButton(type: .custom)
        dismissBtn.backgroundColor = UIColor.red
        dismissBtn.layer.cornerRadius = 35
        dismissBtn.setImage(UIImage(named: "loading"), for: .normal)
        dismissBtn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        view.addSubview(dismissBtn)
        dismissBtn.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-100)
            make.width.height.equalTo(70)
        }
    }
    
    
    @objc func btnAction() {
        self.dismiss(animated: true, completion: nil)
    }

   
}
