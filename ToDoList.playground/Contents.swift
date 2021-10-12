import Cocoa

print ("MyTasks 🗒")

enum taskStatus{
    case complite, pending
    
}


struct Item {
    
    var title : String
    var day : String
    var task : taskStatus
    var now = Date()
    func code() {
        let date = DateFormatter()
     date.dateStyle = .full
    print(date.string(from: now))}
}


class List {
    
    var listTasks : [Item] = []

    func newListItem(task : Item){
        self.listTasks.append(task)
    }
    
    func display(){
        for item in self.listTasks {
            print("title for task  :\(item.title) - day : \(item.day)  - dateTime : \(item.now) - task status : \(item.task)")
        }
    }
    func delete (index : Int){
        self.listTasks.remove(at: index)
       
    }
    func update (updateTask : Item , index : Int){
        
        self.listTasks[index] = updateTask
        
    
    }
    func filter (filterItem : taskStatus){
        let filterStatus = self.listTasks.filter({$0.task == filterItem})
        for item in filterStatus{
            print ("taskStatus :    \(filterItem) ... \(item.title)...")
            
            if filterItem == .complite{
                print ("    ___________I did it ✔︎ ☺︎___________            ")
            }
            
        }
        
        
    }
}
var myList = List()
var task1 = Item(title: "Complite project " , day : "monday" , task : .pending  )
var task2 = Item(title: "Call friends ", day: "monday", task: .complite)
var task3 = Item(title: "Read two pages of any boook", day: "monday", task: .complite)
var task4 = Item(title: "Reward myself ", day: "friday", task: .pending)

myList.newListItem(task: task1)
myList.newListItem(task: task2)
myList.newListItem(task: task3)
myList.newListItem(task: task4)
myList.update(updateTask: Item(title: "Buy water", day: "sunday", task: .complite), index: 1)
myList.delete(index: 1)
myList.display()
myList.filter(filterItem: .complite)

