//
//  pokeMonHomeScreenTableViewCellViewController.swift
//  AssesmentPoke
//
//  Created by Kiasha Rangasamy on 2024/07/23.
//

import UIKit

class pokeMonHomeScreenTableViewCellViewController: UIViewController {

   
    @IBOutlet weak var pokeMonCard: UIImageView!
    @IBOutlet weak var pokeMonName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(pokeMonHome: pokeMonHomeModel ) {
        pokeMonName.text = (pokeMonHome.name)
    }
    
    static func tableViewNib() -> UINib {
        UINib(nibName: "", bundle: nil)
    }
}
