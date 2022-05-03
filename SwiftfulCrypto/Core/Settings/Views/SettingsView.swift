//
//  SettingsView.swift
//  SwiftfulCrypto
//
//  Created by wizz on 5/3/22.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    let defaultURL = URL(string: "https://callmewiz.net")!
    let youtubeURL = URL(string: "https://www.youtube.com/c/swiftfulthinking")!
    let coffeeURL = URL(string: "https://www/buymeacoffee/com/nicksarno")!
    let coineckuURL = URL(string: "https://www.coingecko.com")!
    let personalURL = URL(string: "https://www.callmewiz.net")!
    
    var body: some View {
        NavigationView {
            List {
                swiftFulthinkingSection
                coinGeckoSection
                developerSection
                applicationSection
            }
            .listStyle(GroupedListStyle())
            .accentColor(.blue)
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.headline)
                    }
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}


extension SettingsView {
    
    private var swiftFulthinkingSection: some View {
        Section(header: Text("Swiftful thinking")) {
            VStack(alignment: .leading){
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("This app was made by following a @SwiftFullThinking course on Youtube. It uses MVVM Architure, Combine and CoreData!")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.theme.accent)
            }
            .padding(.vertical)
            Link("Subscribe on Youtube ", destination: youtubeURL)
            Link("Support his coffee addiction ", destination: coffeeURL)
        }
    }
    
    private var coinGeckoSection: some View {
        Section(header: Text("Coin Gecko")) {
            VStack(alignment: .leading){
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("The cryptocurrency data that is used in this app comes from a free API from CoinGecko! Prices may be slightly delayed")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.theme.accent)
            }
            .padding(.vertical)
            Link("Visit CoinGecko", destination: coineckuURL)
        }
    }
    
    private var developerSection: some View {
        Section(header: Text("Developer")) {
            VStack(alignment: .leading){
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("This app was developed by Nick Sarno. It uses SwiftUI and is written 100% in swift. The project benefits from multi-threading, publishers/subscribers, and data persistance.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.theme.accent)
            }
            .padding(.vertical)
            Link("Visit website", destination: personalURL)
        }
    }
    
    private var applicationSection: some View {
        Section(header: Text("Developer")) {
            Link("Terms of Service", destination: defaultURL)
            Link("Privacy", destination: defaultURL)
            Link("Company Website", destination: defaultURL)
            Link("Learn More CoinGecko", destination: defaultURL)
        }
    }
    
    
}
