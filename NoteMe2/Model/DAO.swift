//
//  DAO.swift
//  NoteMe2
//
//  Created by Wilmer sinchi on 4/8/19.
//  Copyright © 2019 Wilmer sinchi. All rights reserved.
//

import UIKit
import Foundation

class DAO {
    let defaults = UserDefaults.standard
    static let shareInstance = DAO()
    
    
    var coursesArray = [Courses]()
    init(){
        // create something here like a prototype!
        coursesArray = create()
    }
    
    func create() -> [Courses]{
        let math = Courses(className: "Math", noteFrom: [Note]())
        let history = Courses(className: "History", noteFrom: [Note]())
        
        let allCourse = [math, history]
        return allCourse
    }
    
    func newCourse(newName: String){
        let newCours = Courses(className: newName, noteFrom: [Note]())
        coursesArray.append(newCours)
//        //if you want the math and history to show up
        return 
    }
       
    
    func addNewNotes(to CourseName: String, newNotes: String, newNoteDetails: String)
        
        
        {
            for (index, course) in coursesArray.enumerated(){
                if course.className == CourseName{
                    let newNotes = Note(sectionTitle: newNotes, sectionDetail: newNoteDetails)
                    coursesArray[index].note.append(newNotes)
                }
                
                
        }
        
        
        
    }
    
    
    
}
