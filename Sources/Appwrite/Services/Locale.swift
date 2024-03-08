import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// The Locale service allows you to customize your app based on your users&#039; location.
open class Locale: Service {

    ///
    /// Get user locale
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
        let apiPath: String = "/locale"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Locale = { response in
            return AppwriteModels.Locale.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// List Locale Codes
    ///
    /// List of all locale codes in [ISO
    /// 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes).
    ///
    /// @throws Exception
    /// @return array
    ///
    open func listCodes(
    ) async throws -> AppwriteModels.LocaleCodeList {
        let apiPath: String = "/locale/codes"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.LocaleCodeList = { response in
            return AppwriteModels.LocaleCodeList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// List continents
    ///
    /// List of all continents. You can use the locale header to get the data in a
    /// supported language.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func listContinents(
    ) async throws -> AppwriteModels.ContinentList {
        let apiPath: String = "/locale/continents"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.ContinentList = { response in
            return AppwriteModels.ContinentList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// List countries
    ///
    /// List of all countries. You can use the locale header to get the data in a
    /// supported language.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func listCountries(
    ) async throws -> AppwriteModels.CountryList {
        let apiPath: String = "/locale/countries"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.CountryList = { response in
            return AppwriteModels.CountryList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// List EU countries
    ///
    /// List of all countries that are currently members of the EU. You can use the
    /// locale header to get the data in a supported language.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func listCountriesEU(
    ) async throws -> AppwriteModels.CountryList {
        let apiPath: String = "/locale/countries/eu"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.CountryList = { response in
            return AppwriteModels.CountryList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// List countries phone codes
    ///
    /// List of all countries phone codes. You can use the locale header to get the
    /// data in a supported language.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func listCountriesPhones(
    ) async throws -> AppwriteModels.PhoneList {
        let apiPath: String = "/locale/countries/phones"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.PhoneList = { response in
            return AppwriteModels.PhoneList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// List currencies
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
        let apiPath: String = "/locale/currencies"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.CurrencyList = { response in
            return AppwriteModels.CurrencyList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// List languages
    ///
    /// List of all languages classified by ISO 639-1 including 2-letter code, name
    /// in English, and name in the respective language.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func listLanguages(
    ) async throws -> AppwriteModels.LanguageList {
        let apiPath: String = "/locale/languages"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.LanguageList = { response in
            return AppwriteModels.LanguageList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }


}