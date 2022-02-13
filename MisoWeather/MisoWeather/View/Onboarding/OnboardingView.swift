//
//  OnboardingView.swift
//  MisoWeather
//
//  Created by 강경 on 2022/02/13.
//

import SwiftUI

struct OnboardingView: View {
    
    @State private var currentOnboardingIndex: Int = 0
    private let onboardingDatas: [OnboardingSlideType] = OnboardingSlideType.allCases
    
    var body: some View {
        ZStack {
            Color.accent
                .ignoresSafeArea(.all)
            
            self.contentView
        }
    }
    
    private var contentView: some View {
        VStack(alignment: .leading) {
            Image.logo
                .padding(.leading, 43)
                .padding(.top, 88)
                .padding(.bottom, 50)
            
            self.slideListView
                .padding(.bottom, 70)
            
            self.loginButtonListView
                .padding(.leading, 28)
        }
    }
    private var slideListView: some View {
        VStack {
            self.onboardingGuideView(of: onboardingDatas[0])
            .padding(.bottom, 20)
            
            self.dotsOfIndexingView
        }
    }
    private func onboardingGuideView(of data: OnboardingSlideType) -> some View {
        VStack(alignment: .leading) {
            Text(data.titleString)
                .foregroundColor(.white)
                .font(.custom("SpoqaHanSansNeo-Bold", size: 36))
                .padding(.bottom, 10)
                .padding(.leading, 27)
            
            Text(data.subTitleString)
                .foregroundColor(.white)
                .font(.custom("SpoqaHanSansNeo-Regular", size: 20))
                .padding(.bottom, 15)
                .padding(.leading, 27)
            
            Image(data.imageString)
        }
    }
    private var dotsOfIndexingView: some View {
        HStack(spacing: 5) {
            ForEach(0..<self.onboardingDatas.count) { index in
                index == self.currentOnboardingIndex ? Image.onboardingEllipse :
                Image.onboardingEllipseOutline
            }
        }
    }
    private var loginButtonListView: some View {
        VStack {
            
        }
    }
}

struct OnboardingView_PreView: PreviewProvider {
    
    static var previews: some View {
        OnboardingView()
    }
}
