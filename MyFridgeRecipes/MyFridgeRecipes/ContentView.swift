import SwiftUI

struct ContentView: View {
    @State private var searchResults: [String] = []  // 検索結果のデータ
    @State private var path = NavigationPath()
    
    var body: some View {
        // NavigationStackでビューをラップ
        NavigationStack(path: $path) {
            VStack {
                NavigationLink(destination: RecipesView(path: $path, results:searchResults)) {
                    Text("登録済み食材でレシピ検索")  // ボタンとして使うこともできる
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(10)
                        .onAppear {
                            //ゆくゆくは楽天レシピAPIを呼ぶメソッドを呼ぶことにしたい。
                            performSearch()
                        }
                }
                .navigationDestination(for: [String].self) { results in
                    RecipesView(path: $path, results: results)
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
        // ここで実際に検索を行う。将来的に楽天レシピAPIを叩いてその結果を返すような処理にしたい。
        // 例として、静的な検索結果を設定
        searchResults = ["レシピ1", "レシピ2", "レシピ3"]
    }
}

#Preview {
    ContentView()
}
