//
//  NetWorkingAPI.swift
//  MovieApp
//
//  Created by Anas Salah on 05/05/2024.
//

import Foundation
import UIKit

class NetWorkingAPI {
    func fetchData(completion: @escaping ([Movie]?) -> Void) {
        // Create an activity indicator
        let indicator = UIActivityIndicatorView(style: .gray)
        indicator.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
        indicator.startAnimating()
        UIApplication.shared.keyWindow?.addSubview(indicator)
        
        let headers = [
            "X-RapidAPI-Key": "2e73f3e48dmshd51eb68126d3511p1d9985jsn9c2a51dfc3bc",
            "X-RapidAPI-Host": "imdb-top-100-movies.p.rapidapi.com"
        ]
        
        let url = URL(string: "https://imdb-top-100-movies.p.rapidapi.com/")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            // Once the task is completed, stop and remove the activity indicator
            DispatchQueue.main.async {
                indicator.stopAnimating()
                indicator.removeFromSuperview()
            }
            
            if let error = error {
                print("Error: \(error)")
                completion(nil)
            } else if let data = data {
                // Print the received data for debugging purposes
                print(String(data: data, encoding: .utf8) ?? "Received data is not UTF-8 encoded")
                
                // Parse JSON data into an array of Movie objects
                do {
                    let movies = try JSONDecoder().decode([Movie].self, from: data)
                    completion(movies)
                } catch {
                    print("Error decoding JSON: \(error)")
                    completion(nil)
                }
            }
        }
        dataTask.resume()
    }
}



//// Usage

