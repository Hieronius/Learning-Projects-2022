import UIKit

class TaskEditController: UITableViewController {
    
    @IBAction func saveTask(_ sender: UIBarButtonItem) {
        // получаем актуальные значения
        
        var correctTitle = true  // added 18.05.2022
        
        func checkTittle()  {    // added 18.05.2022
            if taskTitle?.text == " " || taskTitle?.text == "" || taskTitle?.text == nil {
                
                
                let alert = UIAlertController(
                title: "Ошибка",
                message: "Отсутствие имени задачи",
                preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Попробовать еще раз", style: .default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
                
                correctTitle = false
                taskTitle?.text = ""
            }
        }
        
        let tittle = taskTitle?.text ?? "" // - standart tittle accepting

        checkTittle()
        
        let type = taskType
        let status: TaskStatus = taskStatusSwitch.isOn ? .completed: .planned
        // вызываем обработчик
        if correctTitle == true {  // added 18.05.2022.
            doAfterEdit?(tittle, type, status)
            // возвращаемся к предыдущему экрану
            navigationController?.popViewController(animated: true)
        
        }
       
        
        
    }
    
    

    
    // переключатель статуса
    @IBOutlet var taskStatusSwitch: UISwitch!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTaskTypeScreen" {
            // ссылка на контроллер назначения
            let destination = segue.destination as! TaskTypeController
            // передача выбранного типа
            destination.selectedType = taskType
            // передача обработчика выбора типа
            destination.doAfterTypeSelected = { [unowned self] selectedType in
                taskType = selectedType
                // обновляем метку с текущим типом
                taskTypeLabel?.text = taskTitles[taskType]
            }
        }
    }
    
    // Название типов задач
    private var taskTitles: [TaskPriority: String] = [
        .important: "Важная",
        .normal: "Текущая"]
    
    @IBOutlet var taskTypeLabel: UILabel!
    
    @IBOutlet var taskTitle: UITextField!
    
    var doAfterEdit: ((String, TaskPriority, TaskStatus) -> Void)?
    
    // Параметры задачи
    var taskText = ""
    var taskType: TaskPriority = .normal
    var taskStatus: TaskStatus = .planned
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
}

    override func viewDidLoad() {
        super.viewDidLoad()
        // обновление текстового поля с названием задачи
        taskTitle?.text = taskText
        
        // Обновление метки в соответствии с текущим типом
        taskTypeLabel?.text = taskTitles[taskType]
        
        // Обновляем статус задачи
        if taskStatus == .completed {
            taskStatusSwitch.isOn = true
        }
    }
}
