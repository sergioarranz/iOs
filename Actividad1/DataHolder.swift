//
//  DataHolder.swift
//  Actividad1
//
//  Created by Sergio Arranz on 23/3/17.
//  Copyright © 2017 Sergio Arranz. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class DataHolder: NSObject {
    
    static let SHI:DataHolder=DataHolder()
    
    var locationAdmin:LocationAdmin?
    var firDataBaseRef: FIRDatabaseReference!
    var arCoches:Array<Coche>?
    //var delegate:DataHolderDelegate?
    
    var sUserR:String?
    var sPassR:String?
    var sRepPassR:String?
    var sEmailR:String?
    
    
    func initFirebase(){
        FIRApp.configure()
        firDataBaseRef = FIRDatabase.database().reference()

    }
   
    func initLocationAdmin() {
        locationAdmin=LocationAdmin()
    }
    /*
    func statusDataholder(delegate:DataHolderDelegate){
        var i = 0
        while i<100000000 {
            i += 1
        }
        delegate.dataHolderPruebaDataHolder!(status: 0)
    }
 */
}

/*
@objc protocol DataHolderDelegate{
    @objc optional func dataHolderPruebaDataHolder(status:Int)
}
*/

