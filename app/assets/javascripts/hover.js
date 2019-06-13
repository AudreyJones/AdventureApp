document.addEventListener("turbolinks:load", function() {
    $(function () {
    console.log("LOADED: hover.js")
    listenForHover()
    });

function listenForHover() {
        $("a.nav").hover(handlerIn, function (event) {
            event.preventDefault()
            $('div#drop_down').remove()
            debugger
            var index = this.id
            getIndex(id)
        })
}

function getIndex(id) {
    $.ajax({
        url:`http://localhost:3000/${index}`,
        method: 'get',
        dataType: 'json'
    }).done(function (data) {
        // debugger
        console.log("This adventure is: ", data)
        // debugger
        let myAdventure = new Adventure(data)
        let myAdventureHTML = myAdventure.postHTML()
        $(`div#${id}`).append(myAdventureHTML)
    })
}