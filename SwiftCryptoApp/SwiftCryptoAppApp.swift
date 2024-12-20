////
//  SwiftCryptoAppApp.swift
//  SwiftCryptoApp
//
//  Created by Santhoshi Guduru on 8/15/23.
//  
//

import SwiftUI

@main
struct SwiftCryptoAppApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes =  [.foregroundColor: UIColor(Color.theme.accent)]
            
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
