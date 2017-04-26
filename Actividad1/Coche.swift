//
//  Coche.swift
//  Actividad1
//
//  Created by Sergio Arranz on 21/4/17.
//  Copyright © 2017 Sergio Arranz. All rights reserved.
//

import UIKit

class Coche: NSObject {

    var sNombre:String?
    var sMarca:String?
    var iFabricado:Int?
    var dbLon:Double?
    var dbLat:Double?
    var sRutaImagenP:String?
    
    init(valores:[String:AnyObject]) {
        sNombre=valores["Nombre"] as? String
        sMarca=valores["Marca"] as? String
        iFabricado=valores["Fabricado"] as? Int
        dbLon=valores["long"] as? Double
        dbLat=valores["lat"] as? Double
        sRutaImagenP=valores["RutaImagenP"] as? String
    }
}
