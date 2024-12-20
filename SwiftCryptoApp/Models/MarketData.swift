////
//  MarketData.swift
//  SwiftCryptoApp
//
//  Created by Santhoshi Guduru on 8/22/23.
//  
//

import Foundation
/*
 URL: https://api.coingecko.com/api/v3/global
 
 JSON Response:
 {
   "data": {
     "active_cryptocurrencies": 10135,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 832,
     "total_market_cap": {
       "btc": 41768630.35592553,
       "eth": 663451233.8283839,
       "ltc": 16686590230.591038,
       "bch": 5893840075.512936,
       "bnb": 5239227139.50592,
       "eos": 1918588307127.6355,
       "xrp": 2117686073330.015,
       "xlm": 9139321919323.68,
       "link": 179536740805.4739,
       "dot": 250173552313.34845,
       "yfi": 197460585.99682215,
       "usd": 1078657465449.924,
       "aed": 3961946623608.862,
       "ars": 377485780085643.44,
       "aud": 1680066171283.9248,
       "bdt": 117842306611784.38,
       "bhd": 406673280308.99963,
       "bmd": 1078657465449.924,
       "brl": 5321125142811.019,
       "cad": 1462244240025.8977,
       "chf": 949263873209.4827,
       "clp": 937709294439581.6,
       "cny": 7868051150231.4,
       "czk": 23932208781633.832,
       "dkk": 7407181804228.305,
       "eur": 993919213621.6453,
       "gbp": 846919774230.1278,
       "hkd": 8454679012816.31,
       "huf": 380853653952841.06,
       "idr": 16529347000554654,
       "ils": 4089298317267.207,
       "inr": 89579107970572.47,
       "jpy": 157259089874142.62,
       "krw": 1444517491552809,
       "kwd": 332450860111.39014,
       "lkr": 349751881898700.3,
       "mmk": 2265220897345757,
       "mxn": 18269005760832.266,
       "myr": 5013599899411.25,
       "ngn": 822249799337824.4,
       "nok": 11466976682500.559,
       "nzd": 1814782938116.362,
       "php": 60701451025509.29,
       "pkr": 320900595971352.44,
       "pln": 4439788644830.794,
       "rub": 101663471511942.84,
       "sar": 4046080827256.492,
       "sek": 11799696128320.844,
       "sgd": 1464682005897.815,
       "thb": 37806944164019.85,
       "try": 29339786162985.727,
       "twd": 34493309508815.156,
       "uah": 39847656222904.555,
       "vef": 108005972015.50075,
       "vnd": 25688227539689956,
       "zar": 20271403906544.207,
       "xdr": 811044705586.7275,
       "xag": 46071865755.514206,
       "xau": 568387764.8441852,
       "bits": 41768630355925.53,
       "sats": 4176863035592553
     },
     "total_volume": {
       "btc": 1285203.5175729585,
       "eth": 20414120.649598796,
       "ltc": 513439494.61373144,
       "bch": 181351026.65599123,
       "bnb": 161208856.78267086,
       "eos": 59034170382.964836,
       "xrp": 65160326478.67017,
       "xlm": 281213163535.78015,
       "link": 5524271417.3424015,
       "dot": 7697736954.671888,
       "yfi": 6075780.736466769,
       "usd": 33189845035.364124,
       "aed": 121907462459.46867,
       "ars": 11615081659746.492,
       "aud": 51694942704.36648,
       "bdt": 3625959139330.2812,
       "bhd": 12513168995.542917,
       "bmd": 33189845035.364124,
       "brl": 163728824543.9547,
       "cad": 44992651777.615105,
       "chf": 29208457604.611935,
       "clp": 28852927984593.07,
       "cny": 242096686641.45715,
       "czk": 736384187064.5104,
       "dkk": 227915927071.95645,
       "eur": 30582483999.23101,
       "gbp": 26059371917.81153,
       "hkd": 260146983863.93893,
       "huf": 11718709748673.05,
       "idr": 508601185321920.44,
       "ils": 125826021513.56894,
       "inr": 2756312181744.6655,
       "jpy": 4838797292473.29,
       "krw": 44447207043167.1,
       "kwd": 10229375758.659504,
       "lkr": 10761721058689.268,
       "mmk": 69699912124016.58,
       "mxn": 562129767394.9548,
       "myr": 154266399724.37256,
       "ngn": 25300286972007.777,
       "nok": 352834139944.11914,
       "nzd": 55840122020.3682,
       "php": 1867758595744.8027,
       "pkr": 9873978898020.828,
       "pln": 136610464240.60025,
       "rub": 3128143060532.2993,
       "sar": 124496237182.3821,
       "sek": 363071779974.19244,
       "sgd": 45067660827.39504,
       "thb": 1163304068489.5132,
       "try": 902773111308.3591,
       "twd": 1061344897730.7197,
       "uah": 1226095936311.9182,
       "vef": 3323299183.3910055,
       "vnd": 790416159517197.1,
       "zar": 623742731921.7046,
       "xdr": 24955510861.78032,
       "xag": 1417612294.8148305,
       "xau": 17489056.94293484,
       "bits": 1285203517572.9585,
       "sats": 128520351757295.84
     },
     "market_cap_percentage": {
       "btc": 46.60178002032799,
       "eth": 18.129922105086298,
       "usdt": 7.689579050241055,
       "bnb": 2.936564355950496,
       "xrp": 2.496392592281821,
       "usdc": 2.398597856481546,
       "steth": 1.2544492358612265,
       "ada": 0.8227277762210559,
       "doge": 0.7986896879038015,
       "sol": 0.7624731826963357
     },
     "market_cap_change_percentage_24h_usd": -1.163926088525131,
     "updated_at": 1692727433
   }
 }
 
 */
// MARK: - GlobalData
struct GlobalData: Codable {
    let data: MarketData?
}

// MARK: - MarketData
struct MarketData: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double

    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String{
        if let item = totalMarketCap.first(where:{$0.key == "usd"}) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var volume: String{
        if let item = totalVolume.first(where: {$0.key == "usd"}) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: {$0.key == "btc"}) {
            return item.value.asPercentString()
        }
        return ""
    }
    
}
