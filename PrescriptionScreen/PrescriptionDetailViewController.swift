//
//  PrescriptionDetailViewController.swift
//  PrescriptionScreen
//
//  Created by admin100 on 16/11/24.
//

import UIKit

class PrescriptionDetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!

    
    var prescriptionFileName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "default")
      
    }
}

