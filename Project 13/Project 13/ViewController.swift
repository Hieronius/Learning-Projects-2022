//
//  ViewController.swift
//  Project 13
//
//  Created by Арсентий Халимовский on 23.11.2022.
//
import CoreImage
import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var intensity: UISlider!
    @IBOutlet var radius: UISlider!
    @IBOutlet var scale: UISlider!
    @IBOutlet var center: UISlider!
    
    @IBOutlet var changeFilterLabel: UIButton!
    
    
    var currentImage: UIImage!
    
    var context: CIContext!
    var currentFilter: CIFilter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Instafilter"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(importPicture))
        
        context = CIContext()
        currentFilter = CIFilter(name: "CISepiaTone")
        
        
    }
    
    @objc func importPicture() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imageView.alpha = 0
        
        guard let image = info[.editedImage] as? UIImage else { return }
        dismiss(animated: true)
        currentImage = image
        
        
        
        let beginImage = CIImage(image: currentImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
        
        
    }

    @IBAction func changeFilter(_ sender: UIButton) {
        let ac = UIAlertController(title: "Choose filter", message: nil, preferredStyle: .actionSheet)
        
        ac.addAction(UIAlertAction(title: "CIBumpDistortion", style: .default, handler: setFilter))
        
        ac.addAction(UIAlertAction(title: "CIGaussianBlur", style: .default, handler: setFilter))
        
        ac.addAction(UIAlertAction(title: "CIPixellate", style: .default, handler: setFilter))
        
        ac.addAction(UIAlertAction(title: "CISepiaTone", style: .default, handler: setFilter))
        
        ac.addAction(UIAlertAction(title: "CITwirlDistortion", style: .default, handler: setFilter))
        
        ac.addAction(UIAlertAction(title: "CIUnsharpMask", style: .default, handler: setFilter))
        
        ac.addAction(UIAlertAction(title: "CIVignette", style: .default, handler: setFilter))
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        if let popoverController = ac.popoverPresentationController {
            popoverController.sourceView = sender
            popoverController.sourceRect = sender.bounds
        }
        
        
        
        present(ac, animated: true)
        
        
    }
    
    func setFilter(action: UIAlertAction) {
        guard currentImage != nil else { return }
        guard let actionTitle = action.title else { return }
        
        currentFilter = CIFilter(name: actionTitle)
        
        let beginImage = CIImage(image: currentImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        
        changeFilterLabel.titleLabel?.text = actionTitle
        
//        applyProcessing()
    }
    
    @IBAction func save(_ sender: Any) {
        
        if let image = imageView.image {
            
            UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
            
        
        } else {
            
            let ac = UIAlertController(title: "Error", message: "There is no image", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default))
            present(ac, animated: true)
    }
    }
        
    
    @IBAction func intensityChanged(_ sender: Any) {
         applyProcessing()
        
    }
    
    @IBAction func radiusChanged(_ sender: Any) {
         applyProcessing()
        
        
    }
    
    @IBAction func scaleChanged(_ sender: Any) {
         applyProcessing()
        
    }
    
    @IBAction func centerChanged(_ sender: Any) {
         applyProcessing()
        
        
    }
    
    
    func applyProcessing() {
        
        // probably here i should just use a couple of new variables for my new sliders and set value for this sliders instead of only "intensity.values"
        
        let inputKeys = currentFilter.inputKeys

        if inputKeys.contains(kCIInputIntensityKey) {
            // currentFilter.setValue(intensity.value, forKey: kCIInputIntensityKey)

            guard let outputImage = currentFilter.outputImage else { return }

            currentFilter.setValue((intensity.value * 10), forKey: kCIInputIntensityKey)

            if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
                let processedImage = UIImage(cgImage: cgImage)
                imageView.image = processedImage
            }

        }
        
        if inputKeys.contains(kCIInputRadiusKey) {
            // currentFilter.setValue(radius.value * 200, forKey: kCIInputRadiusKey)

            guard let outputImage = currentFilter.outputImage else { return }

            currentFilter.setValue((radius.value * 200), forKey: kCIInputRadiusKey)

            if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
                let processedImage = UIImage(cgImage: cgImage)
                imageView.image = processedImage
            }
        }
        
        if inputKeys.contains(kCIInputScaleKey) {
            // currentFilter.setValue(scale.value * 10, forKey: kCIInputScaleKey)

            guard let outputImage = currentFilter.outputImage else { return }

            currentFilter.setValue((scale.value), forKey: kCIInputScaleKey)

            if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
                let processedImage = UIImage(cgImage: cgImage)
                imageView.image = processedImage
            }
        }
        
        if inputKeys.contains(kCIInputCenterKey) {
            // currentFilter.setValue(CIVector(x: currentImage.size.width / 2, y: currentImage.size.height / 2), forKey: kCIInputCenterKey)

            guard let outputImage = currentFilter.outputImage else { return }
            
            // currentFilter.setValue((center.value), forKey: kCIInputCenterKey)

//            currentFilter.setValue(CIVector(x: currentImage.size.width / 2, y: currentImage.size.height / 2), forKey: kCIInputCenterKey)
//
            if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
                let processedImage = UIImage(cgImage: cgImage)
                imageView.image = processedImage
            }
        }
        
        
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default))
        } else {
            let ac = UIAlertController(title: "Saved", message: "Your altered image has been saved to your photos", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default))
            present(ac, animated: true)
        }
    }
    
}

