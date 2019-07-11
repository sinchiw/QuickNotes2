//
//  ClassCollectionCell.swift
//  NoteMe2
//
//  Created by Wilmer sinchi on 3/13/19.
//  Copyright © 2019 Wilmer sinchi. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class ClassCollectionCell: UICollectionViewCell{
    
    var mainVC : MainVC!
    
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var className: UILabel!
    
    func showDeleteButton(){
        if (self.mainVC.editButton.title == "Edit") {
            self.deleteButton.isHidden = true
        } else {
         self.deleteButton.isHidden = false
        }
//
//        
    }
    @IBAction func deleteClass(_ sender: UIButton) {
        
        
    }
    
    
    
    //    func cellSpacing(){
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
//        layout.itemSize = CGSize(width: screenWidth/3, height: screenWidth/3)
//        layout.minimumInteritemSpacing = 0
//        layout.minimumLineSpacing = 0
//        collectionView!.collectionViewLayout = layout
//    }
    
    
}
