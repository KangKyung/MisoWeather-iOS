//
//  OnboardingView.swift
//  MisoWeather
//
//  Created by 강경 on 2022/02/13.
//

import SwiftUI

struct OnboardingView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            Image.logo
                .padding(.leading, 43)
                .padding(.top, 88)
                .padding(.bottom, 50)
            
            self.slideListView
                .padding(.leading, 16)
                .padding(.bottom, 70)
            
            self.loginButtonListView
                .padding(.leading, 28)
            
            Spacer()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(Color.accent)
        .ignoresSafeArea()
    }
    
    private var slideListView: some View {
        VStack {

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
