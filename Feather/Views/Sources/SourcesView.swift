//
//  StoreView.swift
//  Feather
//
//  Created by samara on 10.04.2025.
//

import CoreData
import AltSourceKit
import SwiftUI
import NimbleViews

// MARK: - View
struct StoreView: View {
	@Environment(\.horizontalSizeClass) private var horizontalSizeClass
	
	@AppStorage("Feather.shouldStar") private var _shouldStar: Int = 0
	
        @StateObject var viewModel = SourcesViewModel.shared
	
        @FetchRequest(
                entity: AltSource.entity(),
                sortDescriptors: [NSSortDescriptor(keyPath: \AltSource.name, ascending: true)],
                animation: .snappy
        ) private var _sources: FetchedResults<AltSource>
	
	// MARK: Body
        var body: some View {
                NBNavigationView(.localized("Store")) {
                        if let source = _sources.first,
                           let repo = viewModel.sources[source] {
                                StoreHomeView(repository: repo)
                        } else {
                                ProgressView()
                        }
                }
                .task(id: Array(_sources)) {
                        await viewModel.fetchSources(_sources)
                }
                .onAppear {
			guard _shouldStar < 6 else { return }; _shouldStar += 1
			guard _shouldStar == 6 else { return }
			
			let github = UIAlertAction(title: "GitHub", style: .default) { _ in
				UIApplication.open("https://github.com/khcrysalis/Feather")
			}
			
			let cancel = UIAlertAction(title: .localized("Dismiss"), style: .cancel)
			
			UIAlertController.showAlert(
				title: .localized("Enjoying %@?", arguments: Bundle.main.name),
				message: .localized("Go to our GitHub and give us a star!"),
				actions: [github, cancel]
			)
		}
	}
}
