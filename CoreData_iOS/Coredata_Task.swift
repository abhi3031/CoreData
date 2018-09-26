 

import UIKit
import CoreData

@objc protocol CoredataResultDelegate
{
    @objc optional func getdata(add:String,name:String,email:String);
}
class Coredata_Task: NSObject {
     var delgate : CoredataResultDelegate?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;
    
    func Insert(dataobj:InsertDataModel){
        
        let newrecord = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context);
        newrecord.setValue(dataobj.address!, forKey: "add");
        newrecord.setValue(dataobj.email!, forKey: "email");
        newrecord.setValue(dataobj.name!, forKey: "name");
        
        print(dataobj.address!);
        print(dataobj.email!);
        print(dataobj.name!);
        do {
            try context.save();
         } catch  { }
        }

    func Select(selctobj:SelectDataModel) {
        
        let  entydec = NSEntityDescription.entity(forEntityName: "Employee", in: context);
        let request = NSFetchRequest<NSFetchRequestResult>(entityName:"Employee");
        request.entity = entydec;
        let predi = NSPredicate(format: "(add =%@)", selctobj.address!);
        request.predicate = predi;
        do {
            let result = try context.fetch(request);
            
            if result.count > 0
            {
                let  manage = result[0] as! NSManagedObject;
                let add1 = manage.value(forKey:"add") as? String;
                let name1 = manage.value(forKey:"name") as? String;
                let email1 = manage.value(forKey:"email") as? String;
                self.delgate?.getdata!(add:add1!, name: name1!, email:email1!);
                
        }
            else{ print("No Data Found"); }
        }
         catch  { }
        }
    
    func update(dataobj:InsertDataModel) {
        let  entydec = NSEntityDescription.entity(forEntityName: "Employee", in: context);
        let request = NSFetchRequest<NSFetchRequestResult>(entityName:"Employee");
        request.entity = entydec;
        let predi = NSPredicate(format: "(add =%@)", dataobj.address!);
        request.predicate = predi;
        do {
            let result = try context.fetch(request);
            
            if result.count > 0
            {
                let  manage = result[0] as! NSManagedObject;
                manage.setValue(dataobj.address!, forKey:"add");
                manage.setValue(dataobj.name!, forKey:"name");
                manage.setValue(dataobj.email!, forKey:"email");
                do {
                    try context.save();
                    }  catch  { }
                }
            else{ print("No Data Found"); }
        }
        catch  { }
        
    }
    func delete(selctobj:SelectDataModel){
        let  entydec = NSEntityDescription.entity(forEntityName: "Employee", in: context);
        let request = NSFetchRequest<NSFetchRequestResult>(entityName:"Employee");
        request.entity = entydec;
        let predi = NSPredicate(format: "(add =%@)", selctobj.address!);
        request.predicate = predi;
        do {
            let result = try context.fetch(request);
            
            if result.count > 0
            {
                let  manage = result[0] as! NSManagedObject;
                context.delete(manage);
                
            }
            else{ print("No Data Found"); }
        }
        catch  {}
        
        
    }
}
