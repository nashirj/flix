//
//  MoviesViewController.swift
//  flix
//
//  Created by Nashir Janmohamed on 9/25/20.
//  Copyright © 2020 nashirj. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {
    
    var movies = [[String:Any]]() // array of dictionaries
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("hello")

        // Do any additional setup after loading the view.
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            
                print(dataDictionary)
                
                self.movies = dataDictionary["results"] as! [[String:Any]]
                print(self.movies)

                // TODO: Get the array of movies
                // TODO: Store the movies in a property to use elsewhere
                // TODO: Reload your table view data

            }
        }
        task.resume()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
