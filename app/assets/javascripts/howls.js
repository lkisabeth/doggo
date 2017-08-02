var loadFile = function(event) {
  var output = document.getElementById('image-preview');
  output.src = URL.createObjectURL(event.target.files[0]);
};


function Howl(attributes) {
  this.id = attributes.id
  this.image = attributes.image
  this.caption = attributes.caption
  this.user = attributes.user
  this.barkbacks = attributes.barkbacks
}

Howl.succes = function(json) {
  var howl = new Howl(json)
  var howlDiv = user.renderDiv();
  
}


$(document).ready(function(){
  $("getJsonBtn").on('click', function(e) {
    debugger
    e.preventDefault()
    var path = this.href;

    $.ajax({
      url: path,
      dataType: 'json',
      method: 'GET'
    })
    .success(Howl.success)
    .error(Howl.error)
  })
})
