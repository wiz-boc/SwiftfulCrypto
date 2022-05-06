//
//  HomeView.swift
//  SwiftfulCrypto
//
//  Created by wizz on 4/13/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolio = false
    @State private var showPortfolioView = false
    @State private var showSettingsView = false
    @State private var selectedCoin: CoinModel?
    @State private var showDetailView: Bool = false
    
    var body: some View {
        ZStack{
            Color.theme.background
                .ignoresSafeArea()
                .sheet(isPresented: $showPortfolioView) {
                    PortfolioView()
                        .environmentObject(vm)
                    //SettingsView()
                }
            
            VStack{
                homeHeader
                HomeStatsView(showPortfolio: $showPortfolio)
                SearchBarView(searchText: $vm.searchText)
                columnTitles
                
                if !showPortfolio {
                    allCoinsList
                        .transition(.move(edge: .leading))
                } else {
                    portfolioCoinsList
                        .transition(.move(edge: .trailing))
                }
                
                
                Spacer(minLength: 0)
            }
            .sheet(isPresented: $showSettingsView) {
                SettingsView()
            }
        }
        .background(
            NavigationLink(
                destination:DetailLoadingView(coin: $selectedCoin), isActive: $showDetailView,label: {EmptyView()}
            )
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomeView()
                .navigationBarHidden(true)
        }
        .environmentObject(dev.homeVM)
    }
}

extension HomeView {
    
    private var homeHeader: some View {
        HStack{
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(.none, value: showPortfolio)
                .onTapGesture {
                    if !showPortfolio {
                        showSettingsView.toggle()
                
                    } else {
                        showPortfolioView.toggle()
                    }
                }
                .background(
                    CircleButtonAnimationView(animate: $showPortfolio)
                )
            
            
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(.theme.accent)
                .animation(.none, value: showPortfolio)
            
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()){
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    private var allCoinsList: some View {
        List{
            ForEach(vm.allCoins){ coin in
                
                CoinRowView(coin: coin, showHoldingsColumns: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                    .onTapGesture {
                        segue(coin: coin)
                    }
                
            }
        }
        .listStyle(PlainListStyle())
    }
    
    
    private var portfolioCoinsList: some View {
        List{
            ForEach(vm.portfolioCoins){ coin in
                CoinRowView(coin: coin, showHoldingsColumns: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                    .onTapGesture {
                        segue(coin: coin)
                    }
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private func segue(coin: CoinModel) {
        selectedCoin = coin
        showDetailView.toggle()
    }
    
    private var columnTitles: some View {
        HStack{
            HStack{
                Text("Coin")
                Image(systemName: "chevron.down")
                    .opacity(vm.sortOption == .rank || vm.sortOption == .rankReversed ? 1 : 0)
                    .rotationEffect(Angle(degrees: vm.sortOption == .rank ? 0 : 180))
            }
            .onTapGesture {
                withAnimation(.default){
                    vm.sortOption =  vm.sortOption == .rank ? .rankReversed : .rank
                }
            }
            Spacer()
            if showPortfolio {
                
                HStack{
                    Text("Holdings")
                    Image(systemName: "chevron.down")
                        .opacity(vm.sortOption == .holdings || vm.sortOption == .holdingReversed ? 1 : 0)
                        .rotationEffect(Angle(degrees: vm.sortOption == .holdings ? 0 : 180))
                }
                .onTapGesture {
                    withAnimation(.default){
                        vm.sortOption =  vm.sortOption == .holdings ? .holdingReversed : .holdings
                    }
                }
            }
            
            HStack{
                Text("Price")
                Image(systemName: "chevron.down")
                    .opacity(vm.sortOption == .price || vm.sortOption == .priceReversed ? 1 : 0)
                    .rotationEffect(Angle(degrees: vm.sortOption == .price ? 0 : 180))
            }
            .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
            .onTapGesture {
                withAnimation(.default){
                    vm.sortOption =  vm.sortOption == .price ? .priceReversed : .price
                }
            }
            
            Button {
                withAnimation(.linear(duration: 2.0)){
                    vm.reloadData()
                }
            } label: {
                Image(systemName: "goforward")
            }
            .rotationEffect(Angle(degrees: vm.isLoading ? 360 : 0), anchor: .center)
            
        }
        .font(.caption)
        .foregroundColor(.theme.secondaryText)
        .padding(.horizontal)
    }
}
