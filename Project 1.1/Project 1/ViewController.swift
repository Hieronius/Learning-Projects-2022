//
//  ViewController.swift
//  Project 1
//
//  Created by Арсентий Халимовский on 12.09.2022.
//

import UIKit

class ViewController: UICollectionViewController {
    
    var pictures = [String]()
    var picturesNSObject = [PictureNSObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(sharedApp))
        
        title = "Storm Viewer"
        
        performSelector(inBackground: #selector(getImages), with: nil)
        
        if !pictures.isEmpty {
            collectionView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
        }
        
//        tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
        // print(pictures.sort())
    }
    
    @objc func getImages() {
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                // this is a picture to load!
                pictures.append(item)
            }
        }
        pictures.sort()
        print(pictures.count)
        
        
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Picture", for: indexPath) as? Picture else {
            fatalError("Unable to dequeue PictureCell")
        }
        
        // test //
        let paint = picturesNSObject[indexPath.item]
        cell.name.text = paint.name
        
        let path = getDocumentsDirectory().appendingPathComponent(paint.image)
        cell.imageView.image = UIImage(contentsOfFile: path.path)
        
        cell.imageView.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
        cell.imageView.layer.borderWidth = 2
        cell.imageView.layer.cornerRadius = 3
        cell.layer.cornerRadius = 7
        
        
        // cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func imagePickerController(_picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        guard let image = info[.editedImage] as? UIImage else { return }
        
        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
        
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }
        
        let picture = PictureNSObject(name: "Unknown", image: imageName)
        picturesNSObject.append(picture)
        collectionView.reloadData()
        
        dismiss(animated: true)
    }
        
    
    override func collectionView(_ collection: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            vc.title = "Picture \(pictures.firstIndex(of: (pictures[indexPath.row]))! + 1) of \(pictures.count)"
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func sharedApp() {
        
        let sharedLink = "Check this app - Storm Viewer!"
        let image = "📲"
        
        let vc = UIActivityViewController(activityItems: [sharedLink, image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}

