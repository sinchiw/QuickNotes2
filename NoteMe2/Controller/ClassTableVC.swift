//
//  tableController.swift
//  NoteMe2
//
//  Created by Wilmer sinchi on 3/18/19.
//  Copyright © 2019 Wilmer sinchi. All rights reserved.
//

import Foundation
import UIKit


class ClassTableVC : UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoDetailCell", for: indexPath) as! tabelcell
        return cell
        
        
        
    }
    
    
    
    
    
}

