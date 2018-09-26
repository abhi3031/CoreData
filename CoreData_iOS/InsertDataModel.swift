//
//  InsertDataModel.swift
//  CoreData_iOS
//
//  Created by TOPS on 9/26/18.
//  Copyright © 2018 TOPS. All rights reserved.
//

import UIKit

class InsertDataModel: NSObject {
    
    
    var address:String?
    var name:String?
    var email:String?
    
    init(address:String,name:String,email:String) {
        self.address = address;
        self.name = name;
        self.email = email;
        
    }

}
