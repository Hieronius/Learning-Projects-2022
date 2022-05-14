

import UIKit

class TaskTypeController: UITableViewController {
    
    
    // 1. Кортеж, описывающий тип задачи
    typealias TypeCellDescription = (type: TaskPriority, title: String, description: String)
    
    // 2. Коллекция доступных типов задач с их описанием
    private var taskTypesInformation: [TypeCellDescription] = [
        (type: .important, title: "Важная", description: "Такой тип задач является наиболее приоритетным для выполнения. Все важные задачи выводятся в самом верху списка задач"),
        (type: .normal, title: "Текущая", description: "Задача с обычным приоритетом")
    ]
    
    // 3. Выбранный приоритет
    var selectedType: TaskPriority = .normal

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskTypesInformation.count
    }
   
}
