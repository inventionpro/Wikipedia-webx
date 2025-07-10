get('search').on_click(function()
    local extra = '&lang=' .. get('lang').get_contents();
    if window ~= nil then
        if window.browser == 'bussinga' then
            extra = extra .. '&html=true'
        end
    end
    local res = fetch({
        url = "https://api.fsh.plus/wikipedia?page=" .. get('query').get_contents() .. extra,
        method = "GET",
        headers = { ["Content-Type"] = "application/json" },
        body = ''
    })

    get('titl').set_contents(res.title)
    get('txt').set_contents(res.data:gsub(">%s+<", "><"))
end)