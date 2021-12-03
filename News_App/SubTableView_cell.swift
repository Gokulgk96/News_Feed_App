//
//  SubTableView_cell.swift
//  News_App
//
//  Created by Gokul Gopalakrishnan on 03/12/21.
//

import UIKit

class SubTableView_cell: UITableViewCell {

    @IBOutlet weak var Title_Label: UILabel!
    
    @IBOutlet weak var Sub_Title_Label: UILabel!
    
    @IBOutlet weak var Sub_image: UIImageView!
    
    
    let boldAttribute = [
         NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 18)!
      ]


    
    
    
    func set(label: String, Sub_label: String, Image: String)
    {
        let boldText = NSAttributedString(string: label, attributes: boldAttribute)
        
        Title_Label.attributedText = boldText
        Sub_Title_Label.text = Sub_label
        
        let urlString = Image
        
        let url = URL(string: urlString)
        
        do {
        Sub_image.image = try UIImage(data: Data(contentsOf: url!))
        }
        catch{
          Sub_image.image = UIImage(systemName: "pencil")
        }
        
    }


}
