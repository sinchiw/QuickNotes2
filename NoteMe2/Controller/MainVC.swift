//
//  ViewController.swift
//  NoteMe2
//
//  Created by Wilmer sinchi on 3/12/19.
//  Copyright © 2019 Wilmer sinchi. All rights reserved.
//

import UIKit
import CoreData





class MainVC: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    var tableData = [Course]()
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let courseData = tableData[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClassCollectionViewCell", for: indexPath) as! ClassCollectionCell
        let  cellData = courseData.name
        cell.className?.text = cellData
        
        
        
    return cell
    }
    
    
 
    
    @IBAction func addCourse(_ sender: Any) {
    let alert = UIAlertController(title: "Add Course", message: nil, preferredStyle: .alert)
        alert.addTextField{ (UITextField) in UITextField.placeholder = "Course Name"
        
        }
        let saveAction = UIAlertAction(title: "Save",
                                       style: .default) {
                                        [unowned self] action in
                                        
                                       guard let textField = alert.textFields?.first,
                                            let nameToSave = textField.text else {
                                                return
                                        }
                                       
                                        CourseCoreData.sharedInstance.saveCourseToCoreD(name: nameToSave)
                                        
                                          
            
//                    self.collectionView.reloadData()
    }
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel)
//        alert.addTextField()
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.reloadData()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.tableData = CourseCoreData.sharedInstance.courses
    }


}

