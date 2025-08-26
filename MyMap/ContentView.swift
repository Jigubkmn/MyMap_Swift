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
    // マップ種類 最初は標準から
    @State var displayMapType: MapType = .hybrid
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
                .padding()
            // 奥から手前方向にレイアウト(右下基準で配置する)
            ZStack(alignment: .bottomTrailing) {
                // マップを表示
                MapView(searchKey: displaySearchKey, mapType: displayMapType)

                // マップ種類切り替えボタン
                Button {
                    if displayMapType == .standard {
                        displayMapType = .satellite
                    } else if displayMapType == .standard {
                        displayMapType = .hybrid
                    } else {
                        displayMapType = .standard
                    }
                } label: {
                    Image(systemName: "map")
                        .resizable()
                        .frame(width: 50, height: 50)

                }
                .padding(.trailing, 20.0)
                .padding(.bottom, 30.0)
            }
        }
    }
}

#Preview {
    ContentView()
}
