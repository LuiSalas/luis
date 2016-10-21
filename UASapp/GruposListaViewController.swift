//
//  GruposListaViewController.swift
//  UASapp
//
//  Created by Luis Salas Rodriguez on 21/10/16.
//  Copyright © 2016 sumajg. All rights reserved.
//

import UIKit

class GruposListaViewController: UIViewController, UITableViewDataSource,
UITableViewDelegate{
    
    @IBOutlet weak var grupoActual: UILabel!

    let kSectionCount: Int = 1
    let kRedSection: Int = 0
    
    let redFlowers: [String] = ["Grupo 1","Grupo 2"]
    let subtitlesArray: [String] = ["Alumnos con menos de 270 horas","Alumnos con más de 270 horas"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        grupoActual.text="Grupo 1"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func numberOfSections(in tableView: UITableView) -> Int {
        return kSectionCount
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case kRedSection: return redFlowers.count
        default: return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case kRedSection: return "Grupos Disponibles"
        default: return "Unknown"
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "GrupoCell")! as UITableViewCell
        
        switch (indexPath.section){
        case kRedSection:
            cell.textLabel!.text=redFlowers[indexPath.row]
            cell.detailTextLabel!.text=subtitlesArray[indexPath.row]
        default:
            cell.textLabel!.text="Unknown"
        }
        
    
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var flowerMessage: String
        
        switch indexPath.section {
        case kRedSection:
            flowerMessage = "\(redFlowers[indexPath.row])"
            grupoActual.text = redFlowers[indexPath.row]
        default:
            flowerMessage = "No seleccionaste un grupo!"
        }
        
        let alertController = UIAlertController(title: "Grupo seleccionado",message: flowerMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let defaultAction = UIAlertAction(title:"Ok", style: UIAlertActionStyle.cancel, handler: nil)
        
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
        
    }
    
    
}
