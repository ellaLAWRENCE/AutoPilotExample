//
//  ViewController.swift
//  AutoPilotExample
//
//  Created by Ella Lawrence (student LM) on 2/26/20.
//  Copyright © 2020 Ella Lawrence (student LM). All rights reserved.
//

import UIKit
import FirebaseAuth
import ApiAI
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var messageField: UITextField!
    @IBOutlet weak var botResponse: UILabel!
    @IBAction func sendMessage(_ sender: Any) {
        let request = ApiAI.shared()?.textRequest()
        
        if let text = self.messageField.text, text != "" {
            request?.query = text
        }
        else {
            return
        }
        
        request?.setMappedCompletionBlockSuccess({ (request, response) in
            let response = response as! AIResponse
            if let textResponse = response.result.fulfillment.speech {
                self.speechAndText(text: textResponse)
            }
        }, failure: { (request, error) in
            print(error!)
        })
        
        ApiAI.shared()?.enqueue(request)
        messageField.text = ""
    }
    
    let speechSynthesizer = AVSpeechSynthesizer()
    
    func speechAndText(text: String) {
        let speechUtterance = AVSpeechUtterance(string: text)
        speechSynthesizer.speak(speechUtterance)
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.botResponse.text = text
        }, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello")

    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        if let _ = Auth.auth().currentUser{
//            self.performSegue(withIdentifier: "toHomeScreen", sender: self)
//        }
        
    }

}
