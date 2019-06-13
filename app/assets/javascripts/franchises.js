document.addEventListener("turbolinks:load", function() {
    $(function () {
    console.log("LOADED: franchise.js")
    listenForClick()
    });

// Use JSON data to generate JSON items
function listenForClick() {
    $("a.fran").on('click', function (event) {
        event.preventDefault()
        $('div#drop_down').remove()
        var id = this.id
        getFranchise(id)
    })
}


function getFranchise(id) {
    $.ajax({
        url:`http://localhost:3000/franchises/${id}`,
        method: 'get',
        dataType: 'json'
    }).done(function (data) {
        console.log("This franchise is: ", data)
        let myFranchise = new Franchise(data)
        let myFranchiseHTML = myFranchise.postHTML()
        $(`div#${id}`).append(myFranchiseHTML)
    })
}

// const allFranchises = []

// We are turning our JSON retrieved data and turning it into a JS Object in order to organize
// and access the object more quickly for rendering dynamic JS
class Franchise {
    constructor(obj) {
        // debugger
        this.id = obj.id
        this.name = obj.name
        this.company = obj.company
        // allFranchises << this
    }
}

//Fancy Prototype method to format Franchise JS Object's HTML!
Franchise.prototype.postHTML = function () {
    return (`
    <div id='drop_down'>
        <h3>${this.name}</h3>
        <p>${this.company}</p>
    </div>
    `)
}

// No need for a newFranchiseForm....user should be unable to create a Franchise
})