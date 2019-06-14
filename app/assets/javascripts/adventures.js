document.addEventListener("turbolinks:load", function() {
    $(function () {
    console.log("LOADED: adventure.js")
    listenForClick()
    });

// Use JSON data to generate JSON items
function listenForClick() {
    $("a.adv").on('click', function (event) {
        event.preventDefault()
        $('div#drop_down').remove()
        var id = this.id
        getAdventure(id)
    })
}

// Listener for new form submission:
    $(`form#new_adventure`).on('submit', function(e) {
        e.preventDefault()
        // console.log("submitting adventure")
        // debugger
            // this is the form itself!
        const values = $(this).serialize()

        $.post('/adventures', values)
        .done(function (data) {
            // Provides us a nice JSON-formatted object containing all of our form data!
            $('div.wrapper').html(``)
            const newAdventure = new Adventure(data)
            const htmlToAdd = newAdventure.postHTML()
            $('div.wrapper').html(htmlToAdd)

        })
    })

// AJAX get request to pull data from database in JSON format, create new JS object, and append to DOM(show)
function getAdventure(id) {
    $.ajax({
        url:`http://localhost:3000/adventures/${id}`,
        method: 'get',
        dataType: 'json'
    }).done(function (data) {
        console.log("This adventure is: ", data)
        let myAdventure = new Adventure(data)
        let myAdventureHTML = myAdventure.postHTML()
        $(`div#${id}`).append(myAdventureHTML)
    })
}

// Adventure JS Object Factory
class Adventure {
    constructor(obj) {
        this.id = obj.id
        this.name = obj.name
        this.location = obj.location
        this.description = obj.description
    }
}

//Fancy Prototype method to format Adventure JS Object's HTML for DOM reveal/show
Adventure.prototype.postHTML = function () {
    return (`
    <div id='drop_down'>
        <h3>${this.name}</h3>
        <p>${this.location}</p>
        <p>${this.description}</p>
    </div>
    `)
}

})