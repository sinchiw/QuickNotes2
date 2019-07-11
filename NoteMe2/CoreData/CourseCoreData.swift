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
    var notes = [Notes]()
    
    static let sharedInstance = CourseCoreData()
    
    var selectedNote: Notes?
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
        
        let fetchRequest2 = NSFetchRequest<Notes>(entityName: "Notes")
        do {
            notes = try managedContext.fetch(fetchRequest2)
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
    
    
    
    func deleteCourseFromCoredata(index: Int){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let manageContext = appDelegate.persistentContainer.viewContext
//        let entity = NSEntityDescription.entity(forEntityName: "Course", in: manageContext)!
        //to delete stuff
        let courseToDelete = self.courses[index]
        manageContext.delete(courseToDelete)
        do {
            try manageContext.save()
            courses.remove(at: index)
        } catch let error as NSError{
            print("Could not save. \(error), \(error.userInfo) ")
        }
        
        
        
    }
    
    func deleteNotesFromCoreData(index: Int) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let notesToDelete = self.notes[index]
        
        managedContext.delete(notesToDelete)
        notes.remove(at: index)
        
        do {
            
            try managedContext.save()
        }catch let error as NSError {
            print("could not save\(error). \(error.userInfo)")
        }
        
    }
    
    
    func saveNotesToCoreData(note: String, noteDetail: String)
    {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let manageContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName:"Notes", in: manageContext)!
        let notesCore = Notes(entity: entity, insertInto: manageContext)
        
        //for the rows
        notesCore.notes = note
        //for the whole textedit in other view controlller
        notesCore.notesdetail = noteDetail
        
        notesCore.course = selectedCourse
        
        do {
            try manageContext.save()
            notes.append(notesCore)
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
//    func saveNotesToCoreData(noteDetail: String, taskDetail: String)
//    {
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
//            return
//        }
//
//        let manageContext = appDelegate.persistentContainer.viewContext
//        let entity = NSEntityDescription.entity(forEntityName:"Notes", in: manageContext)!
//        let notesCore = Notes(entity: entity, insertInto: manageContext)
//
//        notesCore.notes = noteDetail
//        notesCore.tasks = taskDetail
//
//        notesCore.course = selectedCourse
//
//        do {
//            try manageContext.save()
//        } catch let error as NSError {
//            print("Could not save. \(error), \(error.userInfo)")
//        }
//
//    }
    
    
   /* func saveTaskToCoreData(taskDetail: String) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        let manageContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Notes", in: manageContext)!
        let taskCore = Notes(entity: entity, insertInto: manageContext)
        
        taskCore.notes = taskDetail
        taskCore.course = selectedCourse
        
        do {
            try manageContext.save()
            print("Saved to Core Data")
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        
        
    }
 */
    
    func getNotesFor() -> [Notes]? {
        return selectedCourse?.note?.allObjects as? [Notes]
//        return notes
    }
    
    
    
    
    
    
}
