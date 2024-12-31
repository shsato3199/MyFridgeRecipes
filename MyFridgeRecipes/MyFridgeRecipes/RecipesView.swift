//
//  Untitled.swift
//  MyFridgeRecipes
//
//  Created by 佐藤翔馬 on 2025/01/01.
//

import SwiftUI


struct RecipesView: View {
    var results: [String]  // 引数として渡された検索結果
    
    var body: some View {
            Section{
                List(results, id: \.self) { recipe in
                    Text(recipe)  // 各レシピ名（文字列）を表示
                }
            } header: {
                Text("レシピ一覧")
            }
        .navigationTitle("レシピ検索結果")
    }
}
