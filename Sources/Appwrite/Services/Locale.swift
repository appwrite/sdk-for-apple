import AsyncHTTPClient
import Foundation
import NIO
import AppwriteModels

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
        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Locale = { dict in
            return AppwriteModels.Locale.from(map: dict)
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
        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.ContinentList = { dict in
            return AppwriteModels.ContinentList.from(map: dict)
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
        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.CountryList = { dict in
            return AppwriteModels.CountryList.from(map: dict)
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
        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.CountryList = { dict in
            return AppwriteModels.CountryList.from(map: dict)
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
        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.PhoneList = { dict in
            return AppwriteModels.PhoneList.from(map: dict)
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
        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.CurrencyList = { dict in
            return AppwriteModels.CurrencyList.from(map: dict)
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
        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.LanguageList = { dict in
            return AppwriteModels.LanguageList.from(map: dict)
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func get(
        completion: ((Result<AppwriteModels.Locale, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await get(
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func listContinents(
        completion: ((Result<AppwriteModels.ContinentList, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await listContinents(
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func listCountries(
        completion: ((Result<AppwriteModels.CountryList, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await listCountries(
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func listCountriesEU(
        completion: ((Result<AppwriteModels.CountryList, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await listCountriesEU(
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func listCountriesPhones(
        completion: ((Result<AppwriteModels.PhoneList, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await listCountriesPhones(
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func listCurrencies(
        completion: ((Result<AppwriteModels.CurrencyList, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await listCurrencies(
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func listLanguages(
        completion: ((Result<AppwriteModels.LanguageList, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await listLanguages(
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

}
