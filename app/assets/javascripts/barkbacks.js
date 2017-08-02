function Barkback(attributes){
  this.content = attributes.content;
  this.id = attributes.id;
  this.howl = attributes.howl;
  this.user = attributes.user;
}

Barkback.success = function(json){
  var barkback = new Barkback(json);
  var barkbackDIV = barkback.renderDIV();

  $("#barkbacks_" + json.howl.id).append(barkbackDIV)
  $("#barkback_content_" + json.howl.id).val('')
}

Barkback.error = function(response){
  console.log("Something went wrong...", response)
}

$(function(){
  Barkback.templateSource = $('#barkback-template').html()
  Barkback.template = Handlebars.compile(Barkback.templateSource);
  setBarkbackJsModel();
})

Barkback.prototype.renderDIV = function(){
  return Barkback.template(this);
}

var setBarkbackJsModel = () => {
  $(document).on("submit", "form#new_barkback", function(e){
    e.preventDefault();
    var $form = $(this);
    var action = $form.attr("action");
    var params = $form.serialize();

    $.ajax({
      url: action,
      data: params,
      dataType: "json",
      method: "POST"
    })
    .success(Barkback.success)
    .error(Barkback.error)
  })
}
