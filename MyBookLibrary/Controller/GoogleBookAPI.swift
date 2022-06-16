//
//  GoogleBookAPI.swift
//  MyBookLibrary
//
//  Created by Tatsuya Moriguchi on 6/15/22.
//

import Foundation

class GoogleBookAPI {
   
    
    var bookData: Result?
    var urlString: String?

    func getData(url: String, completion: @escaping (Result)-> ()){
        //guard let url != nil else { return }
        
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
                    completion(result)

                } catch {
                    print("error: \(error)")
                }
                
            }

        })
        task.resume()
        
    }

}
