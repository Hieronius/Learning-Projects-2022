//
//  ViewController.swift
//  Contacts
//
//  Created by Арсентий Халимовский on 24.04.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDataSource {
    // Функция возвращающая общее число ячеек в таблице
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    // Функция возвращающая конкретный экземпляр ячейки для конкретной строки таблицы
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // производим попытку загрузки переиспользованной ячейки
        guard var cell = tableView.dequeueReusableCell(withIdentifier: "MyCell")
    else {
        
        print("Создаем новую ячейку для строки с индексом \(indexPath.row)")
        
        // получаем экземпляр ячейки
        var newCell = UITableViewCell(style: .default, reuseIdentifier: "MyCell")
        configure(cell: &newCell, for: indexPath)
        return newCell
    }
        // возвращаем сконфигурированный экземпляр ячейки
        print("Используем старуя ячейку для строки с индексом \(indexPath.row)")
        configure(cell: &cell, for: indexPath)
        return cell
    }
    
    private func configure(cell: inout UITableViewCell, for indexPath: IndexPath) {
        var configuration = cell.defaultContentConfiguration()
        configuration.text = "Строка \(indexPath.row)"
        cell.contentConfiguration = configuration
    }
    
}

