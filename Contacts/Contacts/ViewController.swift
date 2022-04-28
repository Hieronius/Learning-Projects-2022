//
//  ViewController.swift
//  Contacts
//
//  Created by Арсентий Халимовский on 24.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var storage: ContactStorageProtocol!
    
    @IBOutlet var tableView: UITableView!
    
    @IBAction func showNewContactAlert() {
        // создание Alert Controller
        let alertController = UIAlertController(title: "Создайте новый контакт", message: "Введите имя и телефон", preferredStyle: .alert)
        
        // добавляем первое текстовое поле в Alert Controller
        alertController.addTextField { textField in
            textField.placeholder = "Имя"
        }
        
        // добавляем второе тестокое поле в Alert Controller
        alertController.addTextField { textField in
            textField.placeholder = "Номер телефона"
        }
        
        // Создаем кнопки
        // Кнопка создания контакта
        let createButton = UIAlertAction(title: "Создать", style: .default) {
            _ in
            guard let contactName = alertController.textFields?[0].text,
                  let contactPhone = alertController.textFields?[1].text else {
                      return
                  }
            
            // Создаем новый контакт
            let contact = Contact(title: contactName, phone: contactPhone)
            self.contacts.append(contact)
            self.tableView.reloadData()
        }
        
        // Кнопка отмены
        let cancelButton = UIAlertAction(title: "Отменить", style: .cancel, handler: nil)
        
        // добавляем кнопки в Alert Controller
        alertController.addAction(cancelButton)
        alertController.addAction(createButton)
        
        // отображаем Alert Controller
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    var contacts: [ContactProtocol] = [] {
        didSet {
            contacts.sort { $0.title < $1.title }
            // сохранение контактов в хранилище
            storage.save(contacts: contacts)
        }
    }
    // Свойство contacts - это массив контактов, элементы которого будут выведены в табличном представлении. При загрузке сцены данное свойство будет наполняться данными, а в последствии использоваться для наполнения ячеек таблицы данными.
    
    private func loadContacts() {
        contacts = storage.load()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        storage = ContactStorage()
        loadContacts()
        
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDataSource {
    // Функция возвращающая общее число ячеек в таблице
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    // Функция возвращающая конкретный экземпляр ячейки для конкретной строки таблицы
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell
        if let reuseCell = tableView.dequeueReusableCell(withIdentifier: "MyCell") {
            print("Используем старую ячейку для строки с индексом \(indexPath.row)")
            cell = reuseCell
        } else {
            print("Создаем новую ячейку для строки с индексом \(indexPath.row)")
            cell = UITableViewCell(style: .default, reuseIdentifier: "MyCell")
        }
        configure(cell: &cell, for: indexPath)
        return cell
    }
    
    private func configure(cell: inout UITableViewCell, for indexPath: IndexPath) {
        var configuration = cell.defaultContentConfiguration()
        // Имя контакта
        configuration.text = contacts[indexPath.row].title
        // Номер телефона контакта
        configuration.secondaryText = contacts[indexPath.row].phone
        cell.contentConfiguration = configuration
        // configuration.text - определяет основной текст
        // configuration.secondaryText - определяет вспомогательный текст
    }
    
}

extension ViewController: UITableViewDelegate {
    
    // метод для свайпа влево
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // действие удаления
        let actionDelete = UIContextualAction(style: .destructive, title: "Удалить") {
        _,_,_ in
        // удаляем контакт
        self.contacts.remove(at: indexPath.row)
        // заново формируем табличное представление
        tableView.reloadData()
    }
    // формируем экземпляр, описывающий доступные действия
        let actions = UISwipeActionsConfiguration(actions: [actionDelete])
        return actions
}

}
