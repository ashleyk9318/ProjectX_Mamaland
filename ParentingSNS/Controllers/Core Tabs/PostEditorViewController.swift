//
//  CameraViewController.swift
//  ParentingSNS
//
//
import AVFoundation
import UIKit

class CameraViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    private let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        
        
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        label.text = "Create Account"
        label.textColor = .greyishBrown()
        label.font = .circular(size: 24)
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
//        navigationController?.setNavigationBarHidden(true, animated: false)
        configureNavigationBar()
        
        label.numberOfLines = 0
        label.textAlignment = .center
        imageView.contentMode = .scaleAspectFit
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    private func configureNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "photo.on.rectangle"),
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapUploadButton))
    }
    
    @objc private func didTapUploadButton() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
        
    }
    
//    private func didTapTakePicture() {
//        let picker = UIImagePickerController()
//        picker.sourceType = .photoLibrary
//        picker.delegate = self
//        picker.allowsEditing = true
//        present(picker, animated: true)
//    }

    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        picker.dismiss(animated: true, completion: nil)
//        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
//            return
//        }
//        guard let imageData = image.pngData() else {
//            return
//        }
//
//        // upload image data
//        // get download url
//        // save download url to userDefaults
//    }
//
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        picker.dismiss(animated: true, completion: nil)
//    }
}
