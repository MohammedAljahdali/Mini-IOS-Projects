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
    var textList: [UITextField]!
    struct imageData {
        let topTextFieldd: UITextField!
        let bottomTextField: UITextField!
        let originalImage: UIImage!
        let editedImage: UIImage!
    }
    
    // MARK: IBOUtlets
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var textFieldBottom: UITextField!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var shareButton: UIButton!
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        textList = [textField, textFieldBottom]
        for textField in textList {
            textField.defaultTextAttributes = textAttributes
            textField.text = "Write Here!"
            textField.textAlignment = NSTextAlignment.center
            textField.delegate = self
            textField.addTarget(self, action: #selector(ViewController.upperCaseTextField), for: UIControl.Event.editingChanged)
        }
        shareButton.isEnabled = false
    }
    
    // MARK: viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        subscribeToKeyboardNotification()
    }
    // MARK: viewWillDisappear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeTokeyboardNotification()
        subscribeTokeyboardWillHideNotification()
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
    @IBAction func shareView(_ sender: Any) {
        let editedIamge = takeEditedImage()
        let controller = UIActivityViewController(activityItems: [editedIamge], applicationActivities: nil)
        present(controller, animated: true, completion: nil)
        controller.completionWithItemsHandler = { (activityType: UIActivity.ActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) -> Void in
            if completed == true {
                self.saveImage()
            }
        }
        
    }
    
    // MARK: ImagePicker delegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageChosen = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = imageChosen
            imageView.contentMode = .scaleToFill
            shareButton.isEnabled = true
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
    @objc func upperCaseTextField(textField: UITextField) {
        textField.text = textField.text!.uppercased()
    }
    // MARK: keyboard
    
    func getKeybordHeight(_ notification: Notification) -> CGFloat{
        let userInfo = notification.userInfo
        let keyboardHeight = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
        return keyboardHeight.cgRectValue.height
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if textField.isEditing {
            return
        }
        view.frame.origin.y = -getKeybordHeight(notification)
    }
    func subscribeToKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    func unsubscribeTokeyboardNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        view.frame.origin.y = (0) as CGFloat
    }
    func subscribeTokeyboardWillHideNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: saving edited image objects
    
    func takeEditedImage () -> UIImage {
        // hide toolbar
        toolbar.isHidden = true
        // take the image
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let editedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        // show toolbar
        toolbar.isHidden = false
        return editedImage
    }
    
    func saveImage () {
        let image = imageData(topTextFieldd: textList[0], bottomTextField: textList[1], originalImage: imageView.image, editedImage: takeEditedImage())
    }
    

}

