//
//  AddSectionVC.swift
//  NoteMe2
//
//  Created by Wilmer sinchi on 4/12/19.
//  Copyright © 2019 Wilmer sinchi. All rights reserved.
//

import UIKit
import Foundation




class NotesViewController: UIViewController,UITextFieldDelegate {

    //creating a empty section array
    @IBOutlet weak var textView: UITextView!
    var sectionArray = [String]()
    
//    @IBOutlet weak var sectionTextField: UITextField!
//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tapregonizer()
//        sectionTextField.delegate = self
//        // Do any additional setup after loading the view.
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
//
        
        
    }
    
//    deinit {
//        NotificationCenter.default.removeObserver(self, name:UIResponder.keyboardWillShowNotification , object:nil)
//        NotificationCenter.default.removeObserver(self, name:UIResponder.keyboardWillHideNotification , object:nil)
//        NotificationCenter.default.removeObserver(self, name:UIResponder.keyboardWillChangeFrameNotification , object:nil)
//
//    }
    
    
//    @objc func keyboardwillChange(notification: Notification) {
//        
//        //        guard let keyboardTRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
//        //            return
//        print("Keyboard will show: \(notification.name.rawValue)")
//        
//        //        view.frame.origin.y = -300
//        
//        //        }
//        //        if notification.name == UIResponder.keyboardWillShowNotification ||
//        //            notification.name == UIResponder.keyboardWillChangeFrameNotification{
//        //
//        //
//        //
//        //            view.frame.origin.y = -keyboardTRect.height
//        //        } else {
//        //            view.frame.origin.y = 0
//        //        }
//    }
//    
    
//    func tapregonizer(){
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard(_:)))
//        self.view.addGestureRecognizer(tapGesture)
//
//
//    }
//
    
//    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
//        //        [self.view endediting:YES];
//
//        sectionTextField.resignFirstResponder()
//    }
//
//
//    func hideKeyboard() {
//        sectionTextField.resignFirstResponder()
//    }
//
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if textField == sectionTextField {
//            //            addComment()
//            textField.resignFirstResponder()
//            //            inoutTextFIeld.text = ""
//        }
//        return true
//    }
//
    
    
//    @IBAction func saveSection(_ sender: Any) {
//        //wrtie some function here
////        var sections = [String]()
//
//
//
//
//
//    }
//
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
