//
//  VCColeccionViewController.swift
//  Actividad1
//
//  Created by Sergio Arranz on 7/4/17.
//  Copyright © 2017 Sergio Arranz. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage

class VCColeccionViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet var colPrincipal:UICollectionView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        DataHolder.SHI.firDataBaseRef.child("Consolas").observeSingleEvent(of: .value, with: { (snapshot) in
            let arrTemp=snapshot.value as? Array<AnyObject>
            DataHolder.SHI.arConsolas=Array<Consola>()
            
            for co in arrTemp! as [AnyObject]{
                let consolai=Consola(valores: co as! [String:AnyObject])
                DataHolder.SHI.arConsolas?.append(consolai)
            }
            
            self.colPrincipal?.reloadData()
            
        })
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(DataHolder.SHI.arConsolas==nil){
            return 0
        }else{
            return (DataHolder.SHI.arConsolas?.count)!
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CVCMiCelda2CollectionViewCell=collectionView.dequeueReusableCell(withReuseIdentifier: "micelda2", for: indexPath) as! CVCMiCelda2CollectionViewCell
        
        
        let consolai:Consola=DataHolder.SHI.arConsolas![indexPath.row]
        cell.lblNombre?.text=consolai.sNombre
        cell.descargarImagen(ruta: consolai.sRutaImagenP!)
        
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
