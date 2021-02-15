//
//  ViewController.swift
//  twitterHeartBurst
//
//  Created by Lincoln Nguyen on 2/14/21.
//

import UIKit
import SwiftyGif

class ViewController: UIViewController {
    @IBOutlet weak var heart: UIImageView! {
        didSet {
            heart.isUserInteractionEnabled = true
            heart.image = UIImage(named: "favorite2")
        }
    }
    @IBOutlet weak var heartWidth: NSLayoutConstraint!
    @IBOutlet weak var tapArea: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapImageView(_:)))
        
        // Add Tap Gesture Recognizer
        tapArea.addGestureRecognizer(tapGestureRecognizer)
    }
    
    var isFavorited = false
    
    @objc private func didTapImageView(_ sender: UITapGestureRecognizer) {
        print("did tap image view", sender)
        
        if !isFavorited {
            do {
                let gif = try UIImage(gifName: "favoriteAnimate.gif")
                self.heart.setGifImage(gif, loopCount: 1)
                // self.heart.removeConstraint(heartWidth)
                // self.heart.addConstraint(NSLayoutConstraint(item: self.heart!, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 50))
                heartWidth.constant = 53
                isFavorited = true
            } catch {
                print(error)
            }
        } else {
            self.heart.setImage(UIImage(named: "favorite2")!)
            // heartWidth.constant = 30
            // self.view.layoutIfNeeded()
            // UIView.animate(withDuration: 1.0) {
            //     self.heartWidth.constant = 23
            //     self.view.layoutIfNeeded()
            // }
            UIView.animate(withDuration: 0.2) {
                self.heartWidth.constant = 20
                self.view.layoutIfNeeded()
            }
            isFavorited = false
        }
    }


}

