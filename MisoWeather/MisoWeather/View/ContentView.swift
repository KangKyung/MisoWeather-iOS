//
//  ContentView.swift
//  MisoWeather
//
//  Created by 강경 on 2022/01/10.
//

import SwiftUI

struct ContentView: View {
  
  private var isItFirstTime: Bool {
    true
  }
  
  var body: some View {
    VStack {
      if self.isItFirstTime {
        OnboardingView()
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  
  static var previews: some View {
    ContentView()
  }
}
