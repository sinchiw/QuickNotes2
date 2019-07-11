//
//  Notes.swift
//  NoteMe2
//
//  Created by Wilmer sinchi on 4/8/19.
//  Copyright © 2019 Wilmer sinchi. All rights reserved.
//

import Foundation
import UIKit


class Note: NSObject {
    var sectionDetails: String
    var sectionTitle : String
    
    init(sectionTitle: String, sectionDetail: String)
    {
        
        self.sectionDetails = sectionDetail
        self.sectionTitle = sectionTitle
}

    
    
}





