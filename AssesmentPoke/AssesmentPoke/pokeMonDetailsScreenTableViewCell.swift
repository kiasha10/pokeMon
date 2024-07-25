//
//  pokeMonDetailsScreenTableViewCell.swift
//  AssesmentPoke
//
//  Created by Kiasha Rangasamy on 2024/07/25.
//

import UIKit

class PokenmonDetailsScreenTableViewCell: UITableViewCell {
    
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var shapeLabel: UILabel!
    @IBOutlet weak var eggGroupLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func tableViewNib() -> UINib {
        UINib(nibName: TableViewIdentifiers.detailsScreenIdentifier, bundle: nil)
    }
}
