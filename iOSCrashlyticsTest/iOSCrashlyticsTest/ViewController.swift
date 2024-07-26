//
//  ViewController.swift
//  iOSCrashlyticsTest
//
//  Created by Software Developer on 18/06/20.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit
import FirebaseCrashlytics


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
        
        let crashCreatebutton = UIButton(type: .roundedRect)
        crashCreatebutton.frame = CGRect(x: 150, y: 120, width: 100, height: 30)
        crashCreatebutton.setTitle("Create Crash", for: [])
        crashCreatebutton.addTarget(self, action: #selector(self.crashButtonTrigger(_:)), for: .touchUpInside)
        view.addSubview(crashCreatebutton)
        
        Crashlytics.crashlytics().log("View loaded")

        Crashlytics.crashlytics().setCustomValue(2020, forKey: "Year")
        Crashlytics.crashlytics().setCustomValue("Soham Paul", forKey: "Name")
        Crashlytics.crashlytics().setUserID("424801")

        let userInfo = [
          NSLocalizedDescriptionKey: NSLocalizedString("The request failed.", comment: ""),
          NSLocalizedFailureReasonErrorKey: NSLocalizedString("The response returned a 404.", comment: ""),
          NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString("Does this page exist?", comment:""),
          "ProductID": "712601",
          "UserID": "S Paul"
        ]
        let error = NSError(domain: NSURLErrorDomain, code: -1001, userInfo: userInfo)
        Crashlytics.crashlytics().record(error: error)
    }
    
    @IBAction func crashButtonTrigger(_ sender: AnyObject) {
        Crashlytics.crashlytics().log("Cause Crash button is triggered")
        fatalError()
    }
}
  
 
