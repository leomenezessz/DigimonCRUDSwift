//
//  ViewControllerInsert.swift
//  DigimonRealmCRUD
//
//  Created by Leonardo da Silva Menezes on 01/02/19.
//  Copyright © 2019 Leonardo da Silva Menezes. All rights reserved.
//

import UIKit
import RealmSwift

class DigimonSaveViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var typePicker: UIPickerView!
    @IBOutlet weak var levelPicker: UIPickerView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    let types : [String] = ["Vaccine", "Virus", "Data", "Free", "Variable"]
    let levels : [String] = ["Fresh", "In-Training", "Rookie", "Champion","Ultimate", "Mega"]
    
    var pictureRepresentation : NSData = NSData()
    var digimonToSave : Digimon? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
               
        typePicker.dataSource = self
        levelPicker.dataSource = self
        typePicker.delegate = self
        levelPicker.delegate = self
        
        addButton.addTarget(self, action: #selector(insertDigimon), for: .touchDown)
        
        if digimonToSave != nil {
            nameTextField.text = digimonToSave?.name
            loadImage(nsData: (digimonToSave?.image)!)
            typePicker.selectRow(types.index(of: (digimonToSave?.type)!)!, inComponent: 0, animated: true)
            levelPicker.selectRow(levels.index(of: (digimonToSave?.level)!)!, inComponent: 0, animated: true)
            return
        }
        
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width / 2
        self.profileImageView.clipsToBounds = true
        
        profileImageView.image = UIImage(imageLiteralResourceName: "guilmon.jpg")
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerView == levelPicker ? levels.count : types.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerView == levelPicker ? levels[row] : types[row]
    }
    
    @objc func insertDigimon(sender: UIButton) {
        if (nameTextField.text?.isEmpty)! {
            showAlert(title: "Message", message: "Please choose a digimon name!")
            return
        }
        
        let realm = try! Realm()
        
        let digimon = Digimon()
        digimon.name = nameTextField.text!
        digimon.image = pictureRepresentation
        digimon.level = levels[levelPicker.selectedRow(inComponent: 0)]
        digimon.type = types[typePicker.selectedRow(inComponent: 0)]
        
        if digimonToSave != nil {
            digimon.id = (digimonToSave?.id)!
            digimon.image = profileImageView.image!.jpegData(compressionQuality: 0.0)! as NSData
        }
        
        try! realm.write {
            realm.add(digimon, update: true)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    private func showAlert(title: String, message : String){
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "close", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func dismissKeyboardOnEndOfEditing(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @IBAction func onImageViewClicked(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        profileImageView.image = (info[UIImagePickerController.InfoKey.originalImage] as! UIImage)
        pictureRepresentation = profileImageView.image!.jpegData(compressionQuality: 0.0)! as NSData
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onCloseButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
       return pickerView == levelPicker ? changeTitleColorToWhite(title: levels[row]) : changeTitleColorToWhite(title: types[row])
    }
    
    private func loadImage(nsData : NSData)   {
        if nsData.length == 0 {
            profileImageView.image = UIImage(named: "guilmon.jpg")
            return
        }
        profileImageView.image = UIImage(data: nsData as Data)
    }
    
    private func changeTitleColorToWhite(title : String) -> NSAttributedString  {
        return NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
}
