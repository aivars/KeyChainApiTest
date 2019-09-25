//
//  KeyChainApi.swift
//  KeyChainApiTest
//
//  Created by Aivars Meijers on 25/09/2019.
//  Copyright © 2019 Aivars Meijers. All rights reserved.
//
import Foundation

class KeyChainApi {
    class func save(_ secret: String, for key: String) {
        let secret = secret.data(using: .utf8)
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                    kSecAttrAccount as String: key,
                                    kSecValueData as String: secret ?? ""]
        let status = SecItemAdd(query as CFDictionary, nil)
        guard status == errSecSuccess else { return print("save error:", status)
        }
    }
    
    class func retrive(for key: String) -> String? {
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                    kSecAttrAccount as String: key,
                                    kSecMatchLimit as String: kSecMatchLimitOne,
                                    kSecReturnData as String: kCFBooleanTrue ?? ""]
        
        var retrivedData: AnyObject? = nil
        let _ = SecItemCopyMatching(query as CFDictionary, &retrivedData)
        guard let data = retrivedData as? Data else {return nil}
        return String(data: data, encoding: String.Encoding.utf8)
    }
}
