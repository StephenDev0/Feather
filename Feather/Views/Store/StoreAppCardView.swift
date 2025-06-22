import SwiftUI
import AltSourceKit
import NimbleViews
import NukeUI

struct StoreAppCardView: View {
    var app: ASRepository.App
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let screenshot = app.screenshotURLs?.first {
                LazyImage(url: screenshot) { state in
                    if let image = state.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                }
                .frame(height: 220)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            }

            HStack(alignment: .top, spacing: 12) {
                if let iconURL = app.iconURL {
                    LazyImage(url: iconURL) { state in
                        if let image = state.image {
                            image.appIconStyle(size: 60)
                        }
                    }
                } else {
                    Image("App_Unknown")
                        .appIconStyle(size: 60)
                }

                VStack(alignment: .leading, spacing: 2) {
                    Text(app.currentName)
                        .font(.headline)
                    if let subtitle = app.subtitle ?? app.localizedDescription {
                        Text(subtitle)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .lineLimit(2)
                    }
                }
                Spacer()
                if let url = app.currentDownloadUrl {
                    Button {
                        _ = DownloadManager.shared.startDownload(from: url, id: app.currentUniqueId)
                    } label: {
                        NBButton("Get", style: .text)
                    }
                }
            }
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}
