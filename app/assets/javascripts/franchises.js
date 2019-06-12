document.addEventListener("turbolinks:load", function() {
    $(function () {
    console.log("LOADED: franchise.js")
    listenForHover()
    });

// Use JSON data to generate JSON items
function listenForHover() {
    $("a").on('mouseover', function (event) {
        event.preventDefault()
        getFranchise()
    })
}


function getFranchise() {
    $.ajax({
        url:'http://localhost:3000/franchises',
        method: 'get',
        dataType: 'json'
    }).done(function (data) {
        console.log("The data is: ", data)
        let myFranchise = new Franchise(data[0])
        let myFranchiseHTML = myFranchise.postHTML()
        document.querySelector(`div#${id}`).innerHTML += myFranchiseHTML
    })
}

const allFranchises = []

// We are turning our JSON retrieved data and turning it into a JS Object in order to organize
// and access the object more quickly for rendering dynamic JS
class Franchise {
    constructor(obj) {
        this.id = obj.id
        this.name = obj.name
        this.company = obj.company
        allFranchises << obj
    }
}

//Fancy Prototype method to format Franchise JS Object's HTML!
Franchise.prototype.postHTML = function () {
    return (`
    <div>
        <h3>${this.name}</h3>
        <p>${this.company}</p>
    </div>
    `)
}

// No need for a newFranchiseForm....user should be unable to create a Franchise
})