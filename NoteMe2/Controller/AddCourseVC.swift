//
//  AddCourse.swift
//  NoteMe2
//
//  Created by Wilmer sinchi on 3/15/19.
//  Copyright © 2019 Wilmer sinchi. All rights reserved.
//

import Foundation
import UIKit
import CoreData



class AddCourseVC : UIViewController, UITextFieldDelegate{
    var courseIndex: Int!
    var courseAssigned: Course?
    
    
    @IBOutlet weak var newCourse: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        registerForKeyboardNotifications()
        tapregonizer()
        
        newCourse.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name:UIResponder.keyboardWillShowNotification , object:nil)
        NotificationCenter.default.removeObserver(self, name:UIResponder.keyboardWillHideNotification , object:nil)
        NotificationCenter.default.removeObserver(self, name:UIResponder.keyboardWillChangeFrameNotification , object:nil)
        
    }
    
    @objc func keyboardwillChange(notification: Notification) {
        
//        guard let keyboardTRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
//            return
                print("Keyboard will show: \(notification.name.rawValue)")
            
            //        view.frame.origin.y = -300
            
//        }
//        if notification.name == UIResponder.keyboardWillShowNotification ||
//            notification.name == UIResponder.keyboardWillChangeFrameNotification{
//
//
//
//            view.frame.origin.y = -keyboardTRect.height
//        } else {
//            view.frame.origin.y = 0
//        }
    }
    
    
    func tapregonizer(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard(_:)))
        self.view.addGestureRecognizer(tapGesture)
        
        
    }
    
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        //        [self.view endediting:YES];
        
        newCourse.resignFirstResponder()
    }
    
    
    func hideKeyboard() {
        newCourse.resignFirstResponder()
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == newCourse {
//            addComment()
            textField.resignFirstResponder()
            //            inoutTextFIeld.text = ""
        }
        return true
    }
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    
    @IBAction func saveCourse(_ sender: Any) {
        
        if newCourse.text == "" {
            let alert = UIAlertController(title: "Pleae add a valid course", message: nil, preferredStyle: .alert)
            alert.addTextField{ (UITextField) in UITextField.placeholder = "Course Name"
                
                let cancelAction = UIAlertAction(title: "Ok", style: .cancel)
                
                alert.addAction(cancelAction)
                            }
        
        } else { 
    
        CourseCoreData.sharedInstance.saveCourseToCoreD(name: newCourse.text!)
        
        
        self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    
    
    //
//
//    @IBAction func newCourse(_ sender: Any) {
//
//        CourseCoreData.sharedInstance.saveCourseToCoreD(name: newCourse.text!)
//         self.navigationController?.popViewController(animated: true)
//    }
    
}
//NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification)

