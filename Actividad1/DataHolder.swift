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
import FirebaseStorage

class DataHolder: NSObject {
    
    static let SHI:DataHolder=DataHolder()
    
    var locationAdmin:LocationAdmin?
    var firDataBaseRef: FIRDatabaseReference!
    var firStorage:FIRStorage?
    var arCoches:Array<Coche>?
    var arConsolas:Array<Consola>?
    var firStorageRef:FIRStorageReference?
    var hmImagenesDescargadas:[String:UIImage]?=[:]
    
    var sUserR:String?
    var sPassR:String?
    var sRepPassR:String?
    var sEmailR:String?
    
    
    func initFirebase(){
        FIRApp.configure()
        firDataBaseRef = FIRDatabase.database().reference()
        firStorage = FIRStorage.storage()
        firStorageRef = firStorage?.reference()
    }
    
    func initLocationAdmin() {
        locationAdmin=LocationAdmin()
    }
    
    func getImage(clave:String, getDelegate delegate:DataHolderDelegate){
        if(self.hmImagenesDescargadas?[clave] == nil){
            // Create a reference to the file you want to download
            let islandRef = self.firStorageRef?.child(clave)
            
            // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
            islandRef?.data(withMaxSize: 1 * 1024 * 1024) { data, error in
                if error != nil {
                    // Uh-oh, an error occurred!
                } else {
                    // Data for "images/island.jpg" is returned
                    let image = UIImage(data: data!)
                    self.hmImagenesDescargadas?[clave] = image
                    delegate.dataHolderImagenDescargada!(imagen: image!)
                }
            }
        }
        else{
            delegate.dataHolderImagenDescargada!(imagen: (self.hmImagenesDescargadas?[clave])!)
        }
        
    }
    
}


@objc protocol DataHolderDelegate{
    
    @objc optional func dataHolderImagenDescargada(imagen:UIImage)
    @objc optional func dataHolderPruebaDataHolder(status:Int)
}


