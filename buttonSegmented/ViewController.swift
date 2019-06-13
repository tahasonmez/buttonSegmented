//
//  ViewController.swift
//  buttonSegmented
//
//  Created by Taha Sönmez on 13.06.2019.
//  Copyright © 2019 Taha Sönmez. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let segmentindicator: UIView = {
        
        let v = UIView()
        
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.TSPrimary
        
        return v
    }()
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Customizing the segmented control
        
        segmentedControl.backgroundColor = .clear
        segmentedControl.tintColor = .clear
        
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font : UIFont(name: "AvenirNextCondensed-Medium", size: 20)!, NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
        
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font : UIFont(name: "AvenirNextCondensed-Medium", size: 24)!, NSAttributedString.Key.foregroundColor: UIColor.TSPrimary], for: .selected)
        
        
        // End of customizing the segmented control
        
        self.view.addSubview(segmentindicator)
        
        setupLayout()
    }
    func setupLayout() {
        
        segmentindicator.snp.makeConstraints { (make) in
            
            make.top.equalTo(segmentedControl.snp.bottom).offset(3)
            make.height.equalTo(2)
            
            make.width.equalTo(15 + segmentedControl.titleForSegment(at: 0)!.count * 8)
            make.centerX.equalTo(segmentedControl.snp.centerX).dividedBy(segmentedControl.numberOfSegments)
            
        }
        
    }
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        let numberOfSegments = CGFloat(segmentedControl.numberOfSegments)
        let selectedIndex = CGFloat(sender.selectedSegmentIndex)
        let titlecount = CGFloat((segmentedControl.titleForSegment(at: sender.selectedSegmentIndex)!.count))
        segmentindicator.snp.remakeConstraints { (make) in
            
            make.top.equalTo(segmentedControl.snp.bottom).offset(3)
            make.height.equalTo(2)
            make.width.equalTo(15 + titlecount * 8)
            make.centerX.equalTo(segmentedControl.snp.centerX).dividedBy(numberOfSegments / CGFloat(3.0 + CGFloat(selectedIndex-1.0)*2.0))
            
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
            self.segmentindicator.transform = CGAffineTransform(scaleX: 1.4, y: 1)
        }) { (finish) in
            UIView.animate(withDuration: 0.4, animations: {
                self.segmentindicator.transform = CGAffineTransform.identity
            })
        }
    }
}
extension UIColor {
    
    @nonobjc class var TSPrimary: UIColor {
        
        return UIColor(red:0.85, green:0.11, blue:0.38, alpha:1.0)
        
    }
    
}
