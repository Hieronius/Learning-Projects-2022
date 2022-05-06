//
//  ViewController.swift
//  NavigationApp
//
//  Created by Арсентий Халимовский on 05.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // Ссылка на сториборд, где размещен ViewController
    let storyboardInstance = UIStoryboard(name: "Main", bundle: nil)
    // Обращаясь к свойству storyboardInstance, вы всегда будете получать один и тот же экземпляр, описывающий все элементы, размещенные на сториборде (в файле Main.storyboard)
    
    // Перейти к зеленой сцене
    @IBAction func toGreenScene(_ sender: UIButton) {
        
        // Получаем ссылку на следующий контроллер
        // В данном случае следующий - это зеленый
        let nextViewController = storyboardInstance.instantiateViewController(withIdentifier: "greenViewController")
        
        // Обращаемся к Navigation Controller
        // Вызываем  метод перехода к новому контроллеру
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    // Перейти к желтой сцене
    @IBAction func toYellowScene(_ sender: UIButton) {
        
        let nextViewController = storyboardInstance.instantiateViewController(withIdentifier: "yellowViewController")
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    // Перейти к корневой сцене
    @IBAction func toRootScene(_ sender: UIButton) {
        
        // Обращаемся к Navigation Controller
        // и вызываем метод перехода к корневому контроллеру
        self.navigationController?.popToRootViewController(animated: true)

    }
    
    // Перейти к предыдущему экрану
    @IBAction func toPreviousScene(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        // С помощью метода toPreviousScene будет осуществляться переход к предыдущему элементу навигационного стека. Это программный аналог кнопки возврата к предыдущей сцене, автоматически размещенный на навигационной панели.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

