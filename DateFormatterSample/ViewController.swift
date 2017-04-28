//
//  ViewController.swift
//  DateFormatterSample
//
//  Created by katoj on 2017/04/28.
//  Copyright © 2017年 jun.kato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 以下、Xcode 8.3.2、iOS 10.3.1実機での検証結果
//        // 規定のスタイル
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = .medium
//        dateFormatter.timeStyle = .none
//        //dateFormatter.locale = Locale(identifier: "en_US_POSIX")
//
//        let formattedDateString = dateFormatter.string(from: Date())
//        print(formattedDateString)

        // Localeがja_JP、暦法が西暦（グレゴリオ暦）の場合
        // 2017/04/28

        // Localeがja_JP、暦法が和暦の場合
        // H29/04/28
        // ※Localeがja_JP、暦法が和暦の場合でもロケールにen_US_POSIXを指定した場合は「Apr 28, 2017」になる

        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm"
        //df.locale = Locale(identifier: "en_US_POSIX")
        let dateString = df.string(from: Date())
        print(dateString)

        // Localeがデフォルト（ja_JP@calendar=japanese）、暦法が和暦、24時間表示OFFの場合
        // 0029-04-28 14午後2:16

        // Localeがja_JP(fixed)、暦法が和暦、24時間表示OFFの場合
        // 2017-04-28 14:16

        // Localeがen_US_POSIX、暦法が和暦、24時間表示OFFの場合
        // 2017-04-28 14:17

        // 暦法が和暦、24時間表示OFFの場合、ロケールを設定しないと、「ja_JP@calendar=japanese」になる
        // 暦法が西暦、24時間表示OFFの場合、ロケールを設定しないと、「ja_JP」になるがkindがcurrentのため、「2017-04-28 14午後2:20」のような表示になってしまう。
        //            ▿ Optional<Locale>
        //            ▿ some : ja_JP (current)
        //              - identifier : "ja_JP"
        //              - kind : "current"

        // ロケールを明示的に"ja_JP"に設定した場合
        //            ▿ Optional<Locale>
        //            ▿ some : ja_JP (fixed)
        //              - identifier : "ja_JP"
        //              - kind : "fixed"
    }
}

