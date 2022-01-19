---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by shishaodong.
--- DateTime: 2022/1/14 9:46 AM
---
local threshold = tonumber(ARGV[2]);
local exe = redis.call("SETNX", KEYS[1], 1);
if exe == 1 then
    redis.call("EXPIRE", KEYS[1], ARGV[1]);
    return 0;
else
    local redisData = redis.call("INCR", KEYS[1])
    return redisData > threshold;
end