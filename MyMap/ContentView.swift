//
//  ContentView.swift
//  MyMap
//
//  Created by 塩見昌士 on 2025/08/26.
//

import SwiftUI

struct ContentView: View {
    // 入力中の文字列を保持する状態変数
    @State var inputText: String = ""
    @State var displaySearchKey: String = "東京駅"
    var body: some View {
        // 垂直にレイアウト(縦方向にレイアウト)
        VStack {
            // テキストフィールド(文字入力)
            TextField("キーワード", text: $inputText, prompt:
                Text("キーワードを入力してください"))
                // 入力が完了された時
                .onSubmit {
                  // 入力が完了したので検索キーワードを設定する
                  displaySearchKey = inputText
                }
            // マップを表示。
            MapView(searchKey: displaySearchKey)
        }
    }
}

#Preview {
    ContentView()
}
