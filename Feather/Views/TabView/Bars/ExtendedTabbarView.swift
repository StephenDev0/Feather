//
//  TabbarController.swift
//  feather
//
//  Created by samara on 5/17/24.
//  Copyright (c) 2024 Samara M (khcrysalis)
//

import SwiftUI
import NukeUI

@available(iOS 18, *)
struct ExtendedTabbarView: View {
	@Environment(\.horizontalSizeClass) var horizontalSizeClass
	@AppStorage("Feather.tabCustomization") var customization = TabViewCustomization()
        @StateObject var viewModel = SourcesViewModel.shared
		
	var body: some View {
		TabView {
			ForEach(TabEnum.defaultTabs, id: \.hashValue) { tab in
				Tab(tab.title, systemImage: tab.icon) {
					TabEnum.view(for: tab)
				}
			}
			
                        ForEach(TabEnum.customizableTabs, id: \.hashValue) { tab in
                                Tab(tab.title, systemImage: tab.icon) {
                                        TabEnum.view(for: tab)
                                }
                                .customizationID("tab.\(tab.rawValue)")
                                .defaultVisibility(.hidden, for: .tabBar)
                                .customizationBehavior(.reorderable, for: .tabBar, .sidebar)
                                .hidden(horizontalSizeClass == .compact)
                        }
                }
                .tabViewStyle(.sidebarAdaptable)
                .tabViewCustomization($customization)
                
        }
	
	@ViewBuilder
	private func _icon(_ title: String, iconUrl: URL?) -> some View {
		Label {
			Text(title)
		} icon: {
			if let iconURL = iconUrl {
				LazyImage(url: iconURL) { state in
					if let image = state.image {
						image
					} else {
						standardIcon
					}
				}
				.processors([.resize(width: 14), .circle()])
			} else {
				standardIcon
			}
		}
	}

	
	var standardIcon: some View {
		Image(systemName: "app.dashed")
	}
}

