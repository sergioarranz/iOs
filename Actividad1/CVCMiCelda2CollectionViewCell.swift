//
//  CVCMiCelda2CollectionViewCell.swift
//  Actividad1
//
//  Created by Sergio Arranz on 7/4/17.
//  Copyright © 2017 Sergio Arranz. All rights reserved.
//

import UIKit
import FirebaseStorage

class CVCMiCelda2CollectionViewCell: UICollectionViewCell,DataHolderDelegate {
    
    @IBOutlet var imgvMain:UIImageView?
    @IBOutlet var lblNombre:UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func descargarImagen(ruta:String) {
        self.imgvMain?.image=nil
        DataHolder.SHI.getImage(clave: ruta, getDelegate: self)
        
        
    }
    func dataHolderImagenDescargada(imagen: UIImage) {
        self.imgvMain?.image=imagen
    }
    
}
