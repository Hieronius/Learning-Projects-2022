import UIKit

class TaskEditController: UITableViewController {
    
    @IBAction func saveTask(_ sender: UIBarButtonItem) {
        // получаем актуальные значения
        
//        let tittle = checkTitle()
        
        func checkTittle()  {
            if tittle == " " || tittle == "" {
                let alert = UIAlertController(
                title: "Ошибка",
                message: "Отсутствие имя задачи",
                preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Попробовать еще раз", style: .default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        let tittle = taskTitle?.text ?? "" // - standart tittle accepting

        checkTittle()
        
        let type = taskType
        let status: TaskStatus = taskStatusSwitch.isOn ? .completed: .planned
        // вызываем обработчик
        doAfterEdit?(tittle, type, status)  // should remove "!" is i want my code back
        
    
        checkTittle()
        
        // возвращаемся к предыдущему экрану
        navigationController?.popViewController(animated: true)
    }
    
    
    
//    func checkTitle() -> String? {
//        if taskTitle?.text != nil && taskTitle.text != " " && taskTitle.text != "" { // right now it's check for empty and backspace value
//                    return taskTitle.text!
//                } else {
//                    print("There is a mistake")
//                  return nil
//                }
    // func really working. If there is only backspace or no value it's return a task with name "There is a mistake" or different title if it was writed correctly. But how to change this side effect with "there is mistake" title?
    
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
