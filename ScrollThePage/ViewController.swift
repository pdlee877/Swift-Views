//
//  ViewController.swift
//  ScrollThePage
//
//  Created by Paula Lee on 2/20/17.
//  Copyright © 2017 Paula Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var images = [UIImageView]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var contentWidth: CGFloat = 0.0
        
        for x in 0...2 {
            let image = UIImage(named: "icon\(x).png")
            let imageView =  UIImageView(image: image)
            images.append(imageView)
            
            var newX: CGFloat = 0.0
            // CGFloat is a specialized form of Float that holds either 32-bits or 64-bits depending on the platform
            // CG - Core Graphics
            
            newX = view.frame.midX + view.frame.size.width * CGFloat(x)
            //view.frame.midX - finds the middle of the frame
            //view.frame.size.width - the width of the frame times the index
            
            contentWidth += newX
            
            scrollView.addSubview(imageView)
            //addSubview - adds a view to the end of the receiver's list of subviews
            
            imageView.frame = CGRect(x: newX - 75, y: (view.frame.size.height / 2) - 75, width: 150, height: 150)
            // setting the frame on the image AFTER it's been added to the scroll view
            // 75 is half of 150 to make the image in the ACTUAL middle and not top of the image being in the middle
        }
        
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
        // we only want the content height to be the same size as the view itself, nothing off the screen
        
    }

}

