import SwiftUI
import AltSourceKit
import CoreData
import NimbleViews

struct StoreHomeView: View {
    @StateObject var viewModel = SourcesViewModel.shared
    @State private var _selectedApp: ASRepository.App?

    var repository: ASRepository

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                if let news = repository.news, !news.isEmpty {
                    SourceNewsView(news: news)
                }

                NBGrid {
                    ForEach(repository.apps, id: \.id) { app in
                        Button {
                            _selectedApp = app
                        } label: {
                            StoreAppCardView(app: app)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
        .sheet(item: $_selectedApp) { app in
            StoreAppInfoView(app: app)
        }
    }
}
