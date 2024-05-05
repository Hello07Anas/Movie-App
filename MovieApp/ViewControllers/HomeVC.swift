//
//  HomeVC.swift
//  MovieApp
//
//  Created by Anas Salah on 05/05/2024.
//

import UIKit

class HomeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,SplashScreenDelegate {
    
    
    @IBOutlet weak var collectionView: UICollectionView!

    var moviesFromAPI: [Movie] = []
    
    var didGoToSplashScreen = false
    var isPresentingSplashScreen = false

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
        if !didGoToSplashScreen && !isPresentingSplashScreen {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
                viewController.modalPresentationStyle = .fullScreen
                viewController.delegate = self // Set delegate
                isPresentingSplashScreen = true // Set flag
                navigationController?.present(viewController, animated: true, completion: nil)
            }
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !didGoToSplashScreen && !isPresentingSplashScreen {
            didGoToSplashScreen = true
        }
        
        NetWorkingAPI().fetchData { [weak self] moviesFromAPI in
            if let moviesFromAPI = moviesFromAPI {
                // Update the collection view data source with the fetched movies
                self?.moviesFromAPI = moviesFromAPI
                // Reload the collection view to display the fetched data
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            } else {
                // Handle error if movies couldn't be fetched
                print("Failed to fetch movies")
            }
        }
        
        // Configure Collection View layout
        // Configure Collection View layout
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumInteritemSpacing = 5 // Adjust spacing value as needed
            layout.minimumLineSpacing = 0
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            
            // Calculate item width and height dynamically
            let itemWidth = (collectionView.bounds.width - layout.sectionInset.left - layout.sectionInset.right - (layout.minimumInteritemSpacing * CGFloat(1))) / 2
            let itemHeight = itemWidth * 1.5 // Adjust height as needed
            
            layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        }

    }



    func splashScreenDismissed() {
        didGoToSplashScreen = true
        isPresentingSplashScreen = false // Reset flag
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesFromAPI.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let movie = moviesFromAPI[indexPath.item]
        
        //cell.movieNameLbl.text = movie.title
        //cell.movieDescriptionLbl.text = movie.description
        
        // Download movie image asynchronously
        DispatchQueue.global().async {
            if let imageData = try? Data(contentsOf: movie.image) {
                DispatchQueue.main.async {
                    cell.movieImage.image = UIImage(data: imageData)
                }
            }
        }
        return cell
    }
    

}

class MovieCell: UICollectionViewCell {
    @IBOutlet weak var movieImage: UIImageView!
}
/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
}
*/
