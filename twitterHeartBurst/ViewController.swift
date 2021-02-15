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
            heart.isUserInteractionEnabled = false
            heart.image = UIImage(named: "favorite2")
            // heart.isHidden = false
        }
    }
    @IBOutlet weak var burstHeart: UIImageView! {
        didSet {
            burstHeart.isUserInteractionEnabled = false
            // burstHeart.isHidden = true
            // heart.image = UIImage(named: "favorite2")
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
                self.burstHeart.setGifImage(gif, loopCount: 1)
                self.heart.isHidden = true
                self.burstHeart.isHidden = false
                // self.heart.removeConstraint(heartWidth)
                // self.heart.addConstraint(NSLayoutConstraint(item: self.heart!, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 50))
                // heartWidth.constant = 53
                isFavorited = true
            } catch {
                print(error)
            }
        } else {
            self.heart.setImage(UIImage(named: "favorite2")!)
            self.heart.isHidden = false
            self.burstHeart.isHidden = true
            
            print("HERE!")
            
            UIView.animate(withDuration: 0.1, animations: {
                // self.heartWidth.constant = 100
                // self.view.layoutIfNeeded()
                // self.heart.transform = CGAffineTransform(scaleX: 3, y: 3)
                self.heartWidth.constant = 35
                self.view.layoutIfNeeded()
            }) { (finished) in
                UIView.animate(withDuration: 0.3, animations: {
                    // self.heart.transform = CGAffineTransform.identity
                    self.heartWidth.constant = 20
                    self.view.layoutIfNeeded()
                })
            }
            
            // UIView.animate(withDuration: 5) {
            //     self.heartWidth.constant = 40
            //     self.view.layoutIfNeeded()
            // }
            
            // UIView.animate(withDuration: 2) {
            //     self.heartWidth.constant = 20
            //     self.view.layoutIfNeeded()
            // }
            
            
            // UIView.animate(withDuration: 0.2) {
            //     self.heartWidth.constant = 20
            //     self.view.layoutIfNeeded()
            // }
            isFavorited = false
        }
    }
}
