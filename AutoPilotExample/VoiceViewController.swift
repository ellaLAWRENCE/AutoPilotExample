//
//  VoiceViewController.swift
//  AutoPilotExample
//
//  Created by Noah Scher (student LM) on 5/6/20.
//  Copyright © 2020 Ella Lawrence (student LM). All rights reserved.
//

import UIKit
import ApiAI
import AVFoundation

class VoiceViewController: UIViewController {

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

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
