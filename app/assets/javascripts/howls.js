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

  $('#jsonDiv').addClass("jsonDiv panel panel-primary").append(
    '<div class="panel-heading">JSON Response Data</div>',
    '<div class="panel-body">',
    '<p>Doggo name: ' + json.user.doggo_name + '</p>',
    '<p>Human name: ' + json.user.human_name + '</p>',
    '<p>Bio: ' + json.user.bio + '</p>',
    '<p>Image: ' + json.image + '</p>',

    '<p>Barkbacks: </p>',
    $.map(json.barkbacks, function(barkback, i) {
      return '<p>  -' + barkback.content + '</p>';
    }),
    '</div>'
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
