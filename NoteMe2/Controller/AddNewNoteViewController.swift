//
//  AddNewNoteViewController.swift
//  NoteMe2
//
//  Created by Wilmer sinchi on 4/24/19.
//  Copyright © 2019 Wilmer sinchi. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class AddNewNoteViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var textfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tapregonizer()
        textfield.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    
    
    
    @IBAction func saveNoteTitle(_ sender: Any) {
    }
    
    
    @objc func keyboardwillChange(notification: Notification) {
        
                print("Keyboard will show: \(notification.name.rawValue)")
        
                view.frame.origin.y = 0
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name:UIResponder.keyboardWillShowNotification , object:nil)
        NotificationCenter.default.removeObserver(self, name:UIResponder.keyboardWillHideNotification , object:nil)
        NotificationCenter.default.removeObserver(self, name:UIResponder.keyboardWillChangeFrameNotification , object:nil)
        
    }
    
    
    func tapregonizer(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard(_:)))
        self.view.addGestureRecognizer(tapGesture)
        
        
    }
    
       @objc func dismissKeyboard (_ sender: UITapGestureRecognizer? = nil) {
        //        [self.view endediting:YES];
        
        textfield.resignFirstResponder()
    }
    
    func hideKeyboard() {
        textfield.resignFirstResponder()
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textfield {
            //            addComment()
            textField.resignFirstResponder()
            //            inoutTextFIeld.text = ""
        }
        return true
    }
    

   
    
}

