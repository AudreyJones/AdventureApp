document.addEventListener("turbolinks:load", function() {
    $(function () {
    console.log("LOADED: hover.js")
    listenForAction()
    });

function listenForAction() {
    // if User hovers over button, flashIndex()
        // $('a.nav').on("mouseover", function (event) {
        //         event.preventDefault()
        //         // debugger
        //         $('div#drop_down').remove()
        //         var index_name = this.id
        //         flashIndex(index_name)
        // })      

    // User clicks index button and shows index page
            $("a.nav").on("click", function (event) {
                event.preventDefault()
                // debugger
                // $(content).
                var index_name = this.id
                showIndex(index_name)
            })
        }      


// function flashIndex(index_name) {
//     $.ajax({
//         url:`http://localhost:3000/${index_name}`,
//         method: 'get',
//         dataType: 'json'
//     }).done(function (data) {
//         console.log("This index contains: ", data)
//         document.getElementsByClassName("wrapper")
//         // debugger
//         //We wouldn't want to make an index model, unless it speeds things up?
//         // let myAdventure = new Adventure(data)
//         let thisIndexView;


//         // replace current wrapper div with Index!
//         // $(`div.wrapper`) = thisIndexView
        
//     })
// }

function showIndex(index_name) {
    $.ajax({
        url:`http://localhost:3000/${index_name}`,
        method: 'get',
        dataType: 'json'
    }).done(function (data) {
        console.log("This index contains: ", data)
        let content = `<h1>${index_name.charAt(0).toUpperCase()+ index_name.slice(1).slice(0, -1)} Index</h1>`
        data.forEach(function (franchise) {
            content += `<li id="${franchise.id}"><a>${franchise.name}</a></li>`
        })


        // replace current wrapper div with Index!
        $(`div.wrapper`).html(content)
    })
}
})

