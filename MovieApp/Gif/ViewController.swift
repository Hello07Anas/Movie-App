//
//  ViewController.swift
//  MovieApp
//
//  Created by Anas Salah on 05/05/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageGif: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let img = UIImage.gifImageWithName("intro")
        imageGif.image = img
    }


}

