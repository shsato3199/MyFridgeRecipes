//
//  ContentView.swift
//  MyFridgeRecipes
//
//  Created by 佐藤翔馬 on 2025/01/01.
//

import SwiftUI

struct ContentView: View {
    @State private var searchResults: [String] = []  // 検索結果のデータ
    @State private var isLinkActive: Bool = false     // 遷移の制御用フラグ
    
    var body: some View {
        // NavigationStackでビューをラップ
        NavigationStack {
            VStack {
                Button("検索") {
                    // 検索アクションを実行
                    performSearch()
                    isLinkActive = true  // 検索後に遷移をトリガー
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
                // 検索結果が表示されるビューに遷移
                NavigationLink(
                    value: searchResults,
                    isActive: $isLinkActive){
                    EmptyView()  // 遷移を発生させるためにはリンクを表示する必要がある
                }
                .navigationDestination(for: [String].self) { results in
                    // 渡されたsearchResultsをRecipesViewに渡す
                    RecipesView(results: results)
                }
                NavigationLink("食材登録", destination: RecipeFoodRegisterView())
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                
                NavigationLink("食材削除", destination: RecipeFoodDeleteView())
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .navigationTitle("トップ画面")
        }
    }
    // 検索アクション
    func performSearch() {
        // ここで実際に検索を行う
        // 例として、静的な検索結果を設定
        searchResults = ["レシピ1", "レシピ2", "レシピ3"]
    }
}

#Preview {
    ContentView()
}
