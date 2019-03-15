//
//  CourseCoreData.swift
//  NoteMe2
//
//  Created by Wilmer sinchi on 3/14/19.
//  Copyright © 2019 Wilmer sinchi. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CourseCoreData: NSObject {
    var courses = [Course]()
    static let sharedInstance = CourseCoreData()
    
    var selectedCourse : Course?

    private override init() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        managedContext.undoManager = UndoManager()
        
        
        
        let fetchRequest = NSFetchRequest<Course>(entityName: "Course")
        do {
            courses = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print( "Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func saveCourseToCoreD(name: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let manageContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Course", in: manageContext)!
        
        let course1 = Course(entity:entity, insertInto: manageContext)
        
        course1.name = name
        
        do {
            try manageContext.save()
            courses.append(course1)
            
        } catch let error as NSError {
            print("Could not save!. \(error), \(error.userInfo)")
        }
    
    }
    
    
    
}
