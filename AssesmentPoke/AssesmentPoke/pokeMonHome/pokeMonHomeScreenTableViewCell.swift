//
//  pokeMonHomeScreenTableViewCellViewController.swift
//  AssesmentPoke
//
//  Created by Kiasha Rangasamy on 2024/07/23.
//

import UIKit

class PokemonHomeScreenTableViewCell: UITableViewCell {

   
    @IBOutlet private weak var pokemonImageView: UIImageView!
    @IBOutlet private weak var pokemonNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.layer.cornerRadius = 40
        contentView.layer.borderWidth = 10
        contentView.layer.borderColor = UIColor.systemCyan.cgColor
        contentView.layer.masksToBounds = true
    }
    
    static func tableViewNib() -> UINib {
        UINib(nibName: TableViewIdentifiers.homeScreenIdentifier, bundle: nil)
    }
}
