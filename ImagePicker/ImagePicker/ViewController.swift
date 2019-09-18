//
//  ViewController.swift
//  ImagePicker
//
//  Created by Mohammed Khakidaljahdali on 16/09/2019.
//  Copyright © 2019 Mohammed. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    let textAttributes: [NSAttributedString.Key: Any] = [
        .foregroundColor: UIColor.blue,
        NSAttributedString.Key.strokeColor: UIColor.black,
        NSAttributedString.Key.strokeWidth: 4.0,
        NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!

    ]
    
    // MARK: IBOUtlets
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cameraButton: UIButton!
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.defaultTextAttributes = textAttributes
        textField.text = "Write Here!"
        textField.textAlignment = NSTextAlignment.center
        textField.delegate = self
        textField.addTarget(self, action: #selector(ViewController.upperCaseTextField), for: UIControl.Event.editingChanged)
    }
    
    // MARK: viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)

    }
    
    // MARK: IBActions
    @IBAction func imagePicker(_ sender: Any) {
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = .photoLibrary
        present(controller, animated: true, completion: nil)
        
    }
    @IBAction func cameraImagePicker(_ sender: Any) {
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = .camera
        present(controller, animated: true, completion: nil)
    }
    
    // MARK: ImagePicker delegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageChosen = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = imageChosen
            imageView.contentMode = .scaleToFill
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: TextField delegate
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        let newText = textField.text! as NSString
//        newText.replacingCharacters(in: range, with: string.uppercased())
//        textField.text = newText as String
//        return true
////            textField.text = (textField.text! as NSString).replacingCharacters(in: range, with: string.uppercased())
////
////        return true
//    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == "Write Here!" {
            textField.text = ""
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @objc func upperCaseTextField() {
        textField.text = textField.text!.uppercased()
    }
    
    

}

