# DateFormatterSample
DateFormatterのLocaleに関して検証したリポジトリです。

## 検証環境
- macOS Sierra バージョン 10.12.4
- Xcode 8.3.2
- iOS 10.3.1実機

## 検証内容

### 事前知識

- 暦法が和暦の場合、ロケールは明示的に設定しない場合「ja_JP@calendar=japanese (current)」になる。

```
▿ Optional<Locale>
  ▿ some : ja_JP@calendar=japanese (current)
    - identifier : "ja_JP@calendar=japanese"
    - kind : "current"
```

- 暦法が西暦の場合、ロケールは明示的に設定しない場合「ja_JP (current)」になる。

```
▿ Optional<Locale>
▿ some : ja_JP (current)
  - identifier : "ja_JP"
  - kind : "current"
```

- ロケールを明示的に"ja_JP"に設定した場合は以下のようにja_JP (fixed)になる。
```
▿ Optional<Locale>
▿ some : ja_JP (fixed)
  - identifier : "ja_JP
  - kind : "fixed"
```

### DateFormatterで規定のスタイルを利用した場合

``` swift
// 規定のスタイル
let dateFormatter = DateFormatter()
dateFormatter.dateStyle = .medium
dateFormatter.timeStyle = .none
let formattedDateString = dateFormatter.string(from: Date())
print(formattedDateString)

// Localeがja_JP (current)、暦法が西暦の場合
// 2017/04/28

// Localeがja_JP@calendar=japanese (current)、暦法が和暦の場合
// H29/04/28
// ※暦法が和暦の場合でもロケールに"en_US_POSIX"を指定した場合は「Apr 28, 2017」になる

// Localeがja_JP (fixed)、暦法が和暦の場合
// 2017/04/28

```

### DateFormatterで固定のカスタムフォーマットを利用した場合

``` swift
let df = DateFormatter()
df.dateFormat = "yyyy-MM-dd HH:mm"
//df.locale = Locale(identifier: "en_US_POSIX")
let dateString = df.string(from: Date())
print(dateString)

// Localeがja_JP@calendar=japanese (current)、暦法が和暦、24時間表示OFFの場合
// 0029-04-28 14午後2:16

// Localeがja_JP (current)、暦法が西暦、24時間表示OFFの場合
// 2017-04-28 14午後2:20

// Localeがja_JP(fixed)、暦法が和暦、24時間表示OFFの場合
// 2017-04-28 14:16

// Localeがen_US_POSIX(fixed)、暦法が和暦、24時間表示OFFの場合
// 2017-04-28 14:17
```

## まとめ
DateFormatterで固定のカスタムフォーマットを利用する場合は、暦法や24時間表示のON/OFFの設定の影響を受けないように`locale`に`Locale(identifier: "en_US_POSIX")` もしくは `Locale(identifier: "ja_JP")`を設定するようにしましょう。

