//
//  Course.swift
//  NoteMe2
//
//  Created by Wilmer sinchi on 3/15/19.
//  Copyright © 2019 Wilmer sinchi. All rights reserved.
//

import Foundation
import CoreData


class Courses : NSObject {
     
    var className: String
    var note: [Note]
    
    
    init(className: String, noteFrom: [Note]){
        self.className = className
        self.note = noteFrom
        
        
    }
    
    
    
    
}
