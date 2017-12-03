//
//  ViewController.swift
//  SwiftGCDDemo
//
//  Created by 高鑫 on 2017/12/3.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var previewLabel: UILabel!
    @IBOutlet weak var previewLabelLCM: UILabel!
    @IBOutlet weak var oneTF: UITextField!
    @IBOutlet weak var twoTF: UITextField!
    @IBAction func btn(_ sender: UIButton) {
        calculate()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func calculate() {
        if oneTF.text != "" && twoTF.text != "" {
            let result = gcd_lcm(num1: Int(oneTF.text!)!, num2: Int(twoTF.text!)!)
            self.previewLabel.text = String(result[0])
            self.previewLabelLCM.text = String(result[1])
        } else {
            let alertController = UIAlertController(title: "请将数字填写完整", message: nil, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "好", style: .default, handler: nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
        }
    }

    func gcd_lcm(num1:Int, num2:Int) -> [Int] {
        var gcd : Int!
        let numCount = num1 > num2 ? num2 : num1
        for i in 1...numCount {
            if num1 % i == 0 && num2 % i == 0 {
                gcd = i
            }
        }
        let lcm = (num1 * num2) / gcd
        return [gcd, lcm]
    }


}

