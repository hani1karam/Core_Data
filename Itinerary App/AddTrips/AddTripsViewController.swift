//
//  AddTripsViewController.swift
//  Itinerary App
//
//  Created by Hany Karam on 2/15/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//
import Photos
import UIKit

class AddTripsViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tripTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    
    var doneSaving : (() -> ())?
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 26)
        imageView.layer.cornerRadius = 10
titleLabel.layer.shadowOpacity = 1
        titleLabel.layer.shadowColor = UIColor.white.cgColor
        titleLabel.layer.shadowOffset = CGSize.zero
    titleLabel.layer.shadowRadius = 5
    
    }
    
    @IBAction func save(_ sender: Any) {
        tripTextField.rightViewMode = .never
        guard tripTextField.text != ""  , let newTripName = tripTextField.text else {
       tripTextField.layer.borderColor = UIColor.red.cgColor
            tripTextField.layer.borderWidth = 1
            tripTextField.rightViewMode = .always
            return
        }
        TripFunctions.creatTrip(tripModel: TripModel(title: tripTextField.text!, image: imageView.image))
        if let  doneSaving = doneSaving {
            doneSaving()
        }

        dismiss(animated: true)
     }
    fileprivate func presentphotopickercontroller(){
        let mypickercontoler = UIImagePickerController()
        mypickercontoler.allowsEditing = true
            mypickercontoler.delegate = self
        mypickercontoler.sourceType = .photoLibrary
        self.present(mypickercontoler,animated: true)
            
        
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    @IBAction func addbutton(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            PHPhotoLibrary.requestAuthorization { (status) in
                switch status {
                case .authorized :
                    let myPickercontroller = UIImagePickerController()
                    myPickercontroller.delegate = self
                    myPickercontroller.sourceType = .photoLibrary
                    
                    self.present(myPickercontroller,animated: true)
                case .notDetermined :
                    if status == PHAuthorizationStatus.authorized {
                        let myPickercontroller = UIImagePickerController()
                        myPickercontroller.delegate = self
                        myPickercontroller.sourceType = .photoLibrary
                        
                        self.present(myPickercontroller,animated: true)
                    }
                    
                case .restricted:
                    let alert = UIAlertController(title: "photo Libarary Restricted ", message: "photo libarary access restricted ", preferredStyle: .alert)
                    let okaction = UIAlertAction(title: "ok", style: .default)
                    alert.addAction(okaction)
                    self.present(alert,animated: true)
                case .denied:
                    let alert = UIAlertController(title: "photo Libarary denied ", message: "photo libarary access denied ", preferredStyle: .alert)
                    let okaction = UIAlertAction(title: "go to setting", style: .default){
                        (action) in
                        DispatchQueue.main.async {
                            let url = URL(string: UIApplication.openSettingsURLString)!
                            UIApplication.shared.open(url, options: [:])
                        
                        }
                    }
                    let cancelAction = UIAlertAction(title: "cancel", style: .cancel)
                    alert.addAction(okaction)
                    alert.addAction(cancelAction)

                    self.present(alert,animated: true)

                }
            }
        }
    }
}
extension AddTripsViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
{
    if let image = info[.editedImage] as? UIImage{
        self.imageView.image = image
    }
        else if let image =   info[.originalImage] as? UIImage {
 self.imageView.image = image
    }
    dismiss(animated: true)
    }
    func imGWPickerControllerDidCancek(_ picker:UIImagePickerController){
        dismiss(animated: true)
    }
}

