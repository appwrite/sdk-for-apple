import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteModels

/// The Locale service allows you to customize your app based on your users&#039; location.
open class Locale: Service {

    ///
    /// Get User Locale
    ///
    /// Get the current user location based on IP. Returns an object with user
    /// country code, country name, continent name, continent code, ip address and
    /// suggested currency. You can use the locale header to get the data in a
    /// supported language.
    /// 
    /// ([IP Geolocation by DB-IP](https://db-ip.com))
    ///
    /// @throws Exception
    /// @return array
    ///
    open func get(
    ) async throws -> AppwriteModels.Locale {
        let path: String = "/locale"

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Locale = { response in
            return AppwriteModels.Locale.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// List Continents
    ///
    /// List of all continents. You can use the locale header to get the data in a
    /// supported language.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func listContinents(
    ) async throws -> AppwriteModels.ContinentList {
        let path: String = "/locale/continents"

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.ContinentList = { response in
            return AppwriteModels.ContinentList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// List Countries
    ///
    /// List of all countries. You can use the locale header to get the data in a
    /// supported language.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func listCountries(
    ) async throws -> AppwriteModels.CountryList {
        let path: String = "/locale/countries"

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.CountryList = { response in
            return AppwriteModels.CountryList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// List EU Countries
    ///
    /// List of all countries that are currently members of the EU. You can use the
    /// locale header to get the data in a supported language.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func listCountriesEU(
    ) async throws -> AppwriteModels.CountryList {
        let path: String = "/locale/countries/eu"

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.CountryList = { response in
            return AppwriteModels.CountryList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// List Countries Phone Codes
    ///
    /// List of all countries phone codes. You can use the locale header to get the
    /// data in a supported language.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func listCountriesPhones(
    ) async throws -> AppwriteModels.PhoneList {
        let path: String = "/locale/countries/phones"

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.PhoneList = { response in
            return AppwriteModels.PhoneList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// List Currencies
    ///
    /// List of all currencies, including currency symbol, name, plural, and
    /// decimal digits for all major and minor currencies. You can use the locale
    /// header to get the data in a supported language.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func listCurrencies(
    ) async throws -> AppwriteModels.CurrencyList {
        let path: String = "/locale/currencies"

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.CurrencyList = { response in
            return AppwriteModels.CurrencyList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// List Languages
    ///
    /// List of all languages classified by ISO 639-1 including 2-letter code, name
    /// in English, and name in the respective language.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func listLanguages(
    ) async throws -> AppwriteModels.LanguageList {
        let path: String = "/locale/languages"

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.LanguageList = { response in
            return AppwriteModels.LanguageList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }


}