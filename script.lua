get('search').on_click(function()
    local extra = '';
    if window.browser == 'bussinga' then
        extra = '&html=true'
    end
    local res = fetch({
        url = "https://api.fsh.plus/wikipedia?page=" .. get('query').get_contents() .. extra,
        method = "GET"
    })

    get('title').set_contents(res.title)
    get('text').set_contents(res.data)
end)
