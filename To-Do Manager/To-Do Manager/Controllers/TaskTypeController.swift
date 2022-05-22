

import UIKit

class TaskTypeController: UITableViewController {

    /// 4.2
    // 1. Кортеж, описывающий тип задачи
    typealias TypeCellDescription = (type: TaskPriority, title: String, description: String)
    
    // 2. Коллекция доступных типов задач с их описанием
    private var taskTypesInformation: [TypeCellDescription] = [
        (type: .important, title: "Важная", description: "Такой тип задач является наиболее приоритетным для выполнения. Все важные задачи выводятся в самом верху списка задач"),
        (type: .normal, title: "Текущая", description: "Задача с обычным приоритетом")
    ]
    
    // 3. Выбранный приоритет
    var selectedType: TaskPriority = .normal
    ///
    
    
    /// 4.6
    // обработчик выбора типа
    var doAfterTypeSelected: ((TaskPriority) -> Void)?
    ///
    
    
    /// 4.3
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskTypesInformation.count
    }
    ///
    
    
    
    
    /// 4.5
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1. Получение переиспользуемой кастомной ячейки по ее идентификатору
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTypeCellTableViewCell", for: indexPath) as! TaskTypeCellTableViewCell
        
        // 2. Получаем текущий элемент, информация о котором должна быть выведена в строке
        let typeDescription = taskTypesInformation[indexPath.row]
        
        // 3. Заполняем ячейку данными
        cell.typeTitle.text = typeDescription.title
        cell.typeDescription.text = typeDescription.description
        
        // 4. Если тип является выбранным, то отмечаем галочкой
        if selectedType == typeDescription.type {
            cell.accessoryType = .checkmark
            // в ином случае снимаем отметку
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    ///
    
    
    /// 4.7
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // получаем выбранный тип
        let selectedType = taskTypesInformation[indexPath.row].type
        // вызор обработчика
        doAfterTypeSelected?(selectedType)
        // переход к предыдущему экрану
        navigationController?.popViewController(animated: true)
    }
    ///
    
    
    

    
    
    /// 4.4
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. Получение значения типа UINib, соответствующего xib-файлу кастомной ячейки
        let cellTypeNib = UINib(nibName: "TaskTypeCellTableViewCell", bundle: nil)
        
        // 2. Регистрация кастомной ячейки в табличном представлении
        tableView.register(cellTypeNib, forCellReuseIdentifier: "TaskTypeCellTableViewCell")

        
    }
    ///
    
    
    // MARK: - Table view data source

   
}
