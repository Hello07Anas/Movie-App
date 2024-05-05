////
////  NetWorking.swift
////  MovieApp
////
////  Created by Anas Salah on 05/05/2024.
////
//
//import Foundation
//import UIKit
//
//// MARK: next fun to fetch data using URL Session
//func loadData(complisttionHandler: @escaping ([MoviesPojo]?)-> Void) {
//    let networkIndicator = UIActivityIndicatorView(style: .whiteLarge)
//    networkIndicator.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
//    networkIndicator.startAnimating()
//    UIApplication.shared.keyWindow?.addSubview(networkIndicator)
//    /*
//    Discussion
//    This property holds the UIWindow object in the windows array that is most recently sent the makeKeyAndVisible() message.
//     */
//    let url = URL(string: "https://freetestapi.com/api/v1/movies")
//    
//    guard let newURl = url else {
//        complisttionHandler(nil)
//        DispatchQueue.main.async {
//            networkIndicator.stopAnimating()
//            networkIndicator.removeFromSuperview()
//        }
//        return
//    }
//    
//    let request = URLRequest(url: newURl)
//    let session = URLSession(configuration: .default)
//    
//    let task = session.dataTask(with: request) { data, response, error in
//        DispatchQueue.main.async {
//            networkIndicator.stopAnimating()
//            networkIndicator.removeFromSuperview()
//        }
//        
//        guard let data = data else {
//            complisttionHandler(nil)
//            return
//        }
//        print("BackGround")
//        do {
//            let result = try JSONDecoder().decode([MoviesPojo].self, from: data)
//            complisttionHandler(result)
//        } catch let error {
//            print(error.localizedDescription)
//            complisttionHandler(nil)
//        }
//    }
//    task.resume()
//}
