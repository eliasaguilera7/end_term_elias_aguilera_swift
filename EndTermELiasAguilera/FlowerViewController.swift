//
//  FlowerViewController.swift
//  EndTermELiasAguilera
//
//  Created by Elias Aguilera Yambay on 2020-08-06.
//  Copyright © 2020 Elias Aguilera Yambay. All rights reserved.
//


import UIKit

class FlowerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

   
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    @IBOutlet weak var myTableView: UITableView!
    let flowerArray = ["lotus", "rose", "orchid", "dalhia"]
       // var flowerArray2 = ["Lotus", "Rose", "Orchid", "Dalhia"]
    
        var searchFlowers = [String()]
    var searching = false
    
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            myTableView.delegate = self
            myTableView.dataSource = self
            
        }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            if searching {
                return searchFlowers.count
            }
            else {
                return flowerArray.count
            }
              // return flowerArray.count
          }
          
    
          func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               let cell = tableView.dequeueReusableCell(withIdentifier: "MyView", for:indexPath)
            
            if searching {
                cell.textLabel?.text = searchFlowers[indexPath.row]
                cell.imageView?.image = UIImage(named: searchFlowers[indexPath.row])
            }
            else {
                  cell.textLabel?.text = flowerArray[indexPath.row]
                  cell.imageView?.image = UIImage(named: flowerArray[indexPath.row])
            }
            
            /* cell.textLabel?.frame = CGRect(x: 15, y: 15, width: 10, height: 10)
        cell.textLabel?.text = flowerArray[indexPath.row]
           cell.textLabel?.backgroundColor = .purple*/
          // cell.imageView?.image = UIImage(named: flowerArray[indexPath.row])
            
           
               return cell
          }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        searchFlowers = flowerArray.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        myTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
              searching = false
              searchBar.text = ""
              myTableView.reloadData()
          }
    @IBAction func cancelButton(_ sender: Any) {
                searching = false
                searchBar.text = ""
                myTableView.reloadData()
    }
    
  
    
    }

