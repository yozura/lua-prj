-- libs
local http = require("socket.http")
local ltn12 = require("ltn12")
local dkjson = require("dkjson")

-- env
local api_key = os.getenv("CHATGPT_API_KEY")

-- func
local function chat(prompt)
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

print("You can text with ChatGPT!")
print("Your API Key : " .. api_key)
while true do
    io.write("You: ")
    local prompt = io.read()
    local response = chat(prompt)
    print("ChatGPT: " .. response)
end

