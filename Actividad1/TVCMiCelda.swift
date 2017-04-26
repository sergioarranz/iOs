//
//  TVCMiCelda.swift
//  Actividad1
//
//  Created by Sergio Arranz on 4/4/17.
//  Copyright © 2017 Sergio Arranz. All rights reserved.
//

import UIKit
import FirebaseStorage

class TVCMiCelda: UITableViewCell {

    @IBOutlet var lblNombre:UILabel?
    @IBOutlet var imgcelda:UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func descargarImagen(ruta:String) {
        self.imgcelda?.image=nil
        // Create a reference to the file you want to download
        let islandRef = DataHolder.SHI.firStorageRef?.child(ruta)
        
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        islandRef?.data(withMaxSize: 1 * 1024 * 1024) { data, error in
            if error != nil {
                // Uh-oh, an error occurred!
            } else {
                // Data for "images/island.jpg" is returned
                let image = UIImage(data: data!)
                self.imgcelda?.image=image
            }
        }
        
    }
}
