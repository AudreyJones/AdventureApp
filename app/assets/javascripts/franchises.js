$(function () {
    console.log("LOADED: franchise.js")
    listenForClick()
    
    // Use JSON data to generate JSON items
    function listenForClick() {
        // debugger
        console.log('listenForClick')
        $(`li a#list_item.list_item`).on('click', function (event) {
            event.preventDefault()
            debugger
            $('div#drop_down').remove()
            // var id = this.id
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

    // We are turning our JSON retrieved data and turning it into a JS Object in order to organize
    // and access the object more quickly for rendering dynamic JS
    class Franchise {
        constructor(obj) {
            // debugger
            this.id = obj.id
            this.name = obj.name
            this.company = obj.company
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
})
