//
//  Previews.swift
//  IsItRaining
//
//  Created by ostojan on 15/08/2023.
//

import Foundation

extension LocationData {
    static let preview = {
        guard let jsonData = """
        {
          "name":"London",
          "local_names": {
            "ms":"London",
            "gu":"લંડન",
            "is":"London",
            "wa":"Londe",
            "mg":"Lôndôna",
            "gl":"Londres",
            "om":"Landan",
            "ku":"London",
            "tw":"London",
            "mk":"Лондон",
            "ee":"London",
            "fj":"Lodoni",
            "gd":"Lunnainn",
            "ky":"Лондон",
            "yo":"Lọndọnu",
            "zu":"ILondon",
            "bg":"Лондон",
            "tk":"London",
            "co":"Londra",
            "sh":"London",
            "de":"London",
            "kl":"London",
            "bi":"London",
            "km":"ឡុងដ៍",
            "lt":"Londonas",
            "fi":"Lontoo",
            "fy":"Londen",
            "ba":"Лондон",
            "sc":"Londra",
            "feature_name":"London",
            "ja":"ロンドン",
            "am":"ለንደን",
            "sk":"Londýn",
            "mr":"लंडन",
            "es":"Londres",
            "sq":"Londra",
            "te":"లండన్",
            "br":"Londrez",
            "uz":"London",
            "da":"London",
            "sw":"London",
            "fa":"لندن",
            "sr":"Лондон",
            "cu":"Лондонъ",
            "ln":"Lóndɛlɛ",
            "na":"London",
            "wo":"Londar",
            "ig":"London",
            "to":"Lonitoni",
            "ta":"இலண்டன்",
            "mt":"Londra",
            "ar":"لندن",
            "su":"London",
            "ab":"Лондон",
            "ps":"لندن",
            "bm":"London",
            "mi":"Rānana",
            "kn":"ಲಂಡನ್",
            "kv":"Лондон",
            "os":"Лондон",
            "bn":"লন্ডন",
            "li":"Londe",
            "vi":"Luân Đôn",
            "zh":"伦敦",
            "eo":"Londono",
            "ha":"Landan",
            "tt":"Лондон",
            "lb":"London",
            "ce":"Лондон",
            "hu":"London",
            "it":"Londra",
            "tl":"Londres",
            "pl":"Londyn",
            "sm":"Lonetona",
            "en":"London",
            "vo":"London",
            "el":"Λονδίνο",
            "sn":"London",
            "fr":"Londres",
            "cs":"Londýn",
            "io":"London",
            "hi":"लंदन",
            "et":"London",
            "pa":"ਲੰਡਨ",
            "av":"Лондон",
            "ko":"런던",
            "bh":"लंदन",
            "yi":"לאנדאן",
            "sa":"लन्डन्",
            "sl":"London",
            "hr":"London",
            "si":"ලන්ඩන්",
            "so":"London",
            "gn":"Lóndyre",
            "ay":"London",
            "se":"London",
            "sd":"لنڊن",
            "af":"Londen",
            "ga":"Londain",
            "or":"ଲଣ୍ଡନ",
            "ia":"London",
            "ie":"London",
            "ug":"لوندۇن",
            "nl":"Londen",
            "gv":"Lunnin",
            "qu":"London",
            "be":"Лондан",
            "an":"Londres",
            "fo":"London",
            "hy":"Լոնդոն",
            "nv":"Tooh Dineʼé Bikin Haalʼá",
            "bo":"ལོན་ཊོན།",
            "ascii":"London",
            "id":"London",
            "lv":"Londona",
            "ca":"Londres",
            "no":"London",
            "nn":"London",
            "ml":"ലണ്ടൻ",
            "my":"လန်ဒန်မြို့",
            "ne":"लन्डन",
            "he":"לונדון",
            "cy":"Llundain",
            "lo":"ລອນດອນ",
            "jv":"London",
            "sv":"London",
            "mn":"Лондон",
            "tg":"Лондон",
            "kw":"Loundres",
            "cv":"Лондон",
            "az":"London",
            "oc":"Londres",
            "th":"ลอนดอน",
            "ru":"Лондон",
            "ny":"London",
            "bs":"London",
            "st":"London",
            "ro":"Londra",
            "rm":"Londra",
            "ff":"London",
            "kk":"Лондон",
            "uk":"Лондон",
            "pt":"Londres",
            "tr":"Londra",
            "eu":"Londres",
            "ht":"Lonn",
            "ka":"ლონდონი",
            "ur":"علاقہ لندن"
          },
          "lat":51.5073219,
          "lon":-0.1276474,
          "country":"GB",
          "state":"England"
        }
        """.data(using: .utf8) else {
            fatalError("Couldn't encode LocationData JSON string")
        }
        
        do {
            return try JSONDecoder().decode(LocationData.self, from: jsonData)
        } catch {
            fatalError("Couldn't decode LocationData JSON string")
        }
    }()
}

extension WeatherData {
    static let preview = {
        guard let jsonData = """
        {
          "coord": {
            "lon": 10.99,
            "lat": 44.34
          },
          "weather": [
            {
              "id": 501,
              "main": "Rain",
              "description": "moderate rain",
              "icon": "10d"
            }
          ],
          "base": "stations",
          "main": {
            "temp": 298.48,
            "feels_like": 298.74,
            "temp_min": 297.56,
            "temp_max": 300.05,
            "pressure": 1015,
            "humidity": 64,
            "sea_level": 1015,
            "grnd_level": 933
          },
          "visibility": 10000,
          "wind": {
            "speed": 0.62,
            "deg": 349,
            "gust": 1.18
          },
          "rain": {
            "1h": 3.16
          },
          "clouds": {
            "all": 100
          },
          "dt": 1661870592,
          "sys": {
            "type": 2,
            "id": 2075663,
            "country": "IT",
            "sunrise": 1661834187,
            "sunset": 1661882248
          },
          "timezone": 7200,
          "id": 3163858,
          "name": "Zocca",
          "cod": 200
        }
        """.data(using: .utf8) else {
            fatalError("Couldn't encode WeatherData JSON string")
        }
        
        do {
            return try JSONDecoder().decode(WeatherData.self, from: jsonData)
        } catch {
            fatalError("Couldn't decode WeatherData JSON string")
        }
    }()
}
