//
//  ViewController.swift
//  LocalNotificationProject
//
//  Created by yonekan on 2019/11/26.
//  Copyright © 2019 yonekan. All rights reserved.
//

import UIKit
// 通知に関する部品をほ読み込む
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet weak var textFieldForTitle: UITextField!
    
    @IBOutlet weak var textFieldForContent: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didClickButton(_ sender: UIButton) {
        // 通知の作成
        let notificationContent = UNMutableNotificationContent()
        // 通知のタイトルに画面で入力されたタイトルを設定
        notificationContent.title = textFieldForTitle.text!
        // 通知の本文に画面で入力された本文を設定
        notificationContent.body = textFieldForContent.text!
        // 通知音にデフォルト音声を設定
        notificationContent.sound = .default
        
        // 通知時間の作成
        var notificationTime = DateComponents()
        let calendar = Calendar.current  // 現在時間を取得
        // 時間の設定
        notificationTime.hour = calendar.component(.hour, from: datePicker.date)
        notificationTime.minute = calendar.component(.minute, from: datePicker.date)
         
        // 通知に通知時間を設定
        let trigger = UNCalendarNotificationTrigger(dateMatching: notificationTime, repeats: false)
        
        let request = UNNotificationRequest(identifier: "uuid", content: notificationContent, trigger: trigger)
        
        // 通知を登録
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    
}

