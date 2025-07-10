function search()
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

    local data = res.data:gsub(">%s+<", "><");
    data = data:gsub('class="link"%s+href="(.-)"', 'onclick="event.preventDefault();document.querySelector(`query`).value=`%1`.split(`/`).slice(-1)[0];document.querySelector(`search`).click()"')

    get('titl').set_contents(res.title)
    get('txt').set_contents(data)
end

get('search').on_click(function()
    search()
end)
get('query').on_submit(function()
    search()
end)