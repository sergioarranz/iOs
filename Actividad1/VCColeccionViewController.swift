//
//  VCColeccionViewController.swift
//  Actividad1
//
//  Created by Sergio Arranz on 7/4/17.
//  Copyright © 2017 Sergio Arranz. All rights reserved.
//

import UIKit

class VCColeccionViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet var colPrincipal:UICollectionView?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CVCMiCelda2CollectionViewCell=collectionView.dequeueReusableCell(withReuseIdentifier: "micelda2", for: indexPath) as! CVCMiCelda2CollectionViewCell
        
        if(indexPath.row==0){
            cell.lblNombre?.text="Play Station"
            cell.imgvMain?.image=UIImage(named: "playstation.jpg")
        } else if (indexPath.row==1) {
            cell.lblNombre?.text="Game Boy"
            cell.imgvMain?.image=UIImage(named: "gameboy.jpg")
        } else if (indexPath.row==2) {
            cell.lblNombre?.text="xBox"
            cell.imgvMain?.image=UIImage(named: "xbox.jpg")
        } else if (indexPath.row==3) {
            cell.lblNombre?.text="PSP"
            cell.imgvMain?.image=UIImage(named: "psp.png")
        } else if (indexPath.row==4) {
            cell.lblNombre?.text="Wii"
            cell.imgvMain?.image=UIImage(named: "wii.png")
        }

                
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
