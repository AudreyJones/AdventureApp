// document.addEventListener("turbolinks:load", function() {
//     $(function () {
//     console.log("LOADED: current_adventures.js")
//     listenForClick()
//     });

// // Use JSON data to generate JSON items
// function listenForClick() {
//     $("a.curr").on('click', function (event) {
//         event.preventDefault()
//         $('div#drop_down').remove()
//         var id = this.id
//         getCurrentAdventure(id)
//     })
// }


// function getCurrentAdventure(id) {
//     $.ajax({
//         url:`http://http://localhost:3000/devise/registrations/dashboard`,
//         method: 'get',
//         dataType: 'json'
//     }).done(function (data) {
//         debugger
//         console.log("This current adventure is: ", data)
//         // debugger
//         let myCurrentAdventure = new CurrentAdventure(data)
//         let myCurrentAdventureHTML = myCurrentAdventure.postHTML()
//         $(`div#${id}`).append(myCurrentAdventureHTML)
//     })
// }

// // We are turning our JSON retrieved data and turning it into a JS Object in order to organize
// // and access the object more quickly for rendering dynamic JS
// class Villain {
//     constructor(obj) {
//         // debugger
//         this.id = obj.id
//         this.name = obj.name
//         this.abilities = obj.abilities
//         this.catchphrase
//     }
// }

// //Fancy Prototype method to format Villain JS Object's HTML!
// Villain.prototype.postHTML = function () {
//     return (`
//     <div id='drop_down'>
//         <h3>${this.name}</h3>
//         <p>${this.abilities}</p>
//         <p>${this.catchphrase}</p>
//     </div>
//     `)
// }
    
// })