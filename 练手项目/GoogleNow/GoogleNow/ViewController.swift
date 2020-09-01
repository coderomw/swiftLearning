//
//  ViewController.swift
//  GoogleNow
//
//  Created by lei xu on 2020/8/25.
//  Copyright © 2020 lei xu. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    var transition = BubbleTransition()
    let btn = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1)

        let imageView = UIImageView.init(image: UIImage(named: "google_logo"))
        view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(200)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(125)
        }
        
       
        btn.layer.cornerRadius=35
        btn.backgroundColor=UIColor.white
        btn.setImage(UIImage(named: "speaking"), for: .normal)
        btn.addTarget(self, action: #selector(btnAction(_:)), for: .touchUpInside)
        view.addSubview(btn)
        btn.snp.makeConstraints { (make) in
            make.topMargin.equalTo(imageView).offset(200)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(70)
        }
        
    }
    
    @objc func btnAction(_ btn: UIButton) -> Void {
        let vc2 = ViewController2()
        vc2.modalPresentationStyle = .custom
        vc2.transitioningDelegate = self
        self.present(vc2, animated: true, completion: nil)
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = btn.center
        transition.bubbleColor = btn.backgroundColor!
        transition.animationBlock = {(transitionMode) -> Void in
            if transitionMode == .present {
                if let targetVC = presented as? ViewController2 {
                    targetVC.dismissBtn.frame.origin.y = self.view.frame.height - 150
                }
            }
        }
        transition.duration = 0.4
        return transition
        }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = btn.center
        transition.bubbleColor = btn.backgroundColor!
        transition.animationBlock = {(transitionMode) -> Void in
            if transitionMode == .dismiss {
                if let dismissedVC = dismissed as? ViewController2 {
                    dismissedVC.dismissBtn.frame.origin.y = self.view.frame.height - 250

                }
            }
        }
        transition.duration = 0.4
        return transition
    }
    
}


