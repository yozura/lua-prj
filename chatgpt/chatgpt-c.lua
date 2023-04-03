-- libs
local http = require("socket.http")
local ltn12 = require("ltn12")
local dkjson = require("dkjson")

-- func
function chat(prompt, api_key)
    local url = "https://api.openai.com/v1/chat/completions"
    local headers = {
        ["Content-Type"] = "application/json",
        ["Authorization"] = "Bearer " .. api_key
    }
    local payload = {
        model = "gpt-3.5-turbo",
        messages = { 
            {
                role = "user",
                content = prompt
            }
        }
    }
    local res_body = {}

    local body, status_code, headers, status_line = http.request {
        url = url,
        method = "POST",
        headers = headers,
        source = ltn12.source.string(dkjson.encode(payload)),
        sink = ltn12.sink.table(res_body)
    }

    if status_code ~= 200 then
        error("API Request Failed: " .. table.concat(res_body))
    end

    local res = dkjson.decode(table.concat(res_body))
    return res.choices[1].message.content
end

