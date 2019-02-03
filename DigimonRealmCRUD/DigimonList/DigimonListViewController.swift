//
//  ViewController.swift
//  DigimonRealmCRUD
//
//  Created by Leonardo da Silva Menezes on 01/02/19.
//  Copyright © 2019 Leonardo da Silva Menezes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
    @IBOutlet weak var digimonCollectionView: UICollectionView!
    var digimonsList : [Digimon] = []
    
    @IBOutlet weak var insertDigimon: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.digimonCollectionView.dataSource = self;
        self.digimonCollectionView.delegate = self;
        
         self.digimonCollectionView.register(UINib(nibName: "DigimonCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DigimonCell")
        
       
        digimonsList = [
            
            Digimon.init(name: "teste", type: "teste", level: "teste", image: "teste"),
            Digimon.init(name: "teste1", type: "teste1", level: "teste1", image: "teste1"),
            Digimon.init(name: "teste2", type: "teste2", level: "teste2", image: "teste2"),
            Digimon.init(name: "teste3", type: "teste3", level: "teste3", image: "teste3")

        ]

        insertDigimon.addTarget(self, action: #selector(callInsertDigimonScene), for: .touchUpInside)
   
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return digimonsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DigimonCell", for: indexPath) as! DigimonCollectionViewCell
        
         return  cell.createDigiCell(digimon: digimonsList[indexPath.row])
        
    }
    
    
    @objc  func callInsertDigimonScene(sender : UIButton) {
        self.performSegue(withIdentifier: "insertScreen", sender: self)
    }
}

