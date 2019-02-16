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
        loadImage(data: digimon.image!, profileImage: profileImageview)
        nameLabel.text = digimon.name
        levelLabel.text = digimon.level
        typeLabel.text = digimon.type
        return self
    }
    
    private func loadImage(data : NSData, profileImage : UIImageView){
        if (data.length == 0) {
            profileImageview.image = UIImage.init(imageLiteralResourceName: "guilmon.jpg")
            return
        }
        profileImageview.image = UIImage(data: data as Data)
    }
}
