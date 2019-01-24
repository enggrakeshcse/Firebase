import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var posts = [String]()
    var ref: DatabaseReference?
    var databasehandle : DatabaseHandle?
   // var posts = ["msg1","msg2","msg3"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.isEditing = true
        
        ref = Database.database().reference()
        databasehandle = ref?.child("post").observe(.childAdded, with: { (Snapshot) in
            let post = Snapshot.value as? String
            if let actualPost = post {
                self.posts.append(actualPost)
                self.tableView.reloadData()
            }
        })

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell")
        cell?.textLabel?.text = posts[indexPath.row]
        return cell!
    }
}
