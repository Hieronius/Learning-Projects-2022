import UIKit

class TaskEditController: UITableViewController {
    
    
    var doAfterEdit: ((String, TaskPriority, TaskStatus) -> Void?)
    // Параметры задачи
    var taskText = " "
    var taskType: TaskPriority = .normal
    var taskStatus: TaskStatus = .planned
}
