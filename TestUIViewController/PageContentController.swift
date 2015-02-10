//
//  PageContentController.swift
//  TestUIViewController
//
//  Created by Yan Xia on 2/9/15.
//  Copyright (c) 2015 yxia. All rights reserved.
//

import UIKit

class PageContentController: UIViewController {

    var index: Int = 0
    var imageName: NSString = ""
    
    @IBOutlet weak var lableText: UILabel!
    @IBOutlet weak var imageView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lableText.text = String(index)
        self.imageView.image = UIImage(named: imageName)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    func setLabelText(){
//        self.lableText.text = "text1"
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
