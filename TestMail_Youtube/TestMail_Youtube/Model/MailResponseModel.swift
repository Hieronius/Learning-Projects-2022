
import Foundation

struct MailResponseModel: Decodable { // I've used different name from autor because he have a misstake "ResponCe"
    let result: String
    let reason: String
    let did_you_mean: String?
    let success: Bool
    
    var reasonDescription: String {
        
        switch reason {
        case "invalid_email":
            return "Specified email is not a valid email address syntax"
        case "invalid domain":
            return "Domain for email does not exist"
        case "rejected_email":
            return "Email address was rejected by the SMTP server, email address does not exist"
        case "accepted_email":
            return "Email address was accepted by the SMTP server"
        case "low_quality":
            return "Email addreess has quality issues that may make it a risky or low-value address"
        case "low_deliverability":
            return "Email address appears to be deliverable, but deliverability cannot be guaranteed"
        case "no_connect":
            return "Could not connect to SMTP server"
        case "timeout":
            return "SMTP session timed out"
        case "invalid_smtp":
            return "SMTP server returned an unexpected/invalid response"
        case "unavaliable_smtp":
            return "SMTP server was unavailable to process our requst"
        case "unexpected_error":
            return "An unexpected error has occured"
        default: return "No data"
        }
    }
}

