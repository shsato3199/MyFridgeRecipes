import SwiftUI

struct ContentView: View {
    @State private var searchResults: [String] = []  // 検索結果のデータ

    var body: some View {
        // NavigationStackでビューをラップ
        NavigationStack {
            VStack {
                // NavigationLinkの新しい使い方
                NavigationLink(value: searchResults) {
                    Text("検索結果を見る")  // ボタンとして使うこともできる
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(10)
                        .onAppear {
                            performSearch()
                        }
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
