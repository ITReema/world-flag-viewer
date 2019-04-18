//
//  ViewController.swift
//  Flags
//
//  Created by mac_os on 13/08/1440 AH.
//  Copyright © 1440 mac_os. All rights reserved.
//

import UIKit

class ViewController: UITableViewController  {

    var Flags = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "World Flag"
        navigationController?.navigationBar.prefersLargeTitles = true
        
         Flags += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Flags.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "flag", for: indexPath)
        cell.textLabel?.text = Flags[indexPath.row].uppercased()
        cell.imageView?.image = UIImage(named: Flags[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = Flags[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }


}

