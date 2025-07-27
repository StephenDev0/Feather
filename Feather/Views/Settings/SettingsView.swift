//
//  SettingsView.swift
//  Feather
//
//  Created by samara on 10.04.2025.
//

import SwiftUI
import NimbleViews
import UIKit
import Darwin
import IDeviceSwift

// MARK: - View
struct SettingsView: View {
    @State private var _currentIcon: String? = UIApplication.shared.alternateIconName
    
    private let _donationsUrl = "https://github.com/sponsors/khcrysalis"
    private let _githubUrl = "https://github.com/khcrysalis/Feather"
    
    // MARK: Body
    var body: some View {
        NBNavigationView(.localized("Settings")) {
            Form {
                NavigationLink(destination: CertificatesView()) {
                    Label(.localized("Developer Certificates"), systemImage: "lock.document")
                }
                NavigationLink(destination: InstallationView()) {
                    Label(.localized("Device Connection"), systemImage: "app.connected.to.app.below.fill")
                }
            }
        }
    }
}

// MARK: - View extension
extension SettingsView {
    @ViewBuilder
    private func _feedback() -> some View {
        Section {
            NavigationLink(destination: AboutView()) {
                Label {
                    Text(verbatim: .localized("About %@", arguments: Bundle.main.name))
                } icon: {
                    Image(uiImage: AppIconView.altImage(_currentIcon))
                        .appIconStyle(size: 23)
                }
            }
            
            Button(.localized("GitHub Repository"), systemImage: "safari") {
                UIApplication.open(_githubUrl)
            }
        } footer: {
            Text(.localized("If any issues occur within the app please report it via the GitHub repository. When submitting an issue, make sure to submit detailed information."))
        }
    }
    
    @ViewBuilder
    private func _directories() -> some View {
        NBSection(.localized("Misc")) {
            Button(.localized("Open Documents"), systemImage: "folder") {
                UIApplication.open(URL.documentsDirectory.toSharedDocumentsURL()!)
            }
            Button(.localized("Open Archives"), systemImage: "folder") {
                UIApplication.open(FileManager.default.archives.toSharedDocumentsURL()!)
            }
            Button(.localized("Open Certificates"), systemImage: "folder") {
                UIApplication.open(FileManager.default.certificates.toSharedDocumentsURL()!)
            }
        } footer: {
            Text(.localized("All of the apps files are contained in the documents directory, here are some quick links to these."))
        }
    }    
}
