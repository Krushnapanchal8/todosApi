//
//  ViewController.swift
//  todosApi
//
//  Created by Mac on 01/12/22.
//

import UIKit

class ViewController: UIViewController {

    var todoArray: [Todos] = []
    
    @IBOutlet weak var todosTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        parseTodos()
    }
    
    func parseTodos() {
        let str = "https://jsonplaceholder.typicode.com/todos"
        let url = URL(string: str)
        
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if error == nil {
                do {
                    self.todoArray =  try JSONDecoder().decode([Todos].self, from: data!)
                    DispatchQueue.main.async {
                        self.todosTable.reloadData()
                    }
                } catch {
                    print("Something went wrong!")
                }
            }
        }.resume()
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TodosTableViewCell
        let todos = todoArray[indexPath.row]
        cell.userLabel.text = "UserId : \(todos.userId)"
        cell.idLabel.text = "Id : \(todos.id)"
        cell.titleLabel.text = "Title : \(todos.title)"
        cell.boolLabel.text = "Completed : \(todos.completed)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280.0
    }
}

