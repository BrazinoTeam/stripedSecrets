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
            RoundedRectangle(cornerRadius: 0.0)
                .stroke(LinearGradient(
                    colors: [
                        Color(hex:"#FF3F3F"),
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                ), lineWidth: 2)
                .background {
                    RoundedRectangle(cornerRadius: 0.0)
                        .fill(.cLightRed)
                }
            
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
                .frame(maxWidth: innerProgressBarLength)
                .frame(height: 16)
                .border(.cLightRed, width: 0.5)
                .shadow(color: .red, radius: 10, x: 0, y: 0)
            
        }
        .fixedSize(horizontal: false, vertical: true)
        .frame(width: 260)
        .clipShape( RoundedRectangle(cornerRadius: 2))
        .readSize { self.barLength = $0.width }
    }
}

#Preview {
    ProgressBarView(currentProgress: 50, maxProgress: 260)
}
