//
//  LoadingScreen.swift

import Foundation
import SwiftUI
import Combine

struct LoadingScreen: View {
    @ObservedObject var loadignViewModel: LoadingScreenViewModel
    @State private var loadingProgress: CGFloat = 0
    
    var body: some View {
        VStack {
            Text("Loading".uppercased())
                .font(Font.custom("SofiaSans-Black", size: 16))
                .foregroundStyle(.cLightRed)
            ProgressBarView(currentProgress: loadingProgress, maxProgress: 260)
        }
        .padding(.bottom, 424.autoSize)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .backgroundImage(image: .bgStart)
        .onChange(of: loadignViewModel.isAnimating) { animating in
            if animating {
                withAnimation(.linear(duration: 2)) {
                    loadingProgress = 250
                }
            }
        }
    }
}

#Preview {
    LoadingScreen(loadignViewModel: LoadingScreenViewModel())
}
