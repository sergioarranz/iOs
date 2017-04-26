//
//  VCPrincipal.swift
//  Actividad1
//
//  Created by Sergio Arranz on 4/4/17.
//  Copyright © 2017 Sergio Arranz. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class VCPrincipal: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tblMitabla:UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataHolder.SHI.firDataBaseRef.child("Coches").observeSingleEvent(of: .value, with: { (snapshot) in
            
            let arrTemp=snapshot.value as? Array<AnyObject>
            
            DataHolder.SHI.arCoches=Array<Coche>()
            
            for co in arrTemp! as [AnyObject]{
                let cochei=Coche(valores: co as! [String:AnyObject])
                DataHolder.SHI.arCoches?.append(cochei)
            }
            
            self.tblMitabla?.reloadData()
            
        })
        
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(DataHolder.SHI.arCoches==nil){
            return 0
        }else{
            return (DataHolder.SHI.arCoches?.count)!
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TVCMiCelda = tableView.dequeueReusableCell(withIdentifier: "micelda1") as! TVCMiCelda
        
        let cochei:Coche=DataHolder.SHI.arCoches![indexPath.row]
        cell.lblNombre?.text=cochei.sNombre
        cell.descargarImagen(ruta: cochei.sRutaImagenP!)
        
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
