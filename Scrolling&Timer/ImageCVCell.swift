//
//  ImageCVCell.swift
//  Scrolling&Timer
//
//  Created by abdullah  on 04/06/1441 AH.
//  Copyright © 1441 abdullah . All rights reserved.
//

import UIKit

class ImageCVCell: UICollectionViewCell {

    
    @IBOutlet weak var ImageView: UIImageView!
    
    func Update(Image : UIImage) {
        self.ImageView.image = Image
    }
    
    
  
}
