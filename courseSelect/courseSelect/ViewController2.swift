//
//  ViewController2.swift
//  courseSelect
//
//  Created by 財部圭太 on 2018/11/20.
//  Copyright © 2018年 財部圭太. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
	
	var Scene:Int = 0
	
	@IBOutlet weak var select: UILabel!
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
		print(Scene)
		select.text = String(Scene)
		
		
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
