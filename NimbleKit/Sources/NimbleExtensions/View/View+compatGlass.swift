//
//  View+compatGlass.swift
//  NimbleKit
//
//  Created by Codex on 2025.
//

import SwiftUI

extension View {
    /// Applies a translucent background similar to visionOS.
    @ViewBuilder
    public func compatGlassBackground() -> some View {
        if #available(iOS 15.0, *) {
            self.background(.ultraThinMaterial)
        } else {
            self
        }
    }
}

