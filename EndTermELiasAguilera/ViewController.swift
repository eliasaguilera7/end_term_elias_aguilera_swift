//
//  ViewController.swift
//  EndTermELiasAguilera
//
//  Created by Elias Aguilera Yambay on 2020-08-06.
//  Copyright © 2020 Elias Aguilera Yambay. All rights reserved.
//
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      let urlString = "https://newsapi.org/v2/everything?q=bitcoin&from=2020-07-06&sortBy=publishedAt&apiKey=8da2d3ce1f6c447885373c1ce5b6c649"
       
        
        let url = URL(string: urlString)
        guard url != nil else {
            return
        }
        let session = URLSession.shared
        
        //let dataTask = session.dataTask(with: url!){ (data, response, error) } in
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
            // Parse JSON
                let decoder = JSONDecoder()
                
                    do{
                        let newsFeed = try decoder.decode(NewsFeed.self, from: data! )
                        print(newsFeed)
                    }
                    catch {
                        print("Error in JSON Parsing")
                    }
                    
                }
                       }
         dataTask.resume()
        }
    
           
    
    
    }
        
     


