//
//  ViewController.swift
//  Challenge1
//
//  Created by William Adams on 9/10/22.
//

import UIKit

class ViewController: UITableViewController {
    
    var flagImages = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        title = "Flag Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix(".png") {
                flagImages.append(item)
            }
        }
        
        flagImages.sort()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flagImages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        cell.textLabel?.text = flagImages[indexPath.row]
        cell.imageView?.image = UIImage(named: flagImages[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = flagImages[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

