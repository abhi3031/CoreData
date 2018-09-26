

import UIKit

class ViewController: UIViewController,CoredataResultDelegate{

    @IBOutlet weak var txt_email: UITextField!
    @IBOutlet weak var txt_add: UITextField!
    
   
    
    @IBOutlet weak var txt_name: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      }

    @IBAction func btn_insert(_ sender: Any) {
        let emp = InsertDataModel(address: txt_add.text!, name: txt_name.text!, email: txt_email.text!);
        let obj = Coredata_Task();
        obj.Insert(dataobj: emp);
        txt_add.text = "";
        txt_email.text = "";
        txt_name.text = "" ;
        txt_add.becomeFirstResponder();
       
    }
    @IBAction func btn_select(_ sender: Any) {
        let emp = SelectDataModel(address: txt_add.text!);
        let obj = Coredata_Task();
         obj.delgate = self;
        obj.Select(selctobj: emp);
       
        
    }
    
    func getdata(add: String, name: String, email: String) {
        
           self.txt_add.text = add;
             self.txt_email.text = email;
            self.txt_name.text = name;
    
       
        
    }
    @IBAction func btn_delete(_ sender: Any) {
    
       
    }
    @IBAction func btn_update(_ sender: Any) {
        
    }


}

