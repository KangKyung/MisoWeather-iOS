//
//  SlideView.swift
//  MisoWeather
//
//  Created by 강경 on 2022/02/13.
//

import SwiftUI

struct SlideView<Content: View, T: Identifiable>: View {
    
    // MARK: for Accepting List
    
    private var content: (T) -> Content
    private var list: [T]
    
    // MARK: Property
    
    private var spacing: CGFloat
    private var trailingSpace: CGFloat
    @Binding var index: Int
    
    // MARK: offset
    
    @GestureState private var offset: CGFloat = 0
    @State private var currentIndex: Int = 0
    
    private var adjustMentWidth: CGFloat {
        self.currentIndex != 0 ? (self.trailingSpace / 2) - self.spacing : 0
    }
    
    // MARK: Init
    
    init(
        spacing: CGFloat = 15,
        trailingSpace: CGFloat = 100,
        index: Binding<Int>,
        items: [T],
        itemLimit: Int? = nil,
        @ViewBuilder content: @escaping (T) -> Content
    ) {
        self.list = items
        if let limit = itemLimit,
           limit <= self.list.count-1 {
            self.list.removeSubrange(limit...self.list.count-1)
        }
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        self._index = index
        self.content = content
    }
    
    // MARK: View
    
    var body: some View {
        GeometryReader { geometryProxy in
            let width = geometryProxy.size.width - (self.trailingSpace - self.spacing)
            
            HStack(alignment: .top, spacing: self.spacing) {
                ForEach(self.list) { item in
                    self.content(item)
                        .frame(width: geometryProxy.size.width - self.trailingSpace)
                        .background(Color.clear)
                }
            }
            .padding(.horizontal, self.spacing)
            .self.offset(
                x: (CGFloat(self.currentIndex) * -width) + self.adjustMentWidth + self.offset
            )
            .highPriorityGesture(
                DragGesture()
                    .updating(self.$offset) { value, outRange, _ in
                        outRange = value.translation.width
                    }
                    .onEnded { value in
                        let offsetX = value.translation.width
                        let progerss = -offsetX / width
                        let roundIndex = progerss.rounded()
                        
                        self.currentIndex = max(
                            min(self.currentIndex + Int(roundIndex), self.list.count - 1),
                            0
                        )
                        self.currentIndex = self.index
                    }
                    .onChanged { value in
                        let offsetOfX = value.translation.width
                        let progerss = -offsetOfX / width
                        let roundIndex = progerss.rounded()
                        
                        self.index = max(
                            min(self.currentIndex + Int(roundIndex), self.list.count - 1),
                            0
                        )
                    }
            )
        }
        // TODO: 매직넘버 개선
        // GeometryReader를 사용하면서, View의 높이가 고정되버리는 문제 발생
        .frame(height: 390)
    }
}
