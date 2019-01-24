import UIKit
import Firebase

class ComposeViewController: UIViewController {
    var ref: DatabaseReference?
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        if textView.text != "" {
            self.ref?.child("post").childByAutoId().setValue(textView.text)
            self.dismiss(animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "alert Massage", message: "please enter the text", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "Try-Again", style: .cancel, handler: nil)
            alert.addAction(cancel)
            self.present(alert, animated: true, completion: nil)
        }
    }
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
