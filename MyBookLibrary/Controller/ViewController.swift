//
//  ViewController.swift
//  MyBookLibrary
//
//  Created by Tatsuya Moriguchi on 6/15/22.
//

import UIKit

class ViewController: UIViewController {

    let url = "https://www.googleapis.com/books/v1/volumes?q="

    var urlString: String = ""
    
    @IBOutlet weak var searchTextField: UITextField!





    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    
    @IBAction func seachOnPressed(_ sender: Any) {
        if let keywords = searchTextField.text {
            urlString = url + keywords
            performSegue(withIdentifier: "SearchSegue", sender: nil)
        } else {
            Helper().alertNoInput()
        }
        
    }

    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SearchSegue" {
            let destination = segue.destination as? SearchResultTableViewController
            destination?.urlString = urlString
        }
        
    }
    
    
}

