//
//  ViewController.swift
//  TransferApp
//
//  Created by Арсентий Халимовский on 06.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func unwindToFirstScreen(_ segue: UIStoryboardSegue) {}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // определяем идентификатор segue
        switch segue.identifier {
        case "toEditScreen":
            // Обработка перехода
            prepareEditScreen(segue)
        default:
            break
        }
    }
    
    // Подготовка к переходу на экран редактирования
    private func prepareEditScreen(_ segue: UIStoryboardSegue) {
        // Безопасно извлекаем опциональное значение
        guard let destinationController = segue.destination as? SecondViewController else {
            return
        }
        destinationController.updatingData = dataLabel.text ?? ""
    }
    
    var updatedData: String = "Test data"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLabel(withText: updatedData)
    }
    
    // Обновляем данные в текстовой метке
    private func updateLabel(withText text: String) {
        dataLabel.text = updatedData
    }
    
    @IBOutlet var dataLabel: UILabel!
    
    @IBAction func editDataWithProperty(_ sender: UIButton) {
        // получаем вью контроллер, в который происходит переход
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let editScreen = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        // передаем данные
        editScreen.updatingData = dataLabel.text ?? ""
        
        // переходим к следующему экрану
        self.navigationController?.pushViewController(editScreen, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

