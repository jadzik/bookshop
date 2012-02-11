$(document).ready ->
    $("#nav .expander").live "click", (event) ->
        Menu.dropDown(event)


window.Menu = {

    dropDown: (event) ->
        event.preventDefault()
        event.stopPropagation()
        t = $(event.currentTarget)
        t.toggleClass("open")
        list = t.siblings("ul")
        if list.is(":visible")
            list.slideUp()
        else
            list.slideDown()

}