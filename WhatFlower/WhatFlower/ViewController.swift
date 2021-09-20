//
//  ViewController.swift
//  WhatFlower
//
//  Created by Bogdan Dediu on 20.09.2021.
//

import UIKit
import CoreML
import Vision
import Alamofire
import SwiftyJSON
import SDWebImage

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var summaryLabel: UILabel!
    
    let wikipediaURL = "https://en.wikipedia.org/w/api.php"
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        //imagePicker.allowsEditing = true
        imagePicker.sourceType = .camera
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            //let userPickedImage = info[UIImagePickerController.InfoKey.editedImage]
            
            guard let convertedCIImage = CIImage(image: userPickedImage) else {
                
                fatalError("Cannot convert to CIImage")
                
            }
            
            detect(image: convertedCIImage)
            
            //imageView.image = userPickedImage
                    
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
    func detect(image: CIImage) {
        
        guard let model = try? VNCoreMLModel(for: FlowerClassifier().model) else {
            fatalError("Cannot import model")
        }
        
        let request = VNCoreMLRequest(model: model) { request, error in
            
            guard let classification = request.results?.first as? VNClassificationObservation else {
                fatalError("Cannot classify images")
            }
            
            self.navigationItem.title = classification.identifier.capitalized
            self.requestInfo(flowerName: classification.identifier)
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        
        do {
            try handler.perform([request])
        } catch {
            print(error)
        }
    }
    
    func requestInfo(flowerName: String) {
        
        let parameters : [String:String] = [
            "format" : "json",
            "action" : "query",
            "prop" : "extracts|pageimages",
            "exintro" : "",
            "explaintext" : "",
            "titles" : flowerName,
            "indexpageids" : "",
            "redirects" : "1",
            "pithumbsize" : "500"
          ]
        
        AF.request(wikipediaURL, method: .get, parameters: parameters).responseJSON { (response) in
            
            do {

                let dataResponse = try response.result.get()

                let flowerJSON: JSON = JSON(dataResponse)

                let pageID = flowerJSON["query"]["pageids"][0].stringValue

                self.summaryLabel.text = flowerJSON["query"]["pages"][pageID]["extract"].stringValue
                
                let flowerImageURL = flowerJSON["query"]["page"][pageID]["thumbnail"]["source"].stringValue
                
                self.imageView.sd_setImage(with: URL(string: flowerImageURL))

            } catch {
                print("Error, \(error)")
            }
        }
        
    }

    @IBAction func cameraPressed(_ sender: UIBarButtonItem) {
        
        present(imagePicker, animated: true, completion: nil)
        
    }
}

