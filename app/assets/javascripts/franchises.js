$(function () {
    console.log('franchises.js is loaded!')
});

function listenForClick() {
    $().on('click', function (event) {
        event.preventDefault()
        getFranchises()
    })
}

function getFranchises() {
    $.ajax({
        url:'http://localhost:3000/franchises',
        method: 'get',
        dataType: 'json'
    }).done(function (data)) {
        console.log("The data is: ", data)
        let myFranchise = new Franchise(data[0])
        let myFranchiseHTML = myFranchise.postHTML()
        document.getElementById()
    }
}

class Franchise {
    constructor(obj) {
        this.id = obj.id
        this.name = obj.name
        
    }
}