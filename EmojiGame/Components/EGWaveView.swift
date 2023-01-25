//
//  EGWaveView.swift
//  EmojiGame
//
//  Created by Adam Chylaszek on 28/12/2022.
//

import SwiftUI

struct EGWaveView: View {
    var body: some View {
        Canvas { context, size in
            let height = size.height
            let width = size.width
            
            context.fill(
                Path { path in
                    
                    path.move(to: CGPoint(x: width * 0.3, y: height * 0.5))
                    path.addLine(to: CGPoint(x: width, y: height * 0.1))
                    path.addLine(to: CGPoint(x: width, y: height * 0.5))
                    path.closeSubpath()
                    
                    path.move(to: CGPoint(x: width, y: height * 0.5))
                    path.addLine(to: CGPoint(x: width, y: height))
                    path.addLine(to: CGPoint(x: 0, y: height))
                    path.addLine(to: CGPoint(x: 0, y: height * 0.55))
                    path.addLine(to: CGPoint(x: width * 0.25, y: height * 0.5))
                    path.closeSubpath()
                    
                }, with: .color(waveColor)
            )
            
            context.fill(
                Path { path in
                    path.addArc(
                        center: CGPoint(x: width * 0.7, y: height * 0.244),
                        radius: 200,
                        startAngle: .degrees(0),
                        endAngle: .degrees(90),
                        clockwise: false)
                    path.addLine(to: CGPoint(x: width * 0.3, y: height * 0.5))
                    path.addLine(to: CGPoint(x: width * 0.3, y: 0))
                    path.addLine(to: CGPoint(x: width, y: 0))
                }, with: .color(.white))
            
            
            context.fill(
                Path { path in
                    path.addArc(
                        center: CGPoint(x: width * 0.25, y: height * 0.7522),
                        radius: 200,
                        startAngle: .degrees(270),
                        endAngle: .degrees(180),
                        clockwise: true)
                    path.closeSubpath()
                }, with: .color(waveColor))
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct EGBWaveView_Previews: PreviewProvider {
    static var previews: some View {
        EGWaveView()
    }
}
