//
//  ViewController.swift
//  Simple_3_TodoList
//
//  Created by 飯島大樹 on 2020/02/15.
//  Copyright © 2020 Daiki Iijima. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var cellCount = 0
    // セルの個数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount
    }
    
    //  セルの値を指定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //  セルを取得
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell",for: indexPath) as! CustomCell
    
        return cell
    }
    
    @IBAction func OnClickAddButton(_ sender: Any) {
        cellCount += 1
        //  UIの再描画
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.register(UINib(nibName: "CustomCell", bundle: nil),forCellReuseIdentifier:"reuseCell")
    }


}

