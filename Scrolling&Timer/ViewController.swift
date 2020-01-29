//
//  ViewController.swift
//  Scrolling&Timer
//
//  Created by abdullah  on 04/06/1441 AH.
//  Copyright © 1441 abdullah . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var scrollingTimer = Timer()
    
    var Images: [UIImage] = [
        UIImage(named: "IMG_0099")!,
        UIImage(named: "IMG_0116")!,
        UIImage(named: "IMG_0403")!,
        UIImage(named: "IMG_0408")!,
        UIImage(named: "IMG_0016")!,
        UIImage(named: "IMG_3532")!,
        UIImage(named: "IMG_0023")!,
        UIImage(named: "IMG_0103")!,
        UIImage(named: "IMG_0090")!,
        UIImage(named: "IMG_0096")!,
        UIImage(named: "IMG_0097")!
        
    ]
    
    
    @IBOutlet weak var collectionView: UICollectionView! {didSet{
        collectionView.delegate = self
        collectionView.dataSource = self
        }}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "ImageCVCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        
    }
    
    
}

extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return Images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ImageCVCell
        cell.Update(Image: Images[indexPath.row])
        
        var rowIndex = indexPath.row
        let numberOfRecords : Int = self.Images.count - 1
        if (rowIndex < numberOfRecords) {
            rowIndex = (rowIndex + 1)
        } else {
            rowIndex = 0
        }
        
        scrollingTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(ViewController.startTimer(theTimer:)), userInfo: rowIndex, repeats: true)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
    
    
    
    @objc func startTimer(theTimer : Timer) {
        UIView.animate(withDuration: 1 , delay: 0 , options: .curveEaseOut, animations: {
            self.collectionView.scrollToItem(at: IndexPath(row : theTimer.userInfo! as! Int ,section: 0), at: .centeredHorizontally, animated: false)
        }, completion: nil)
    }
    
    
    
    
    
    
    
}
