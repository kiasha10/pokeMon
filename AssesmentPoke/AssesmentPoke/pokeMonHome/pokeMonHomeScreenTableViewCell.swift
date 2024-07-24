//
//  pokeMonHomeScreenTableViewCellViewController.swift
//  AssesmentPoke
//
//  Created by Kiasha Rangasamy on 2024/07/23.
//

import UIKit

class pokeMonHomeScreenTableViewCell: UITableViewCell {

   
    @IBOutlet private weak var pokeMon: UIImageView!
    @IBOutlet private weak var pokeMonName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(pokeMonNames: pokeMonHomeModel ) {
        pokeMonName.text = "\(pokeMonNames.results)"
    }
    
    static func tableViewNib() -> UINib {
        UINib(nibName: "PokeMonCard", bundle: nil)
    }
}
