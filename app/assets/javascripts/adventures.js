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


function getAdventure(id) {
    $.ajax({
        url:`http://localhost:3000/adventures/${id}`,
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

// We are turning our JSON retrieved data and turning it into a JS Object in order to organize
// and access the object more quickly for rendering dynamic JS
class Adventure {
    constructor(obj) {
        // debugger
        this.id = obj.id
        this.name = obj.name
        this.location = obj.location
    }
}

//Fancy Prototype method to format Adventure JS Object's HTML!
Adventure.prototype.postHTML = function () {
    return (`
    <div id='drop_down'>
        <h3>${this.name}</h3>
        <p>${this.location}</p>
    </div>
    `)
}

Adventure.prototype.adventureNewForm = function () {
    return (`
        <strong>New Adventure Form: </strong>
        <form_for @adventure do |f|>
            <div class="field">
                < f.label :name %><br />
                < f.text_field :name, autofocus: true, autocomplete: "name" >
            </div>
            <br />
            <div class="field">
                < f.label :location ><br />
                < f.text_field :location, autofocus: true, autocomplete: "location" >
            </div>
            <br />
            <div class="field">
                < f.label :description ><br />
                < f.text_area :description, cols: "30", rows: "10" >
            </div>
            <br />
            <div class="field">
                < if @franchise != nil >
                    < f.label "#{@franchise.name} Franchise">
                    < f.hidden_field :franchise_id, :value => @franchise.id >
                < else >
                    < f.label 'Franchise' ><br />
                    < f.collection_select(:franchise_id, Franchise.all, :id, :name) >
                < end >
            </div>
            <br />
            <div class="field">
                < f.label 'Villain' ><br />
                < f.collection_select(:villain_id, Villain.all, :id, :name) >
            </div>
            <br />
            <div class="field">
            < f.label 'Hero' >
            < f.hidden_field :user_id, :value => current_user.id >
            </div>
            <div class="actions">
                < f.submit "Create Adventure" >
            </div>
        <% end %>
    `)
    
}




})