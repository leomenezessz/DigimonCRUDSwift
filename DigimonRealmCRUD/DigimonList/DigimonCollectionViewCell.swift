//
//  DigimonCollectionViewCell.swift
//  DigimonRealmCRUD
//
//  Created by Leonardo da Silva Menezes on 02/02/19.
//  Copyright © 2019 Leonardo da Silva Menezes. All rights reserved.
//

import UIKit

class DigimonCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var profileImageview: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func createDigiCell(digimon : Digimon) -> DigimonCollectionViewCell {
        nameLabel.text = digimon.name
        levelLabel.text = digimon.level
        typeLabel.text = digimon.type
        return self
    }

}
