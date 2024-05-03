//
//  GiftCollectionViewCell.swift
//  TUMMOCPROJECT
//
//  Created by prem  on 05/05/24.
//

import UIKit

class GiftCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var favoutiteBtn: UIButton!
    
    @IBOutlet weak var cartbtn: UIButton!
    
    
    var tabledata : String? {
        didSet{
            self.name.text = self.tabledata ?? ""
        }
    
    }
    
    var tabledata2 : String? {
        didSet{
            self.price.text = self.tabledata2 ?? ""
        }
    
    }
    
    var tabledata3 : String? {
        didSet{
            let url = URL(string: self.tabledata3 ?? "")
            self.imageview.sd_setImage(with: url, placeholderImage: UIImage(named: ""))
        }
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
