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

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        var contentWidth: CGFloat = 0.0
        
        //We can set the scroll view width using the constraints.  If we make it smaller than the fullscreen width, we can ensure that the next images bleed into the mainView.
        
        print("Scrollview Width: \(scrollView.frame.size.width)")
        
        let scrollViewWidth = scrollView.frame.size.width
        
        for x in 0...2 {
            
            // Create the image to be used.
            let image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            // Determine where the image will be located.
            var newX: CGFloat = 0.0
            newX = scrollViewWidth / 2 + (scrollViewWidth * CGFloat(x))
            
            contentWidth += newX
            
            //Add the imageView to the scrollView
            scrollView.addSubview(imageView)
            
            //Set the size and location of the imageViews (i.e. pin it!)
            imageView.frame = CGRect(x: newX - 75, y: (view.frame.size.height / 2) - 75, width: 150, height: 150)
        }
        
        //scrollView.backgroundColor = UIColor.purple
        
        //scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
        
        //Note, the above code is what is in the book, but this adds extra space after the last image.  My code below stops it from scrolling past the last image.
        scrollView.contentSize = CGSize(width: scrollViewWidth + (scrollViewWidth * CGFloat(images.count - 1)), height: view.frame.size.height)
    }


}

