//
//  MarketDataModel.swift
//  SwiftfulCrypto
//
//  Created by wizz on 4/23/22.
//

import Foundation

//JSON data:
/*
URL: https://api.coingecko.com/api/v3/global
 JSON Response :
 
 {
 "data": {
 "active_cryptocurrencies": 13687,
 "upcoming_icos": 0,
 "ongoing_icos": 49,
 "ended_icos": 3376,
 "markets": 792,
 "total_market_cap": {
 "btc": 49067306.25737673,
 "eth": 659331774.9324498,
 "ltc": 18368693114.71404,
 "bch": 6172184911.466923,
 "bnb": 4796728055.691958,
 "eos": 805993006073.1338,
 "xrp": 2739727836369.2666,
 "xlm": 10074085925922.889,
 "link": 145690161482.22388,
 "dot": 102879022396.5424,
 "yfi": 105040181.97231045,
 "usd": 1953921278945.7043,
 "aed": 7176948249695.461,
 "ars": 223515465914315.44,
 "aud": 2696180802234.1543,
 "bdt": 168932207999781.53,
 "bhd": 737066000529.0143,
 "bmd": 1953921278945.7043,
 "brl": 9376713857879.402,
 "cad": 2483697724912.6455,
 "chf": 1870862039299.0007,
 "clp": 1616047423552444,
 "cny": 12703809979321.285,
 "czk": 44036598520302.76,
 "dkk": 13460368298529.084,
 "eur": 1811417892229.6375,
 "gbp": 1521805726343.0269,
 "hkd": 15331707094620.11,
 "huf": 673061401194591,
 "idr": 28273240906344348,
 "ils": 6386958337404.951,
 "inr": 149406004418199.4,
 "jpy": 251022220627433.34,
 "krw": 2431615953222350,
 "kwd": 597587283952.7527,
 "lkr": 656332339481648.8,
 "mmk": 3627468641231245.5,
 "mxn": 39561044134813.66,
 "myr": 8450709531440.165,
 "ngn": 814050108135220,
 "nok": 17512410246806.645,
 "nzd": 2939332627949.9946,
 "php": 102355193144773.73,
 "pkr": 364901281953913.9,
 "pln": 8420218589882.199,
 "rub": 151184651142738.53,
 "sar": 7328289222356.224,
 "sek": 18723870748572.195,
 "sgd": 2679001926349.6626,
 "thb": 66254944148834.99,
 "try": 28806075239112.816,
 "twd": 57266501803980.38,
 "uah": 57600530508379.96,
 "vef": 195646137660.8335,
 "vnd": 44871802170988090,
 "zar": 30563236645268.71,
 "xdr": 1409889023327.574,
 "xag": 80874345333.37318,
 "xau": 1011369193.1950871,
 "bits": 49067306257376.73,
 "sats": 4906730625737673
 },
 "total_volume": {
 "btc": 1734338.045392288,
 "eth": 23304808.61947582,
 "ltc": 649261713.0004869,
 "bch": 218162681.6643106,
 "bnb": 169545642.4029075,
 "eos": 28488711555.111706,
 "xrp": 96838701430.06197,
 "xlm": 356079675583.4208,
 "link": 5149579407.774803,
 "dot": 3636372489.6404767,
 "yfi": 3712761.0579217216,
 "usd": 69063502161.73991,
 "aed": 253677149790.28665,
 "ars": 7900400609632.024,
 "aud": 95299483489.94592,
 "bdt": 5971095170566.804,
 "bhd": 26052410539.46017,
 "bmd": 69063502161.73991,
 "brl": 331430290857.5192,
 "cad": 87789034820.36319,
 "chf": 66127681748.34649,
 "clp": 57120978174827.41,
 "cny": 449030172004.9844,
 "czk": 1556522133145.3213,
 "dkk": 475771560042.0108,
 "eur": 64026562822.07994,
 "gbp": 53789901468.16471,
 "hkd": 541916093284.8834,
 "huf": 23790097399148.098,
 "idr": 999348876280376.8,
 "ils": 225754085231.2746,
 "inr": 5280919973746.787,
 "jpy": 8872657186220.88,
 "krw": 85948147170242.08,
 "kwd": 21122381501.14648,
 "lkr": 23198790266038.273,
 "mmk": 128216879075341.45,
 "mxn": 1398328728268.7473,
 "myr": 298699646849.5249,
 "ngn": 28773498711932.32,
 "nok": 618995450825.0256,
 "nzd": 103893952889.45934,
 "php": 3617857167118.6665,
 "pkr": 12897838181405.102,
 "pln": 297621910898.29034,
 "rub": 5343788203510.608,
 "sar": 259026463350.22507,
 "sek": 661815858117.8379,
 "sgd": 94692277178.93987,
 "thb": 2341854059196.2993,
 "try": 1018182493319.8823,
 "twd": 2024147653107.3616,
 "uah": 2035954265992.4165,
 "vef": 6915328471.455022,
 "vnd": 1586043327144356.8,
 "zar": 1080291300813.9358,
 "xdr": 49834082191.34454,
 "xag": 2858592914.6411266,
 "xau": 35747959.35393824,
 "bits": 1734338045392.2878,
 "sats": 173433804539228.78
 },
 "market_cap_percentage": {
 "btc": 38.763387376987964,
 "eth": 18.252886502553892,
 "usdt": 4.263657820093153,
 "bnb": 3.5057993343572202,
 "usdc": 2.5584491713127235,
 "xrp": 1.75608512304172,
 "sol": 1.744809680128831,
 "luna": 1.638194928022289,
 "ada": 1.4778176326505477,
 "dot": 1.0723059664929713
 },
 "market_cap_change_percentage_24h_usd": 0.12771213550035151,
 "updated_at": 1650744755
 }
 }
 
 */


struct GlobalData: Codable {
    let data: MarketDataModel?
}

struct MarketDataModel: Codable {

    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double

    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        
        if let item = totalMarketCap.first(where: { $0.key == "usd"}) {
            return "$"+item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var volume: String {
        
        if let item = totalVolume.first(where: { $0.key == "usd"}) {
            return "$"+item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc"}) {
            return item.value.asPercentString()
        }
        return ""
    }
}
