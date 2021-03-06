import Foundation

func text(_ lines: [String]) -> String {
    return lines.joined(separator: "\n")
}

func text(_ lines: String...) -> String {
    return text(lines)
}

func makeLinesIntoDocComment(lines: [String], prefix: String = "") -> String {
    return text(lines.map { "\(prefix)/// \($0)" })
}

func makeLinesIntoDocComment(prefix: String = "", lines: String...) -> String {
    return makeLinesIntoDocComment(lines: lines, prefix: prefix)
}

private func makeLinesIntoComment(lines: String...) -> String {
    return text(lines.map { "// \($0)" })
}

func createLink(text: String? = nil, link: String) -> String {
    guard let text = text else {
        return "<\(link)>"
    }
    return "[\(text)](\(link))"
}

public func createSeeAlso(text: String? = nil, link: String) -> String {
    return "- seealso: \(createLink(text: text, link: link))"
}

private let Date: String = {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy"
    return formatter.string(from: Foundation.Date())
}()
private let Year: String = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy"
    return formatter.string(from: Foundation.Date())
}()

let EnumName = "HTTPStatusCode"

public let FileHeader = makeLinesIntoComment(lines:
    "",
    "HTTPStatusCodes.swift",
    "",
    "Generated by Richard Hodgkins on \(Date).",
    "Copyright (c) \(Year) Richard Hodgkins. All rights reserved.",
    ""
)

public let Imports = text(
    "import Foundation"
)

public func createEnumHeaderComment(lastUpdated: String) -> String {
    return makeLinesIntoDocComment(lines:
        "HTTP status codes as per the \(createLink(text: "IANA HTTP status code registry", link: "http://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml")).",
        "",
        "Last updated: \(lastUpdated)",
        "",
        "- seealso: \(createLink(text: "Wikipedia page - List of HTTP status codes", link: "http://en.wikipedia.org/wiki/List_of_HTTP_status_codes"))",
        "- seealso: \(createLink(text: "HTTP protocol standard - Status Code Definitions", link: "https://tools.ietf.org/html/rfc2616#section-10"))"
    )
}

public let EnumDeclarationStart = "@objc public enum \(EnumName): Int {"

public let EnumDeclarationEnd = "}"

/// Allows conversions of special cases defined in the RFC spec.
let SpecialCaseNameLookup: [Int: String] = [
    :
]

public let ExtraCases = [
    
    // MARK: RFC
    
    Case(code: 418,
         name: "I'm A Teapot",
     comments:
        "Returned by tea pots requested to brew coffee",
        "",
        createSeeAlso(text: "RFC 2324", link: "http://www.iana.org/go/rfc2324")
    ),
    
    // MARK: ISS
    
    Case(code: 440,
         name: "IIS Login Timeout",
     comments:
        "The client's session has expired and must log in again.",
        "",
        "**Category**: Internet Information Services",
        "",
        createSeeAlso(text: "Error message when you try to log on to Exchange 2007 by using Outlook Web Access: \"440 Login Timeout\"", link: "http://support.microsoft.com/kb/941201/en-us")
    ),
    Case(code: 449,
        name: "IIS Retry With",
        comments:
        "The server cannot honour the request because the user has not provided the required information.",
        "",
        "**Category**: Internet Information Services",
        "",
        createSeeAlso(text: "2.2.6 449 Retry With Status Code", link: "https://msdn.microsoft.com/en-us/library/dd891478.aspx")
    ),
    
    // MARK: ngnix
    
    Case(code: 444,
         name: "nginx No Response",
     comments:
        "Used to indicate that the server has returned no information to the client and closed the connection.",
        "",
        "**Category**: nginx"
    ),
    Case(code: 495,
         name: "nginx SSL Certificate Error",
     comments:
        "An expansion of the 400 Bad Request response code, used when the client has provided an invalid client certificate.",
        "",
        "**Category**: nginx"
    ),
    Case(code: 496,
         name: "nginx SSL Certificate Required",
     comments:
        "An expansion of the 400 Bad Request response code, used when a client certificate is required but not provided.",
        "",
        "**Category**: nginx"
    ),
    Case(code: 497,
         name: "nginx HTTP To HTTPS",
     comments:
        "An expansion of the 400 Bad Request response code, used when the client has made a HTTP request to a port listening for HTTPS requests.",
        "",
        "**Category**: nginx"
    ),
    Case(code: 499,
         name: "nginx Client Closed Request",
     comments:
        "Used when the client has closed the request before the server could send a response.",
        "",
        "**Category**: nginx"
    ),
    
    // MARK: Other
    
    Case(code: 450,
         name: "Blocked by Windows Parental Controls",
     comments:
        "A Microsoft extension. This error is given when Windows Parental Controls are turned on and are blocking access to the given webpage."
    ),
    Case(code: 498,
         name: "Token Expired",
     comments:
        "Returned by \(createLink(text: "ArcGIS for Server", link: "https://en.wikipedia.org/wiki/ArcGIS_Server")). A code of 498 indicates an expired or otherwise invalid token.",
        "",
        createSeeAlso(text: "Using token-based authentication", link: "http://help.arcgis.com/en/arcgisserver/10.0/apis/soap/index.htm#Using_token_authentication.htm")
    ),
    Case(code: 530,
         name: "Site is frozen",
     comments:
        "Used by the \(createLink(text: "Pantheon", link: "https://en.wikipedia.org/wiki/Pantheon_(software)")) web platform to indicate a site that has been frozen due to inactivity."
    ),
    Case(code: 509,
         name: "Bandwidth Limit Exceeded",
     comments:
        "The server has exceeded the bandwidth specified by the server administrator; this is often used by shared hosting providers to limit the bandwidth of customers.",
        "",
        createSeeAlso(link: "https://documentation.cpanel.net/display/CKB/HTTP+Error+Codes+and+Quick+Fixes#HTTPErrorCodesandQuickFixes-509BandwidthLimitExceeded")
    ),
    Case(code: 599,
         name: "Network Connect Timeout Error",
     comments: "This status code is not specified in any RFCs, but is used by some HTTP proxies to signal a network connect timeout behind the proxy to a client in front of the proxy."
    )
]
