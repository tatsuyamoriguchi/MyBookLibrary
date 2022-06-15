//
//  ViewController.swift
//  MyBookLibrary
//
//  Created by Tatsuya Moriguchi on 6/15/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://www.googleapis.com/books/v1/volumes?q=iOS_App_Development"
        
        getData(url: url)
        
       
    }
    
    
    
    func getData(url: String) {
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            if error != nil {
                print("Error: \(String(describing: error))")
            } else {
                
                do {
                    
                    let result = try JSONDecoder().decode(Result.self, from: data!)
                    
                    for item in result.items {
                    // use print() to debug
                        print(item.volumeInfo.title)
                        let authors = item.volumeInfo.authors
                        print("Author(s): ")
                        for author in authors {
                            print(" \(author)")
                        }
                        
                        let identifiers = item.volumeInfo.industryIdentifiers
                        for id in identifiers {
                            print("ID Type: \(id.type)")
                            print("  \(id.identifier)")
                            }
                        print("")
                    }
                    // Create UI objects and change property names below
 /*                  DispatchQueue.main.async {
                        self.cityNameLabel.text = result.location.name
                        self.stateLabel.text = result.location.region
                        self.currentWeatherLabel.text = result.current.condition.text
                        self.currentTemeratureLabel.text = String(result.current.temp_f)
                        
                        let iconString = "https:" + result.current.condition.icon
                        print("iconString: \(iconString)")
                        let iconURL = URL(string: iconString)
                        if let imageData = NSData(contentsOf: iconURL! as URL)  {
                            DispatchQueue.main.async {
                                self.iconImageView.image = UIImage(data: imageData as Data)
                            }
                        }
    
                   }
                    */
                } catch {
                    print("error: \(error)")
                }
            }
        })
        task.resume()
        
    }


}

