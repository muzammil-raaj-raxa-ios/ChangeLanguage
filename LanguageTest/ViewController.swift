//
//  ViewController.swift
//  LanguageTest
//
//  Created by Mag isb-10 on 09/07/2024.
//

import UIKit

let localizeUserDefaultsKey = "localizeUserDefaultsKey"
var localizeDefaultLang = "en"

class ViewController: UIViewController {
  
  @IBOutlet weak var txtLbl: UILabel!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    localizeDefaultLang = UserDefaults.standard.string(forKey: localizeUserDefaultsKey) ?? "en"
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    refreshLang()
  }
  
  func refreshLang() {
    txtLbl.text = "message".translatedString()
  }
  
  @IBAction func englishBtn(_ sender: Any) {
    localizeDefaultLang = "en"
    UserDefaults.standard.setValue(localizeDefaultLang, forKey: localizeUserDefaultsKey)
    refreshLang()
  }
  @IBAction func urduBtn(_ sender: Any) {
    localizeDefaultLang = "ur"
    UserDefaults.standard.setValue(localizeDefaultLang, forKey: localizeUserDefaultsKey)
    refreshLang()
  }
  
}

extension String {
  func translatedString() -> String {
    if let path = Bundle.main.path(forResource: localizeDefaultLang, ofType: "lproj"), let bundle = Bundle(path: path) {
      return NSLocalizedString(self, bundle: bundle, comment: "")
    }
    return ""
  }
}
