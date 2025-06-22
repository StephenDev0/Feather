import SwiftUI
import AltSourceKit
import NimbleViews
import NukeUI

struct StoreAppInfoView: View {
    @Environment(\.dismiss) private var dismiss
    var app: ASRepository.App

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack(alignment: .top, spacing: 16) {
                        if let iconURL = app.iconURL {
                            LazyImage(url: iconURL) { state in
                                if let image = state.image {
                                    image.resizable()
                                }
                            }
                            .frame(width: 80, height: 80)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        }

                        VStack(alignment: .leading, spacing: 4) {
                            Text(app.currentName)
                                .font(.title.bold())
                            if let subtitle = app.subtitle ?? app.localizedDescription {
                                Text(subtitle)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                        }
                        Spacer()
                        if let url = app.currentDownloadUrl {
                            Button {
                                _ = DownloadManager.shared.startDownload(from: url, id: app.currentUniqueId)
                                dismiss()
                            } label: {
                                NBButton("Get", style: .text)
                            }
                        }
                    }

                    if let description = app.description ?? app.localizedDescription {
                        Text(description)
                            .font(.body)
                    }

                    if let screenshots = app.screenshotURLs, !screenshots.isEmpty {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 12) {
                                ForEach(screenshots, id: \.self) { url in
                                    LazyImage(url: url) { state in
                                        if let image = state.image {
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                        }
                                    }
                                    .frame(width: 240, height: 480)
                                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle(app.currentName)
            .toolbar { NBToolbarButton(role: .close) }
        }
    }
}
