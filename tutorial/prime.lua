function find_prime(n)
    local numbers = {}
    for i = 2, n do
        numbers[i] = true
    end

    local prime = 2
    while prime * prime <= n do
        if numbers[prime] then
            local multiple = prime * prime
            while multiple <= n do
                numbers[multiple] = false
                multiple = multiple + prime
            end
        end
        prime = prime + 1
    end

    local primes = {}
    for i = 2, n do
        if numbers[i] then
            table.insert(primes, i)
        end
    end

    return primes
end

local num_primes = tonumber(arg[1]) or 1000
local start_time = os.clock()
local primes = find_prime(num_primes)
local end_time = os.clock()
print("Primes found: " .. #primes)
print("Elapsed time: " .. (end_time - start_time) .. " seconds")

