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
                }
                .simultaneousGesture(TapGesture().onEnded {
                    // 将来的に楽天レシピAPIを呼ぶメソッドに置き換え予定
                    performSearch()
                })
                
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
            //楽天APIを使ってると
            //画面の余白を入れるビュー。
            //ここではボタン群とクレジット表示の間に縦方向の空きを作って、下に寄せるために置いています。
            Spacer()
            // "Supported by Rakuten Developers" がユーザーに表示される文字列。
            // destination には飛び先URLを指定。! は強制アンラップで「このURLは必ずある」と宣言。
            Link("Supported by Rakuten Developers", destination: URL(string: "https://developers.rakuten.com/")!)
                //文字サイズを小さめの脚注（footnote）にする。ガイドラインの「目立ちすぎず、でも見える」感じ
                .font(.footnote)
                //色を「セカンダリ」（グレー寄りの控えめな色）にする。本文より目立たなくする工夫です。
                .foregroundStyle(.secondary)
                //上に20ポイント分の余白を空ける。ボタン群やタイトルと間隔をあけるため。
                .padding(.top, 20)
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
