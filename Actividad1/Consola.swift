//
//  Consola.swift
//  Actividad1
//
//  Created by Sergio Arranz on 26/4/17.
//  Copyright © 2017 Sergio Arranz. All rights reserved.
//

import UIKit

class Consola: NSObject {
    var sNombre:String?
    var sMarca:String?
    var sRutaImagenP:String?
    
    init(valores:[String:AnyObject]) {
        sNombre=valores["Nombre"] as? String
        sMarca=valores["Marca"] as? String
        sRutaImagenP=valores["RutaImagenP"] as? String
    }
}
