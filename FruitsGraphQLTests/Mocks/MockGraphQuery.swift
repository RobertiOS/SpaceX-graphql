//
//  MockGraphQuery.swift
//  FruitsGraphQLTests
//
//  Created by Robert on 11/30/22.
//

import Foundation

enum MockGraphQLQuery {

    typealias JSONObject = [String: Any]

    case launch
    case launches

    var responseString: String {
        switch self {
        case .launch:
            return MockGraphQLQuery.launchResponseString
        case .launches:
            return MockGraphQLQuery.launchesResponseString
        }
    }

    var responseObject: JSONObject? {

        guard
            let data = responseString.data(using: .utf8),
            let object = try? JSONSerialization.jsonObject(with: data,
                                                           options: []) as? JSONObject
            else {
                return nil
        }

        return object
    }

    private static let launchesResponseString =
    """
     {
       "data": {
         "launches": {
           "cursor": "1583556631",
           "hasMore": true,
           "launches": [
             {
               "id": "110",
               "site": "KSC LC 39A",
               "mission": {
                 "missionPatch": "https://imgur.com/E7fjUBD.png",
                 "name": "CRS-21"
               },
               "rocket": {
                 "name": "Falcon 9"
               }
             },
             {
               "id": "109",
               "site": "CCAFS SLC 40",
               "mission": {
                 "missionPatch": "https://images2.imgbox.com/d2/3b/bQaWiil0_o.png",
                 "name": "Starlink-15 (v1.0)"
               },
               "rocket": {
                 "name": "Falcon 9"
               }
             },
             {
               "id": "108",
               "site": "VAFB SLC 4E",
               "mission": {
                 "missionPatch": null,
                 "name": "Sentinel-6 Michael Freilich"
               },
               "rocket": {
                 "name": "Falcon 9"
               }
             },
             {
               "id": "107",
               "site": "KSC LC 39A",
               "mission": {
                 "missionPatch": "https://i.imgur.com/t5R4BAQ.png",
                 "name": "Crew-1"
               },
               "rocket": {
                 "name": "Falcon 9"
               }
             },
             {
               "id": "106",
               "site": "CCAFS SLC 40",
               "mission": {
                 "missionPatch": "https://i.imgur.com/Ehe9AgY.png",
                 "name": "GPS III SV04 (Sacagawea)"
               },
               "rocket": {
                 "name": "Falcon 9"
               }
             },
             {
               "id": "105",
               "site": "CCAFS SLC 40",
               "mission": {
                 "missionPatch": "https://images2.imgbox.com/d2/3b/bQaWiil0_o.png",
                 "name": "Starlink-14 (v1.0)"
               },
               "rocket": {
                 "name": "Falcon 9"
               }
             },
             {
               "id": "104",
               "site": "KSC LC 39A",
               "mission": {
                 "missionPatch": "https://images2.imgbox.com/d2/3b/bQaWiil0_o.png",
                 "name": "Starlink-13 (v1.0)"
               },
               "rocket": {
                 "name": "Falcon 9"
               }
             },
             {
               "id": "103",
               "site": "KSC LC 39A",
               "mission": {
                 "missionPatch": "https://images2.imgbox.com/d2/3b/bQaWiil0_o.png",
                 "name": "Starlink-12 (v1.0)"
               },
               "rocket": {
                 "name": "Falcon 9"
               }
             },
             {
               "id": "102",
               "site": "KSC LC 39A",
               "mission": {
                 "missionPatch": "https://images2.imgbox.com/d2/3b/bQaWiil0_o.png",
                 "name": "Starlink-11 (v1.0)"
               },
               "rocket": {
                 "name": "Falcon 9"
               }
             },
             {
               "id": "101",
               "site": "CCAFS SLC 40",
               "mission": {
                 "missionPatch": "https://images2.imgbox.com/43/33/36WPntCu_o.png",
                 "name": "SAOCOM 1B, GNOMES-1, Tyvak-0172"
               },
               "rocket": {
                 "name": "Falcon 9"
               }
             },
             {
               "id": "100",
               "site": "CCAFS SLC 40",
               "mission": {
                 "missionPatch": "https://images2.imgbox.com/d2/3b/bQaWiil0_o.png",
                 "name": "Starlink-10 (v1.0) & SkySat 19-21"
               },
               "rocket": {
                 "name": "Falcon 9"
               }
             },
             {
               "id": "99",
               "site": "KSC LC 39A",
               "mission": {
                 "missionPatch": "https://images2.imgbox.com/d2/3b/bQaWiil0_o.png",
                 "name": "Starlink-9 (v1.0) & BlackSky Global 5-6"
               },
               "rocket": {
                 "name": "Falcon 9"
               }
             },
             {
               "id": "98",
               "site": "CCAFS SLC 40",
               "mission": {
                 "missionPatch": "https://images2.imgbox.com/ad/77/CDzoMWTH_o.png",
                 "name": "ANASIS-II"
               },
               "rocket": {
                 "name": "Falcon 9"
               }
             },
             {
               "id": "97",
               "site": "CCAFS SLC 40",
               "mission": {
                 "missionPatch": "https://images2.imgbox.com/5f/63/UmHyB3Y6_o.png",
                 "name": "GPS III SV03 (Columbus)"
               },
               "rocket": {
                 "name": "Falcon 9"
               }
             },
             {
               "id": "96",
               "site": "CCAFS SLC 40",
               "mission": {
                 "missionPatch": "https://images2.imgbox.com/d2/3b/bQaWiil0_o.png",
                 "name": "Starlink-8 & SkySat 16-18"
               },
               "rocket": {
                 "name": "Falcon 9"
               }
             },
             {
               "id": "95",
               "site": "CCAFS SLC 40",
               "mission": {
                 "missionPatch": "https://images2.imgbox.com/d2/3b/bQaWiil0_o.png",
                 "name": "Starlink 7"
               },
               "rocket": {
                 "name": "Falcon 9"
               }
             },
             {
               "id": "94",
               "site": "KSC LC 39A",
               "mission": {
                 "missionPatch": "https://images2.imgbox.com/ab/79/Wyc9K7fv_o.png",
                 "name": "CCtCap Demo Mission 2"
               },
               "rocket": {
                 "name": "Falcon 9"
               }
             },
             {
               "id": "93",
               "site": "KSC LC 39A",
               "mission": {
                 "missionPatch": "https://images2.imgbox.com/d2/3b/bQaWiil0_o.png",
                 "name": "Starlink 6"
               },
               "rocket": {
                 "name": "Falcon 9"
               }
             },
             {
               "id": "92",
               "site": "KSC LC 39A",
               "mission": {
                 "missionPatch": "https://images2.imgbox.com/d2/3b/bQaWiil0_o.png",
                 "name": "Starlink 5"
               },
               "rocket": {
                 "name": "Falcon 9"
               }
             },
             {
               "id": "91",
               "site": "CCAFS SLC 40",
               "mission": {
                 "missionPatch": "https://images2.imgbox.com/15/2b/NAcsTEB6_o.png",
                 "name": "CRS-20"
               },
               "rocket": {
                 "name": "Falcon 9"
               }
             }
           ]
         }
       }
     }
     """
// TODO: add mock responde for one launch
    private static let launchResponseString =
    """
    
    """
}
