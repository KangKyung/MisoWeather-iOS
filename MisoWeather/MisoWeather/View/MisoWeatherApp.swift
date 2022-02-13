//
//  MisoWeatherApp.swift
//  MisoWeather
//
//  Created by 강경 on 2022/01/10.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct MisoWeatherApp: App {
    
    init() {
        KakaoSDK.initSDK(appKey:"736bce23a9c3f3c612c54341a9abf72f")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { selectedURL in
                    if AuthApi.isKakaoTalkLoginUrl(selectedURL) {
                        _ = AuthController.handleOpenUrl(url: selectedURL)
                    }
                }
        }
    }
}
