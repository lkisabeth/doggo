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

Howl.success = function(json) {
  console.log(json)

  $('#jsonDiv').append(
    '<p>' + json.user.doggo_name + '</p>'
  );
}

Howl.error = function(response) {
  console.log("Uh oh..", response)
}

function responseHandler(res) {
  var flatArray = [];
  $.each(res, function(i, el) {
    flatArray.push(JSON.flatten(el));
  });
  return flatArray
}

$(document).ready(function(){
  $("#getJsonBtn").on('click', function(e) {
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
