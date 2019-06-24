    $(function () {
    console.log("LOADED: hover.js")
    listenForAction()

function listenForAction() {

    // User clicks index button and shows index page
            $("a.nav").on("click", function (event) {
                event.preventDefault()
                // debugger
                // $(content).
                var index_name = this.id
                showIndex(index_name)
            })
        }      

function showIndex(index_name) {
    $.ajax({
        url:`http://localhost:3000/${index_name}`,
        method: 'get',
        dataType: 'json'
    }).done(function (data) {
        console.log("This index contains: ", data)
        let content = `<h1>${index_name.charAt(0).toUpperCase()+ index_name.slice(1).slice(0, -1)} Index</h1>`
        data.forEach(function (list_item) {
            content += `<li class="${index_name}" id="${list_item.id}"><a class='list_item' id='${list_item.id}'>${list_item.name}</a></li>`
        })
        // replace current wrapper div with Index!
        $(`div.wrapper`).html(content)
    })
}
})

