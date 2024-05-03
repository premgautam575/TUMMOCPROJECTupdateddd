//
//  FavouriteScreenTableViewCell.swift
//  TUMMOCPROJECT
//
//  Created by prem  on 09/05/24.
//

import UIKit
import SDWebImage

class FavouriteScreenTableViewCell: UITableViewCell {

    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    
    var tabledata3 : String?  {
        didSet{
            let url = URL(string: "https://cdn-icons-png.flaticon.com/128/2553/2553691.png")
            self.imageview.sd_setImage(with:  url  , placeholderImage: UIImage(named: ""))
        }
    }
    
    var tabledata1 : String?  {
        didSet{
            self.name.text = tabledata1! as! String
        }
    }
    
    var tabledata2 : String?  {
        didSet{
            self.price.text = tabledata2 as! String
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
