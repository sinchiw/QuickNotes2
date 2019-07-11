//
//  tableController.swift
//  NoteMe2
//
//  Created by Wilmer sinchi on 3/18/19.
//  Copyright © 2019 Wilmer sinchi. All rights reserved.
//

import Foundation
import UIKit
import CoreData


enum classTableCellType {
    case editingType
    case readingType
}

protocol classTableViewModelItem {
    var type: classTableCellType {get}

}


class ClassTableVC : UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tv: UITableView!
    static let sharedInstance = ClassTableVC()
    var notes : [Notes]?
    var courseData = [Course]()
//    var emptyNotes = [String]()
    var isAdded = false
   
    
    
    var navTitle: String?
    
//    var noteArray = [String]()
    
    //make a two dimenisional array 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tv?.rowHeight = UITableView.automaticDimension
//        tableTitle(title)
        let nib = UINib.init(nibName: "editCellType", bundle: nil)
        self.tv?.register(nib, forCellReuseIdentifier: "editCellType")
        
        let nib2 = UINib.init(nibName: "readingCellType", bundle: nil)
        self.tv?.register(nib2, forCellReuseIdentifier:"readingCellType")
//        self.tblUsers.register(nib, forCellReuseIdentifier: "MyCustomCell")
        
//        self.tv.register(nib, forCellReuseIdentifier: "editingCellType")
       
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationItem.title = navTitle
        notes = CourseCoreData.sharedInstance.getNotesFor()
        tv.reloadData()
        
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 43
//    }
    
 
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1



    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let notesCount = self.notes?.count {
           return notesCount
        } else {

            print("unknown number of rows... \"notes\" property is nil!")
            return 0
//            return emptyNotes.count
        }
        
       
    }
    
    func tableTitle(title: String?){
       navigationItem.title = title
        tv.reloadData()
        return
        
    }
    
//
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let note = notes![indexPath.row]
        
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "readingCellType", for: indexPath) as! readingCellType

        cell.label.text = note.notes
        //look back the website
//        cell.cellSizing()
        print (cell)
        
        
        
        return cell
        
        
        //end the text edit by dimiss when its scroll on the inspector sections
        
        
    }
    
    
    
    
    
    
    @IBAction func addNotes(_ sender: Any) {
        
//        if isAdded == true{
            let emptyRow = "Untitled Note"
            let emptyDetail = "New Note"
        
       // if isAdded == true {
            
            CourseCoreData.sharedInstance.saveNotesToCoreData(note: emptyRow, noteDetail: emptyDetail)
            notes = CourseCoreData.sharedInstance.getNotesFor()

//            notes?.append(contentsOf: Notes())
//            notes?.insert(Notes.init(context: NSManagedObjectContext), at: 0)
//            tv.beginUpdates()
//            tv.insertRows(at: [IndexPath(row: notes!.count, section: 0)], with: .automatic)
//            tv.endUpdates()
            self.tv.reloadData()
     //   }
//        else {
//
//
//  //      }
        print("Button was clicked")
        
    }
    
    
    

    
    
    
    
}

