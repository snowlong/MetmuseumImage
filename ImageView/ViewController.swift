//
//  ViewController.swift
//  ImageView
//
//  Created by 駿河優輝長 on 2019/09/29.
//  Copyright © 2019 tsunousaLab. All rights reserved.
//

import UIKit
//import Foundation
import SwiftyJSON
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var Image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var requestURLString = "https://collectionapi.metmuseum.org/public/collection/v1/objects/"
        let objectID = "436535"
        requestURLString += objectID
        Alamofire
            .request(requestURLString)
            .responseJSON { response in
                guard let artworkData = response.result.value else {
                    return
                }
                let artJson = JSON(artworkData)
                
                print(artJson["primaryImageSmall"])
                
                let artImage = self.getImageByUrl(url: artJson["primaryImageSmall"].string!)
                self.Image.image = artImage
                self.view.addSubview(self.Image)

                
            }
//        let artworkData =

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

//struct artworkModel {
//    let objectID: Int
//    let isHighlight: Bool
//    let accessionNumber: String
//    let isPublicDomain: Bool
//    let primaryImage: String
//    let primaryImageSmall: String
//    let additionalImages: [String]
//    let constituents: [String]
//    let department: String
//    let objectName: String
//    let title: String
//    let culture: String
//    let period: String
//    let dynasty: String
//    let portfolio: String
//    let artistRole: String
//    let artistPrefix: String
//    let artistDisplayName: String
//    let artistDisplayBio: String
//    let artistSuffix: String
//    let artistAlphaSort: String
//    let artistNationality: String
//    let artistBeginDate: String
//    let artistEndDate: String
//    let objectDate: String
//    let objectBeginDate: String
//    let objectEndDate: String
//    let medium: String
//    let dimensions: String
//    let creditLine: String
//    let geographyType: String
//    let city: String
//    let state: String
//    let county: String
//    let country: String
//    let region: String
//    let subregion: String
//    let locale: String
//    let locus: String
//    let excavation: String
//    let river: String
//    let classification: String
//    let rightsAndReproduction: String
//    let linkResource: String
//    let metadataDate: String
//    let repository: String
//    let objectURL: String
//    let tags: [String]
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.CodingKey(keyedBy: CodingKey.self)
//    }
//}

