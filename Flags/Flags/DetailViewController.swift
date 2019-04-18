//
//  DetailViewController.swift
//  Flags
//
//  Created by mac_os on 13/08/1440 AH.
//  Copyright © 1440 mac_os. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var labelView: UILabel!
    @IBOutlet var image: UIImageView!
    var selectedImage: String?
    
    var Title: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Title
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageToLoad = selectedImage {
            image.image  = UIImage(named: imageToLoad)
            image.layer.borderColor = UIColor.lightGray.cgColor
            image.layer.borderWidth = 1
            //image.layer.borderColor = UIColor.lightGray.cgColor
            labelView.text = selectedImage?.uppercased()
        }
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped() {
        guard let image = image.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
}

