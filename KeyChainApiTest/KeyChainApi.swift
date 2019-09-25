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
        checkError(status)
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
    
    class func remove(for key: String) {
        let status = SecItemDelete(modifierQuery(key: key))
        checkError(status)
    }
    
    fileprivate static func modifierQuery(key: String) -> CFDictionary {
        let keychainQuery: [CFString: Any] = [kSecClass: kSecClassGenericPassword,
                                              kSecAttrAccount: key,
                                              kSecReturnData: kCFBooleanTrue as Any]
        return keychainQuery as CFDictionary
    }

    fileprivate static func checkError(_ status: OSStatus) {
        if status != errSecSuccess {
            if #available(iOS 11.3, *),
            let err = SecCopyErrorMessageString(status, nil) {
                print("Operation failed: \(err)")
            } else {
                print("Operation failed: \(status)")
            }
        }
    }
}
