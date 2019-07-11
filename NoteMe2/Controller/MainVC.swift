//
//  ViewController.swift
//  NoteMe2
//
//  Created by Wilmer sinchi on 3/12/19.
//  Copyright © 2019 Wilmer sinchi. All rights reserved.
//

import UIKit
import CoreData
import Foundation




class MainVC: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    static let sharedInstance = MainVC()
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    var tableData = [Course]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        collectionView.reloadData()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableData = CourseCoreData.sharedInstance.courses
        editButton.title = "Edit"
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                let course = tableData[indexPath.row]
                CourseCoreData.sharedInstance.selectedCourse = course
        if (editButton.title == "Done"){

//        CourseCoreData.sharedInstance.selectedCourse = course
//            CourseCoreData.sharedInstance.deleteCourseFromCoredata(index: indexPath.row)
            CourseCoreData.sharedInstance.deleteCourseFromCoredata(index: indexPath.row)
            tableData.remove(at: indexPath.row)
        } else {
            
             let courseData = tableData[indexPath.row]
           ClassTableVC.sharedInstance.navTitle = courseData.name
//            let collectionCell : ClassCollectionCell!
//        let tableViewController : ClassTableVC!
            let cvc = self.storyboard?.instantiateViewController(withIdentifier: "assignments") as! ClassTableVC

             cvc.navTitle = courseData.name
            
            self.navigationController?.pushViewController(cvc, animated: true)
            
            
            
        }
        collectionView.reloadData()
        print(indexPath.row)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        
        return tableData.count
    
    
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let courseData = tableData[indexPath.row]

        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClassCollectionViewCell", for: indexPath) as! ClassCollectionCell
//        let tableVC = collectionView.dequeueReusableCell(withReuseIdentifier: "tableVC", for: indexPath) as! ClassTableVC
//        ClassTableVC.sharedInstance.title = courseData.name
//        let tableVC = UIViewController.
        let  cellData = courseData.name
        cell.className?.text = cellData
//        tableVC.navigationItem.title = cellData
        //when it was nil , do this to fix the error
        
        cell.mainVC  = self
        cell.showDeleteButton()
        
        
    return cell
    }
    



  
    @IBAction func editAction(_ sender: Any) {
        
        if (editButton.title == "Edit"){
            editButton.title = "Done"}else{
            editButton.title = "Edit"
            
        }
        self.collectionView.reloadData()
        }
        
    }

    
    
    
    

    

    
   




//extension MainVC: CollectionViewLayoutDelegate {
//    func collectionView(_ collectionView: UICollectionView,
//                        indexPath:IndexPath) -> CGFloat {
//
////        return tableData[indexPath.item].name
//        //        return photos[indexPath.item].image.size.height
//    }

