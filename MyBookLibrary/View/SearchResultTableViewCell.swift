//
//  SearchResultTableViewCell.swift
//  MyBookLibrary
//
//  Created by Tatsuya Moriguchi on 6/15/22.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {

   
    @IBOutlet weak var smallThumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorsLabel: UILabel!
    @IBOutlet weak var identifiersLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }

}
