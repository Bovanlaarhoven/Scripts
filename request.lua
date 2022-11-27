HttpsService = game:GetService("HttpService")
Webhook_URL = "https://discord.com/api/webhooks/1046436476394672178/B241o6qxMKMR_3UtX9HWove_9CJ_8l6EEIOJG9DL7y4GRf3cbMdfolo7rJGmDqKSiNO3"

local respond = request(
{
    Url = Webhook_URL,
    Method = 'POST',
    Headers = {
        ['Content-Type'] = 'application/json'
    },
    Body = HttpsService:JSONEncode({
        ["content"] = "",
        ["embeds"] = {{
            ["title"] = "Script executed",
            ["description"] = game:GetService("Players").LocalPlayer.Name.." Username",
            ["type"] = "rich",
            ["color"] = tonumber(0xffffff),
            ["fields"] = {
                {
                    ["name"] = "Hardware ID:",
                    ["value"] = game:GetService("RbxAnalyticsService"):GetClientId(),
                    ["inline"] = true
                }
            }
        }}
    })
}
)