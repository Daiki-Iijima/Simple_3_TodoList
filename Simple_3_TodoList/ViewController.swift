//
//  ViewController.swift
//  Simple_3_TodoList
//
//  Created by 飯島大樹 on 2020/02/15.
//  Copyright © 2020 Daiki Iijima. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let TODO = ["A","B","C"]
    
    // セルの個数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TODO.count
    }
    
    //  セルの値を指定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //  セルを取得
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
    
        //  セルに表示する値を設定
        cell.textLabel!.text = TODO[indexPath.row]
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

