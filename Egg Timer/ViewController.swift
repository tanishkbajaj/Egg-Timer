//
//  ViewController.swift
//  Egg Timer
//
//  Created by IMCS2 on 7/18/19.
//  Copyright © 2019 Tanishk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
   
   
    
    var timer = Timer()
    var fraction = 0
    var isStart = false
    var isReset = false
    
    @IBOutlet weak var Toolbar: UIToolbar!
    
    @IBAction func startButton(_ sender: UIBarButtonItem) {
        
        if(isStart){
            stop()
          
            
        }else {
            start()
          
        }
        
        
    }
    
    func start(){
        
        var item = self.Toolbar.items
        
        item![2] = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.pause, target: self, action: #selector(ViewController.startButton(_:)))
       
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        isStart = true
        isReset = false
        
        self.Toolbar.setItems(item, animated: true)
        
        
        
    }

    func stop(){
        var item = self.Toolbar.items
        
        item![2] = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.play, target: self, action: #selector(ViewController.startButton(_:)))
       
        timer.invalidate()
        isStart = false
        
        self.Toolbar.setItems(item, animated: true)
    }
   
    

    
    
    @objc func UpdateTimer() {
        fraction = fraction + 1
        label.text = String(fraction)
    }
    
    
    @IBAction func resetButton(_ sender: Any) {
        var item = self.Toolbar.items
        
        item![2] = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.play, target: self, action: #selector(ViewController.startButton(_:)))
        
        isStart = false
        timer.invalidate()
        fraction = 0
        label.text = String(fraction)
       
        self.Toolbar.setItems(item, animated: true)
    }
    
    @IBAction func addTenMins(_ sender: Any) {
        fraction = fraction + 10
        label.text = String(fraction)
    }
    
    
    @IBAction func subtractTenMins(_ sender: Any) {
        if(fraction < 10){
            fraction = 0
            label.text = String(fraction)
        }
        else{
        fraction = fraction - 10
        label.text = String(fraction)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    
}


