local Request = (syn and syn.request or request or http and http.request or http_request) or error("No request function found")
    local no
    no = hookfunction(Request, function(...)
    local Args = {...}
    local Self = Args[1]
    if string.find(Self['Url'], 'rpc') then
    return rconsoleprint('lol no\n')
    end
    return no(...)
    end)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/SpaceHubLoader"))()
    setclipboard(_G.Key)