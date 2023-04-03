#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>

int main()
{
    lua_State *L = luaL_newstate();
    luaL_openlibs(L);
    char buf[512];
    char *api_key;

    if (luaL_dofile(L, "chatgpt-c.lua")) 
    {
        printf("Error loading script: %s\n", lua_tostring(L, -1));
        lua_close(L);
        return 1;
    }

    api_key = getenv("CHATGPT_API_KEY");
    printf("You can text with ChatGPT!\n");
    printf("Your API Key: %s\n", api_key);
    while (1)
    {
        // Call Lua function
        lua_getglobal(L, "chat");
        if (!lua_isfunction(L, -1))
        {
            printf("Error loading function: %s\n", lua_tostring(L, -1));
            lua_close(L);
            return 1;
        }

        printf("You: ");
        fgets(buf, sizeof(buf), stdin);
        int len = strlen(buf);
        buf[len + 1] = '\0';
        
        lua_pushstring(L, buf);
        lua_pushstring(L, api_key);
        if (lua_pcall(L, 2, 1, 0))
        {
            printf("Error pcall: %s\n", lua_tostring(L, -1));
            lua_close(L);
            return 1;
        }

        const char *res = lua_tostring(L, -1);
        printf("ChatGPT: %s\n", res);
        lua_pop(L, 1);
    }

    lua_close(L);
    return 0;
}
