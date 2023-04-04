function producer()
  for i = 1, 5 do
    coroutine.yield(i)
  end
end

function consumer(producer_co)
  while true do
    local success, value = coroutine.resume(producer_co)
    if coroutine.status(producer_co) == "suspended" then
        print("Consumed:", value)
    else
        break;
    end
  end
end

local producer_co = coroutine.create(producer)
print(coroutine.status(producer_co))
consumer(producer_co)
