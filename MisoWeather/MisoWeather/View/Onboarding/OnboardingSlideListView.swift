//
//  OnboardingSlideListView.swift
//  MisoWeather
//
//  Created by 강경 on 2022/03/15.
//

import SwiftUI

struct OnboardingSlideListView: View {
  
  private let onboardingDatas: [OnboardingSlideType] = OnboardingSlideType.allCases
  private let width: CGFloat = UIScreen.main.bounds.width
  private let heightPoint: CGFloat = UIScreen.main.bounds.height / 15
  
  var body: some View {
    ScrollView(.horizontal) {
      HStack(spacing: 0) {
        TabView {
          // TODO: 반복로직에대한 공부
          // ForEach(self.onboardingDatas, id: \.id) { data in
          // 위 처럼하면 슬라이드가 이상하게 보이는 이유를 찾아 공부요망
          ForEach(0..<self.onboardingDatas.count - 1) { index in
            VStack(alignment: .leading, spacing: 0) {
              Text(self.onboardingDatas[index].titleString)
                .foregroundColor(.white)
                .font(.custom("SpoqaHanSansNeo-Bold", size: 36))
                .padding(.horizontal, 27)
                .padding(.bottom, 10)
              
              Text(self.onboardingDatas[index].subTitleString)
                .foregroundColor(.white)
                .font(.custom("SpoqaHanSansNeo-Regular", size: 20))
                .padding(.horizontal, 27)
                .padding(.bottom, 15)
              
              Image(self.onboardingDatas[index].imageString)
                .resizable()
                .frame(width: self.width - 30, height: self.heightPoint * 4)
            }
          }
        }
        .frame(width: self.width, height: self.heightPoint * 8)
        .tabViewStyle(PageTabViewStyle())
      }
    }
  }
}
