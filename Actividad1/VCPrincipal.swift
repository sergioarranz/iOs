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
        
        //DataHolder.SHI.delegate=self
        
            //DataHolder.SHI.firDataBaseRef.child("Coches").observeSingle(FIRDataEventType.value, with: { (snapshot) in
        
        DataHolder.SHI.firDataBaseRef.child("Coches").observeSingleEvent(of: .value, with: { (snapshot) in
        let arrTemp=snapshot.value as? Array<AnyObject>
                //if(DataHolder.SHI.arCoches==nil){
                    DataHolder.SHI.arCoches=Array<Coche>()
                //}
                
                for co in arrTemp! as [AnyObject]{
                    let cochei=Coche(valores: co as! [String:AnyObject])
                    DataHolder.SHI.arCoches?.append(cochei)
                }
                
                self.tblMitabla?.reloadData()
                
                //let coche0=Coche(valores: arrTemp?[0] as! [String : AnyObject])
                //let coche0=arrTemp?[0] as? [String:AnyObject]
                //print("EL COCHE EN LA POSICIÓN 0 ES: ", DataHolder.SHI.arCoches)
        })
        
        //DataHolder.SHI.statusDataholder(delegate: self)
        // Do any additional setup after loading the view.
    }
    
    /*func dataHolderPruebaDataHolder(status: Int){
        print("---------->>>>", status)
    }*/

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
        /*if(indexPath.row==0){
            cell.lblNombre?.text="Coche 1"
        } else if (indexPath.row==1) {
            cell.lblNombre?.text="Coche 2"
        } else if (indexPath.row==2) {
            cell.lblNombre?.text="Coche 3"
        } else if (indexPath.row==3) {
            cell.lblNombre?.text="Coche 4"
        } else if (indexPath.row==4) {
            cell.lblNombre?.text="Coche 5"
        }*/
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("HE SELECCIONADO LA POSICIÓN:", indexPath.row);
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("HE DESELECCIONADO LA POSICIÓN:", indexPath.row);

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
