import Foundation

enum ApiStatus : Int {
    case SUCCESS = 200
    case CARD_NOT_VALID = 502
    case OUT_OF_MONEY = 503
    case AMOUNT_INVALID = 504
}
