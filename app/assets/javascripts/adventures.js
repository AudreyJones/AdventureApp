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
        // debugger
        this.id = obj.id
        this.name = obj.name
        this.location = obj.location
    }
}

//Fancy Prototype method to format Adventure JS Object's HTML for DOM reveal/show
Adventure.prototype.postHTML = function () {
    return (`
    <div id='drop_down'>
        <h3>${this.name}</h3>
        <p>${this.location}</p>
    </div>
    `)
}

// Prototype method to reveal new Adventure Form and pass to factory 
// Adventure.prototype.newAdventureForm = function () {
//     // Upon clicking "Create new Adventure" button...
//     $("a#new_adv").on('click', function (event) {
//     // Show me the new Adventure Form!
//     return (`
//     <div id='adv_form'>
//         <strong>New Adventure Form: </strong>


//     </div>
//     `)
// }




// Adventure.prototype.adventureNewForm = function () {
//     return (`
//         <strong>New Adventure Form: </strong>
//         <form_for @adventure do |f|>
//             <div class="field">
//                 < f.label :name %><br />
//                 < f.text_field :name, autofocus: true, autocomplete: "name" >
//             </div>
//             <br />
//             <div class="field">
//                 < f.label :location ><br />
//                 < f.text_field :location, autofocus: true, autocomplete: "location" >
//             </div>
//             <br />
//             <div class="field">
//                 < f.label :description ><br />
//                 < f.text_area :description, cols: "30", rows: "10" >
//             </div>
//             <br />
//             <div class="field">
//                 < if @franchise != nil >
//                     < f.label "#{@franchise.name} Franchise">
//                     < f.hidden_field :franchise_id, :value => @franchise.id >
//                 < else >
//                     < f.label 'Franchise' ><br />
                    // < f.collection_select(:franchise_id, Franchise.all, :id, :name) >
//                 < end >
//             </div>
//             <br />
//             <div class="field">
//                 < f.label 'Villain' ><br />
//                 < f.collection_select(:villain_id, Villain.all, :id, :name) >
//             </div>
//             <br />
//             <div class="field">
//             < f.label 'Hero' >
//             < f.hidden_field :user_id, :value => current_user.id >
//             </div>
//             <div class="actions">
//                 < f.submit "Create Adventure" >
//             </div>
//         <% end %>
//     `)
    
// }




})