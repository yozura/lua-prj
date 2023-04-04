local sandbox_env = {
    print = print,
    tonumber = tonumber,
    tostring = tostring,
    ipairs = ipairs,
    pairs = pairs,
    type = type,
}

local code = "print('Hello from Sandbox'); os.execute('rm -rf /');"

local function run_sandboxed(code, env)
    local f, err = load(code, nil, 't', env)
    
    if f then
        local status, result = pcall(f)
        if status then
            return result
        else
            error("Error in sandboxed code: " .. tostring(result))
        end
    else
        error("Error compiling code: " .. tostring(err))
    end
end

run_sandboxed(code, sandbox_env)

