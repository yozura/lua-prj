#include <stdio.h>
#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>

int multiply(lua_State *L)
{
    int a = luaL_checkinteger(L, 1); // First Argument
    int b = luaL_checkinteger(L, 2); // Second Argument
                                     
    lua_pushinteger(L, a * b);       // Push result on Stack
    return 1;                        // Result count
}

int main()
{
    lua_State *L = luaL_newstate();
    luaL_openlibs(L);

    // Regist C function
    lua_register(L, "multiply", multiply);

    if (luaL_dofile(L, "example.lua")) 
    {
        printf("Error loading script: %s\n", lua_tostring(L, -1));
        lua_close(L);
        return 1;
    }

    // Call Lua function
    lua_getglobal(L, "add");
    if (!lua_isfunction(L, -1))
    {
        printf("Error loading script: %s\n", lua_tostring(L, -1));
        lua_close(L);
        return 1;
    }

    lua_pushinteger(L, 3);
    lua_pushinteger(L, 4);

    if (lua_pcall(L, 2, 1, 0))
    {
        printf("Error loading script: %s\n", lua_tostring(L, -1));
        lua_close(L);
        return 1;
    }

    int result = lua_tointeger(L, -1);
    printf("Result from Lua 'add': %d\n", result);

    lua_close(L);
    return 0;
}
