//
//  View+compatGlass.swift
//  NimbleKit
//
//  Created by Codex on 2025.
//

import SwiftUI

extension View {
    /// Applies the glass background effect when available.
    @ViewBuilder
    public func compatGlassBackground() -> some View {
        if #available(iOS 19.0, *) {
            self.glassBackgroundEffect()
        } else {
            self
        }
    }
}

