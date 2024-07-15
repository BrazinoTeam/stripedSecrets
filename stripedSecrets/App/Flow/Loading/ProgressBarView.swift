//
//  ProgressBarView.swift

import Foundation
import SwiftUI

struct ProgressBarView: View {
    @State private var barLength: CGFloat = 0
    
    var currentProgress: CGFloat
    var maxProgress: CGFloat
    
    var innerProgressBarLength: CGFloat {
        let ratio = currentProgress / maxProgress
        return max(0, min(barLength * ratio, barLength - 2))
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 2)
                .stroke(LinearGradient(
                    colors: [
                        Color(hex:"#FF3F3F"),
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                ), lineWidth: 2)
                .background {
                    RoundedRectangle(cornerRadius: 2)
                        .fill(.cLightRed)
                }
                .customInnerShadow(
                    shape: RoundedRectangle(cornerRadius: 2),
                    lineWidth: 2,
                    yOffset: 0,
                    radius: 2,
                    color: .cLightRed
                )
        }
        .frame(width: 260, height: 15)
        .fixedSize(horizontal: false, vertical: true)
        //.clipShape( RoundedRectangle(cornerRadius: 2))
        .readSize { self.barLength = $0.width }
        .overlay(alignment: .leading){
            RoundedRectangle(cornerRadius: 2.0)
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            Color(hex:"#F8EFB1")
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .overlay {
                    RoundedRectangle(cornerRadius: 2.0)
                        .strokeBorder(lineWidth: 0.5)
                        .foregroundStyle(.cLightRed)
                }
                .frame(maxWidth: innerProgressBarLength)
                .frame(height: 16)
                .shadow(color: .red, radius: 10, x: 0, y: 0)
                .customInnerShadow(
                    shape: RoundedRectangle(cornerRadius: 2),
                    lineWidth: 4,
                    yOffset: 0,
                    radius: 2,
                    color: .cLightRed
                )
        }
    }
}

#Preview {
    ProgressBarView(currentProgress: 50, maxProgress: 260)
}
