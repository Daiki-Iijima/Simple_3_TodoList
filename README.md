# Simple_3_TodoList

# Table Viewの実装方法

## storyboard上での設定

1. 「Table View」「Table View Cell」を配置

2. 「Table View」の Outletsの「dataSource」「delegate」を「View Controller」に紐付け

画像は紐付けた結果

![s](/Users/daikiiijima/Desktop/TableViewリンク.png)

3. 「Table View Cell」の「Identifier」を設定(あとでコードから参照する名前)

## コードを設定する(ViewController.swift)
1. TableView関係の継承をする
```swift
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
```

2. メソッドを宣言する(この２つは宣言しないとエラーが出るはず)

```swift
// セルの個数を指定
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
}
    
//  セルの値を指定
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
}
```

3.　配列を作成して、戻り値を記述

```swift
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
```

## コード全文

```swift
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


```

# TableViewでカスタムセルを使用する

1. ファイルを生成
    - 「New File...」で「Cocoa Touch Class」を選択

    - 「Subclass of:」は適当に
    - 「Also create XIB file」のチェックを入れる

    - 「.swift」「.xib」が生成される
2. セルとコードを記述
    - 「.xib」ファイルにストーリボードと同じようにUIパーツを載せて、コードとの連携も同じようにする

3. 「ViewController.swift」内のTable View参照にCellを紐付け
```swift
override func viewDidLoad() {
        super.viewDidLoad()

        //  テーブルビューに1で作ったクラス名で登録し、cell名の名称を設定   
        tableView.register(
            UINib(nibName: "CustomCell", bundle: nil),  //  作成したカスタムセルのクラス名
            forCellReuseIdentifier:"reuseCell"          //  呼び出すときの名称を登録
            )
    }
```

4. セルを呼び出すには

```swift
    //  セルの値を指定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //  セルを取得
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell",for: indexPath) as! CustomCell
    
        return cell
    }
```

5. 全体像

```swift
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


```

# キーボードを閉じる

## ボタンを押したら閉じる
```swift
//  入力しているテキストフィールド
@IBOutlet weak var inputField: UITextField!

//  ボタン押下イベント
@IBAction func OnClickDoneButton(_ sender: Any) {
        inputField.endEditing(true) //  キーボードを閉じる
    }
```
