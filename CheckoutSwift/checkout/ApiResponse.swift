import Foundation

class ApiResponse {
    var code:Int
    var message:String
    
    init(code:Int, msg:String) {
        self.code = code
        self.message = msg
    }
}
