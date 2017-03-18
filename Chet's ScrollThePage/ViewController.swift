//
//  ViewController.swift
//  Chet's ScrollThePage
//
//  Created by Chetwyn on 3/18/17.
//  Copyright © 2017 Clarke Enterprises. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var images = [UIImageView]()
    var newX: CGFloat = 0.0
    var contentWidth: CGFloat = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for x in 0...2 {
            
            // Create the image to be used.
            let image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            // Determine where the image will be located.
            //var newX: CGFloat = 0.0
            newX = view.frame.midX + (view.frame.size.width * CGFloat(x))
            
            contentWidth += newX
            
            //Add the imageView to the scrollView
            scrollView.addSubview(imageView)
            
            //Set the size and location of the imageViews (i.e. pin it!)
            imageView.frame = CGRect(x: newX - 75, y: (view.frame.size.height / 2) - 75, width: 150, height: 150)
        }
        
        scrollView.backgroundColor = UIColor.purple
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
        
    }


}

