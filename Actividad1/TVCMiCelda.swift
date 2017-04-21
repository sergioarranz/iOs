//
//  TVCMiCelda.swift
//  Actividad1
//
//  Created by Sergio Arranz on 4/4/17.
//  Copyright © 2017 Sergio Arranz. All rights reserved.
//

import UIKit

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

}
