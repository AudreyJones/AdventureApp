document.addEventListener("turbolinks:load", function() {
    $(function () {
    console.log("LOADED: villain.js")
    listenForClick()
    });

// Use JSON data to generate JSON items
function listenForClick() {
    $("a.vill").on('click', function (event) {
        event.preventDefault()
        $('div#drop_down').remove()
        var id = this.id
        getVillain(id)
    })
}


function getVillain(id) {
    $.ajax({
        url:`http://localhost:3000/villains/${id}`,
        method: 'get',
        dataType: 'json'
    }).done(function (data) {
        // debugger
        console.log("This villain is: ", data)
        // debugger
        let myVillain = new Villain(data)
        let myVillainHTML = myVillain.postHTML()
        $(`div#${id}`).append(myVillainHTML)
    })
}

// We are turning our JSON retrieved data and turning it into a JS Object in order to organize
// and access the object more quickly for rendering dynamic JS
class Villain {
    constructor(obj) {
        // debugger
        this.id = obj.id
        this.name = obj.name
        this.abilities = obj.abilities
        this.catchphrase
    }
}

//Fancy Prototype method to format Villain JS Object's HTML!
Villain.prototype.postHTML = function () {
    return (`
    <div id='drop_down'>
        <h3>${this.name}</h3>
        <p>${this.abilities}</p>
        <p>${this.catchphrase}</p>
    </div>
    `)
}
    
})