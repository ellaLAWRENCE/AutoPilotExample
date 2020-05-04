//
//  CalandarViewController.swift
//  AutoPilotExample
//
//  Created by Ella Lawrence (student LM) on 4/2/20.
//  Copyright © 2020 Ella Lawrence (student LM). All rights reserved.
//

import UIKit
enum MyTheme {
    case light
    case dark
}


class CalandarViewController: UIViewController {
    

    var theme = MyTheme.light
    @IBOutlet var addButton: UIButton!
    var day: Date = Date()
  
    
    override func viewDidLoad() {
                super.viewDidLoad()
                self.title = "My Calender"
                self.navigationController?.navigationBar.isTranslucent=false
                self.view.backgroundColor=Style.bgColor
        print("hi")
        change()
                view.addSubview(calenderView)
                calenderView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive=true
                calenderView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive=true
                calenderView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive=true
                calenderView.heightAnchor.constraint(equalToConstant: 365).isActive=true
        
        
                let rightBarBtn = UIBarButtonItem(title: "Light", style: .plain, target: self, action: #selector(rightBarBtnAction))
                self.navigationItem.rightBarButtonItem = rightBarBtn
        
        
        
        
        
        
        
        
    }
    
    func change(){
        print("here")
        performSegue(withIdentifier: "goTable", sender: nil)
        
    }
    
    @IBAction func changeController(_ sender: UIButton) {
      //  performSegue(withIdentifier: "goTable", sender: self)
    }
    
    

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        calenderView.myCollectionView.collectionViewLayout.invalidateLayout()
    }



    @objc func rightBarBtnAction(sender: UIBarButtonItem) {
        if theme == .dark {
            sender.title = "Dark"
            theme = .light
            Style.themeLight()
        } else {
            sender.title = "Light"
            theme = .dark
            Style.themeDark()
        }
        self.view.backgroundColor=Style.bgColor
        calenderView.changeTheme()
    }

   let calenderView: CalenderView = {
       let v=CalenderView(theme: MyTheme.dark)
       v.translatesAutoresizingMaskIntoConstraints=false
       return v
   }()

}
