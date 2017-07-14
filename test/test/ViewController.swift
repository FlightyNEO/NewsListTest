 import UIKit

class ViewController: UIViewController {
    
    let APPLICATION_ID = "7F8AC5BF-6E47-E00D-FFC6-B77E03D08D00"
    let API_KEY = "1D90D4CE-FE28-EB9D-FFF5-60D30F942300"
    let SERVER_URL = "https://api.backendless.com"
    let backendless = Backendless.sharedInstance()!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        backendless.hostURL = SERVER_URL
        backendless.initApp(APPLICATION_ID, apiKey: API_KEY)
        
        // Saving test object in the test table
        let testObject = ["foo" : "bar"];
        let dataStore = backendless.data.ofTable("NewsTable")
        dataStore?.save(testObject,
                        response: {
                            (result) -> () in
                            print("Object is saved in Backendless. Please check in the console.")
        },
                        error: {
                            (fault : Fault?) -> () in
                            print("Server reported an error: \(String(describing: fault))")
        })
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
        
