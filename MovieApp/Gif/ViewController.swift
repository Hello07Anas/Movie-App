//
//  ViewController.swift
//  MovieApp
//
//  Created by Anas Salah on 05/05/2024.
//

import UIKit

protocol SplashScreenDelegate: AnyObject {
    func splashScreenDismissed()
}

class ViewController: UIViewController {

    weak var delegate: SplashScreenDelegate?

    @IBOutlet weak var imageGif: UIImageView!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let img = UIImage.gifImageWithName("intro")
        imageGif.image = img
        
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { timer in
            self.navigateToNextController()
        }
    }
    
    func navigateToNextController() {
        self.dismiss(animated: true) {
            self.delegate?.splashScreenDismissed() // Notify delegate
        }
    }
}
