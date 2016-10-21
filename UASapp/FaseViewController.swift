//
//  FaseViewController.swift
//  UASapp
//
//  Created by Luis Salas Rodriguez on 21/10/16.
//  Copyright © 2016 sumajg. All rights reserved.
//

import UIKit

class FaseViewController: UIViewController, UITableViewDataSource,
UITableViewDelegate {

    
    let kSectionCount: Int = 1
    let kRedSection: Int = 0
    
    let redFlowers: [String] = ["Fase 1","Fase 2","Fase 3"]
    let subtitlesArray: [String] = ["06/10/2016","12/10/2016","18/10/2016"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "FaseCell")! as UITableViewCell
        
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
            
        default:
            flowerMessage = "No seleccionaste una Fase!"
        }
        
        let alertController = UIAlertController(title: "Fase modificar",message: flowerMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let defaultAction = UIAlertAction(title:"Ok", style: UIAlertActionStyle.cancel, handler: nil)
        
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
        
    }

    
    
}
