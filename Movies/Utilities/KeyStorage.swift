//
//  KeyStorage.swift
//  Movies
//
//  Created by Rosendo Vázquez on 20/02/22.
//

import Foundation
import Security

public class KeyStorage{
    
    public static func saveInfo<T>(key: KeyToSave, value: T) where T: Codable {
        do {
            let data = try JSONEncoder().encode(value)
 
            let query = [kSecClass as String: kSecClassGenericPassword as String,
                         kSecAttrAccessible as String: kSecAttrAccessibleWhenUnlocked,
                         kSecAttrAccount as String: key.rawValue,
                         kSecValueData as String: data] as [String: Any]
            SecItemDelete(query as CFDictionary)
            _ = SecItemAdd(query as CFDictionary, nil)
            
        } catch {
        }
    }
    
    public static func getInfo<T>(key: KeyToSave, type: T.Type) -> T? where T: Codable {
        
        let query = [kSecClass as String: kSecClassGenericPassword, kSecAttrAccount as String: key.rawValue,
                     kSecReturnData as String: kCFBooleanTrue!, kSecAttrAccessible as String: kSecAttrAccessibleWhenUnlocked,
                     kSecMatchLimit as String: kSecMatchLimitOne] as [String: Any]
                     
        var data: AnyObject? = nil
        _ = SecItemCopyMatching(query as CFDictionary, &data)
    
        guard let data = data as? Data else { return nil }

        do {
            let item = try JSONDecoder().decode(type, from: data)
            return item
        } catch {
            return nil
        }
    }
    
}

public enum KeyToSave:String, CaseIterable{
    case MovieLocal = "MovieFav"
}
