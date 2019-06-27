$(function () {
    console.log("LOADED: franchise.js")
    
    
    // Use JSON data to generate JSON items
    
    $(document).on('click', ".franchises", function (event) {
// console.log('listenForClick')
            event.preventDefault()
            // debugger
            $('div#drop_down').remove()
            var id = this.id
            getFranchise(id)
        })



    function getFranchise(id) {
        $.ajax({
            url:`http://localhost:3000/franchises/${id}`,
            method: 'get',
            dataType: 'json'
        }).done(function (data) {
            console.log("This franchise is: ", data)
            let myFranchise = new Franchise(data)
            let myFranchiseHTML = myFranchise.postHTML()
            // debugger
            $(`a#${id}.list_item`).append(myFranchiseHTML)
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
            this.adventures = obj.adventures
        }
    }

    //Fancy Prototype method to format Franchise JS Object's HTML!
    Franchise.prototype.postHTML = function () {
        const advs = this.adventures.map(adv => {
            // debugger
            
            return (`
            <li>
            ${adv.name}
            ${adv.location}
            ${adv.description}
            </li>
            `)
        }).join("")
        
        // console.log(advs)
        // sort advs by name should  happen in js not ruby

        return (`
        <div id='drop_down'>
            <h3>${this.name}</h3>
            <p>${this.company}</p>
            <p>${advs}</p>
        </div>
        `)
    }
})
