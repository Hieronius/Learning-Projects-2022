import UIKit

class TaskEditController: UITableViewController {
    
    // Название типов задач
    private var taskTitles: [TaskPriority: String] = [
        .important: "Важная",
        .normal: "Текущая"]
    
    @IBOutlet var taskTypeLabel: UILabel!
    
    @IBOutlet var taskTitle: UITextField!
    
    var doAfterEdit: ((String, TaskPriority, TaskStatus) -> Void?)
    
    // Параметры задачи
    var taskText = " "
    var taskType: TaskPriority = .normal
    var taskStatus: TaskStatus = .planned
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
}

    override func viewDidLoad() {
        super.viewDidLoad()
        // обновление текстового поля с названием задачи
        taskTitle?.text = taskText
        
        // Обновление метки в соответствии с текущим типом
        taskTypeLabel?.text = taskTitles[taskType]
    }
}