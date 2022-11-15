
import Foundation

// MARK: - Model
struct Model: Codable {
    let crypto_balance: CryptoBalance?
    let your_crypto_holdings: [YourCryptoHolding]?
    let crypto_prices: [CryptoPrice]?
    let all_transactions: [Transactions]?
}

// MARK: - CryptoBalance
struct CryptoBalance: Codable {
    let title, subtitle, current_bal_in_usd: String?
}

// MARK: - CryptoPrice
struct CryptoPrice: Codable {
    let logo: String?
    let title, current_price_in_usd: String?
}

// MARK: - YourCryptoHolding
struct YourCryptoHolding: Codable {
    let logo: String?
    let title, current_bal_in_token, current_bal_in_usd: String?
}
//MARK: - Transactions
struct Transactions: Codable {
    let txn_logo, title, txn_time, txn_amount, txn_sub_amount: String?
}
