//
//  ViewControllerUserAccount.swift
//  tapOfNumberGames
//
//  Created by R&W on 16/02/23.
//

import UIKit

class ViewControllerUserAccount: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var firstNameTextfilled: UITextField!
    @IBOutlet weak var lastNameTextfilled: UITextField!
    @IBOutlet weak var mobilNumberTextfilled: UITextField!
    @IBOutlet weak var emailTextfilled: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var profileImageSet: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func setProfilePictureButton(_ sender: UIButton) {
        
        showAlertView()
    }
    func showAlertView(){
        
        let alert = UIAlertController(title: "select", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction.init(title: "gallery", style:.default,handler: { _ in self.openGallery()
        }))
        alert.addAction(UIAlertAction.init(title: "camera", style:.default, handler: nil))
        alert.addAction(UIAlertAction.init(title: "cancel", style: .destructive, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        profileImageSet.image=info[.originalImage] as! UIImage
        dismiss(animated: true, completion: nil)
    }
   
    
    func openGallery(){
        let gallery = UIImagePickerController()
        gallery.delegate = self
        gallery.sourceType = .photoLibrary
        
        present(gallery,animated: true, completion:nil)
    }
    
    @IBAction func submitButtonAction(_ sender: UIButton) {
    }
    
}
