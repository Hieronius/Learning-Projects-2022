
/// "1.1. or 1.1.1" - it's steps that was made during editing this app

import UIKit

class TaskListController: UITableViewController {
    
    
    /// 2.1
    // порядок отображения задач по их статусу
    var tasksStatusPosition: [TaskStatus] = [.planned, .completed]
    ///
    
    
    /// 1.7
    // хранилище задач. Used for access to task storage.
    var tasksStorage: TasksStorageProtocol = TasksStorage() // May be can be useful in my AppStore app
    ///

    
    /// 2.5 / 5.6
    // коллекция задач. Actual list of tasks. It's mean tasks = [.important: [task 1, task 2, task]], [.normal: [task 1, task 2, task 3]]
var tasks: [TaskPriority: [TaskProtocol]] = [:] { // can be useful too
    didSet {
        
        // Сортировка списка задач
        for (tasksGroupPriority, tasksGroup) in tasks {
            tasks[tasksGroupPriority] = tasksGroup.sorted { task1, task2 in
                let task1position = tasksStatusPosition.firstIndex(of: task1.status) ?? 0
                let task2position = tasksStatusPosition.firstIndex(of: task2.status) ?? 0
                return task1position < task2position
            }
        }
        
         
        ///
        
        // Homework from Usov
        // This place of code is perfect to add my tasks check because it's reload after each task changes
//        if tasks[.important]?.count == 0 {
//
//             func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//                var title: String?
//                let tasksType = sectionsTypePosition[section]
//                 if tasksType == .important {
//                    title = "Важные задачи отсутствуют"
//                     print("check point 1")
//                 }
//
//                 print("check point 2")
//                return title
//
//             }
//        }
//
//        if tasks[.important]!.count > 0 {
//
//            func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//               var title: String?
//               let tasksType = sectionsTypePosition[section]
//                if tasksType == .important {
//                   title = "Важные"
//                    print("check point 3")
//                }
//
//                print("check point 4")
//               return title
//
//            }
//             }
             
        
        // check if there is no current tasks print a mesage "There is no current tasks" and else lets load array of tasks
//        if tasks[.normal]?.count == 0 {
//            let noDataNormalLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
//                noDataNormalLabel.text = "There is no normal tasks"
//            noDataNormalLabel.textColor = UIColor.black
//            noDataNormalLabel.textAlignment = .center
//            tableView.backgroundView = noDataNormalLabel
//            tableView.separatorStyle = .none
//
//            print("Normal tasks check")
//
//        } else {
//            tableView.backgroundView = nil
//        }
        
            
        
        // Сохранение задач
        var savingArray: [TaskProtocol] = []
        tasks.forEach { _, value in
            savingArray += value
        }
        tasksStorage.saveTasks(savingArray)
    }
}
    
    // порядок отображения секций по типам
    // индекс в массиве соответствует индексу секции в таблице
    var sectionsTypePosition: [TaskPriority] = [.important, .normal]
    ///
    
    
    /// 1.8
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        /// 2.7
        // кнопка активации режима редактирования
        navigationItem.leftBarButtonItem = editButtonItem
        ///
        
    }
    
    /// may be should be deleted
    private func loadTasks() {
        // подготовка коллекции с задачами
        // будем использовать только те задачи, для которых определена секция в таблице
        sectionsTypePosition.forEach { taskType in
            tasks[taskType] = []
        }
        // загрузка и разбор задач из хранилища
        tasksStorage.loadTasks().forEach { task in
            tasks[task.type]?.append(task)
        }
        
        
       
    }
    ///
    
    /// 1.9
    // количество секций в таблице
    override func numberOfSections(in tableView: UITableView) -> Int {

        return tasks.count
    }
    
    // количество строк в определенной секции
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // определяем приоритет задач, соответствующий текущей секции
        let taskType = sectionsTypePosition[section] // here
        guard let currentTasksType = tasks[taskType] else {
        
            return 0
        }
        
        return currentTasksType.count
    }

    /// 2.3
    // ячейка для строки таблицы
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // ячейка на основе констрейнтов
        // return getConfiguredTaskCell_constraints(for: indexPath)
        // ячейка на основе стека
        return getConfiguredTaskCell_stack(for: indexPath)
    }
    ///
    
    // ячейка на основе ограничений
    private func getConfiguredTaskCell_constraints(for indexPath: IndexPath) -> UITableViewCell {
        // загружаем прототип ячейки по идентификатору
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCellConstraints", for: indexPath)
        // получаем данные о задаче, которую необходимо вывести в ячейке
        let taskType = sectionsTypePosition[indexPath.section]
        guard let currentTask = tasks[taskType]?[indexPath.row] else {
            return cell
        }
        
        // текстовая метка символа
        let symbolLabel = cell.viewWithTag(1) as? UILabel
        // текстовая метка названия задачи
        let textLabel = cell.viewWithTag(2) as? UILabel
        
        // изменяем символ в ячейке
        symbolLabel?.text = getSymbolForTask(with: currentTask.status)
        // изменяем текст в ячейке
        textLabel?.text = currentTask.title
        
        // изменяем цвет текста и символа
        if currentTask.status == .planned {
            textLabel?.textColor = .black
            symbolLabel?.textColor = .black
        } else {
            textLabel?.textColor = .lightGray
            symbolLabel?.textColor = .lightGray
        }
        
        return cell
    }
    
    // возвращаем символ для соответствующего типа задачи
    private func getSymbolForTask(with status: TaskStatus) -> String {
        var resultSymbol: String
        if status == .planned {
            resultSymbol = "\u{25CB}"
        } else if status == .completed {
            resultSymbol = "\u{25C9}"
        } else {
            resultSymbol = " "
        }
        return resultSymbol
    }
    ///
    
    
    /// 2.0
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title: String?
        let tasksType = sectionsTypePosition[section]
        
        if tasksType == .important && tasks[.important]?.count == 0 {
            print("Check point 1")
            title = "Важные задачи отсутствуют"
            
            
        } else if tasksType == .normal && tasks[.normal]?.count == 0 {
            print("Check point 2")
            title = "Текущие задачи отсутствуют"
            
            
            
        
        } else if tasksType == .important && tasks[.important]?.count != 0 {
            print("Check point 3")
            title = "Важные"
            
            
            
        } else if tasksType == .normal && tasks[.normal]?.count != 0 {
            print("Check point 4")
            title = "Текущие"
            
            
            
           
        }
    return title
        
    }


   ///
    
    
    /// 2.2
    // ячейка на основе стека
    private func getConfiguredTaskCell_stack(for indexPath: IndexPath) -> UITableViewCell {
    // загружаем прототип ячейки по идентификатору
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCellStack", for: indexPath) as! TaskCell
    // получаем данные о задача, которые необходимо вывести в ячейке
        let taskType = sectionsTypePosition[indexPath.section]
    guard let currentTask = tasks[taskType]?[indexPath.row] else {
        return cell
        
    }
                         
    // изменяем текст в ячейке
    cell.title.text = currentTask.title
    // изменяем символ в ячейке
    cell.symbol.text = getSymbolForTask(with: currentTask.status)
                         
    // изменяем цвет текста
    if currentTask.status == .planned {
        cell.title.textColor = .black
        cell.symbol.textColor = .black
    } else {
        cell.title.textColor = .lightGray
        cell.symbol.textColor = .lightGray
    }
        return cell
                         
}
    ///

    
    /// 2.4
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1. Проверяем существование задачи
        let taskType = sectionsTypePosition[indexPath.section]
        guard let _ = tasks[taskType]?[indexPath.row] else {
            return
        }
        
        // 2. Убеждаемся, что задача не является выполненной
        guard tasks[taskType]![indexPath.row].status == .planned else {
            // снимаем выделение со строки
            tableView.deselectRow(at: indexPath, animated: true)
            return
        }
        
        // 3. Отмечаем задачу как выполненную
        tasks[taskType]![indexPath.row].status = .completed
        
        // 4. Перезагружаем секцию таблицы
        tableView.reloadSections(IndexSet(arrayLiteral: indexPath.section), with: .automatic)
    }
    ///
    
    
    /// 2.6 / 5.3
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // Получаем данные о задаче, по которой осуществлен свайп
        let taskType = sectionsTypePosition[indexPath.section]
        guard let _ = tasks[taskType]?[indexPath.row] else {
            return nil
        }
        
        // Действие для изменения статуса на "запланирована"
        let actionSwipeInstance = UIContextualAction(style: .normal, title: "Не выполнена") { _,_,_ in
            self.tasks[taskType]![indexPath.row].status = .planned
            self.tableView.reloadSections(IndexSet(arrayLiteral: indexPath.section), with: .automatic)
        }
        
        // Действие для перехода к экрану редактирования
        let actionEditInstance = UIContextualAction(style: .normal, title: "Изменить") { _,_,_ in
            // Загрузка сцены со storyboard
            let editScreen = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TaskEditController") as! TaskEditController
            // передача значений редактируемой задачи
            editScreen.taskText = self.tasks[taskType]![indexPath.row].title
            editScreen.taskType = self.tasks[taskType]![indexPath.row].type
            editScreen.taskStatus = self.tasks[taskType]![indexPath.row].status
            // передача обработчика для сохранения задачи
            editScreen.doAfterEdit = { [self] title, type, status in
                let editedTask = Task(title: title, type: type, status: status)
                tasks[taskType]![indexPath.row] = editedTask
                tableView.reloadData()
            }
            // переход к экрану редактирования
            self.navigationController?.pushViewController(editScreen, animated: true)
        }
        
        // изменяем цвет фона кнопки с действием
        actionEditInstance.backgroundColor = .darkGray
        
        // создаем обьект, описывающий доступные действия
        // в зависимости от статуса задачи будет отображено 1 или 2 действия
        let actionsConfiguration: UISwipeActionsConfiguration
        if tasks[taskType]![indexPath.row].status == .completed {
            actionsConfiguration = UISwipeActionsConfiguration(actions: [actionSwipeInstance, actionEditInstance])
        } else {
            actionsConfiguration = UISwipeActionsConfiguration(actions: [actionEditInstance])
        }
        
        return actionsConfiguration
    }
    ///
    
    
    /// 2.8 / 2.9
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let taskType = sectionsTypePosition[indexPath.section]
        // удаляем задачу
        tasks[taskType]?.remove(at: indexPath.row)
        // удаляем строку, соответствующую задаче
        tableView.deleteRows(at: [indexPath], with: .automatic)
        tableView.reloadData()
    }
    ///
    
    
    /// 3.0
    // ручная сортировка списка задач
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // секция, из которой происходит перемещение
        let taskTypeFrom = sectionsTypePosition[sourceIndexPath.section]
        // секция, в которую происходит перемещение
        let taskTypeTo = sectionsTypePosition[destinationIndexPath.section]
        
        // безопасно извлекаем задачу, тем самым копируем ее
        guard let movedTask = tasks[taskTypeFrom]?[sourceIndexPath.row] else {
            return
            
        }
        
        // Удаляем задачу с места, откуда она перенесена
        tasks[taskTypeFrom]!.remove(at: sourceIndexPath.row)
        // Вставляем задачу на новую позицию
//        tasks[taskTypeTo]!.insert(movedTask, at: destinationIndexPath.row)
        // если секция изменилась, изменяем тип задачи в соответствии с новой позицией
        if taskTypeFrom != taskTypeTo {
            tasks[taskTypeTo]![destinationIndexPath.row].type = taskTypeTo
        }
        
        // обновляем данные
        tableView.reloadData()
    }
    ///
    
    
    /// 5.2
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCreateScreen" {
            let destination = segue.destination as! TaskEditController
            destination.doAfterEdit = { [unowned self] title, type, status in
                let newTask = Task(title: title, type: type, status: status)
                tasks[type]?.append(newTask)
                tableView.reloadData()
            }
        }
    }
    ///


    /// 5.8
    // Получение списка задач, их разбор и установка в свойство tasks
    func setTasks(_ tasksCollection: [TaskProtocol]) {
        // подготовка коллекции с задачами
        // будем использовать только те задачи, для которых определена секция
        sectionsTypePosition.forEach { taskType in // sectionsTypesPosition - у автора
            tasks[taskType] = []
        }
        // загрузка и разбор задач из хранилища
        tasksCollection.forEach { task in
            tasks[task.type]?.append(task)
        }
        
    
    }
    ///
}
    

    // MARK: - Table view data source
    
