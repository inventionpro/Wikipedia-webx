get('search').on_click(function()
    local res = fetch({
        url = "https://api.fsh.plus/wikipedia?page=" .. get('query').get_contents(),
        method = "GET"
    })

    get('title').set_contents(res.title)
    get('text').set_contents(res.data)
end)
