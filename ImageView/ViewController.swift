//
//  ViewController.swift
//  ImageView
//
//  Created by 駿河優輝長 on 2019/09/29.
//  Copyright © 2019 tsunousaLab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myImage:UIImage = getImageByUrl(url:"https://rr.img.naver.jp/mig?src=http%3A%2F%2Fimgcc.naver.jp%2Fkaze%2Fmission%2FUSER%2F20140315%2F40%2F4254050%2F12%2F384x215xbeefc5a0630dd93608c286cb.jpg%2F300%2F600&twidth=300&theight=600&qlt=80&res_format=jpg&op=r")
        
        Image.image = myImage
        
        self.view.addSubview(Image)

    }
    
    func getImageByUrl(url: String) -> UIImage{
        let url = URL(string: url)
        do {
            let data = try Data(contentsOf: url!)
            return UIImage(data: data)!
        } catch let err {
            print("Error : \(err.localizedDescription)")
        }
        return UIImage()
    }

}

