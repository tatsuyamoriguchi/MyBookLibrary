//
//  SearchResultTableViewController.swift
//  MyBookLibrary
//
//  Created by Tatsuya Moriguchi on 6/15/22.
//

import UIKit

class SearchResultTableViewController: UITableViewController {

    var urlString: String?
    var bookData: Result?
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if urlString != nil {
            GoogleBookAPI().getData(url: urlString!, completion: { (data) in
                self.bookData = data
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
                
            })
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bookData?.items.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SearchResultTableViewCell

        let item = bookData?.items[indexPath.row].volumeInfo
        cell.titleLabel.text = item?.title
        
        
        var imageURL: URL
        if let smallThumbnailURL = item?.imageLinks?.smallThumbnail {
            imageURL = URL(string: smallThumbnailURL)!
            
            
            
            //let smallThumbnailImage =   UIImage(imageURL)
            DispatchQueue.main.async {
                
                guard let imageData = try? Data(contentsOf: imageURL) else {
                    return
                }
                
                cell.smallThumbnailImageView.image  = UIImage(data: imageData)
            }
        }
        
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */



}
