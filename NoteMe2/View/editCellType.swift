//
//  editingTypeCellTableViewCell.swift
//  NoteMe2
//
//  Created by Wilmer sinchi on 5/16/19.
//  Copyright © 2019 Wilmer sinchi. All rights reserved.
//

import UIKit
import CoreData


class editCellType: UITableViewCell, UITextFieldDelegate {
    
//   let nib = UINib.init(nibName: "MyCustomCell", bundle: nil)
    
    @IBOutlet weak var texts: UITextField!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        texts.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(text: String?, placeholder: String) {
        texts.text = text
        texts.placeholder = placeholder
        
        
        
        
        
    }
    //where you write the functuin for the return key on the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == texts {
            
            
            
            print("Note has been saved")
            
            textField.resignFirstResponder()
//            CourseCoreData.sharedInstance.saveNotesToCoreData(noteDetail: textField.text!)
            
            
            
            //            inoutTextFIeld.text = ""
        }
        return true
    }
    
    
    
    
    
    
    func hideKeyboard() {
        texts.resignFirstResponder()
    }
    
    
    
    
    
    
//
//        static var nib:UINib
//    {
//        return UINib(nibName: identifier , bundle: nil)
//    }
//
//    static var identifier: String
//
//    {
//        return String(describing: self)
//    }
    
    
    
    
}
