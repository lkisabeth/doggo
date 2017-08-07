function Barkback(attributes){
  this.content = attributes.content;
  this.id = attributes.id;
  this.howl = attributes.howl;
  this.user = attributes.user;
}

// Barkback Class Methods

Barkback.error = function(response){
  console.log("Something went wrong...", response)
}

// Barkback Instance Methods
Barkback.prototype.renderToElement = function(element){
  element.append(
    `<div class="" id="barkback">
      <p class="barkback-content"><span class="doggo-name"><a href="/${this.user.doggo_name}">${this.user.doggo_name}</a></span> ${this.content}</p>
      <a data-confirm="Muzzle this barkback? Are you sure?" data-remote="true" rel="nofollow" data-method="delete" href="/howls/${this.howl.id}/barkbacks/${this.id}">
        <span class="glyphicon glyphicon-remove delete-barkback-icon"></span>
      </a>
    </div>`
  );
}

// Event Listeners
var attachBarkbackFormListener = () => {
  $(document).on("submit", "form#new_barkback", function(e){
    e.preventDefault();
    var barkback = $(this).serialize();
    const { howlId } = this.dataset;
    BarkbackService.createBarkback(howlId, barkback, renderNewBarkback)
  })
}

var attachLoadBarkbacksListener = () => {
  $(document).on("click", "button#load_barkbacks", function(e){
    e.preventDefault();
    const { howlId } = this.dataset;
    BarkbackService.getBarkbacks(howlId, renderBarkbacks);
  })
}

// Barkback API Service
const BarkbackService = {
  getBarkbacks(howlId, callback) {
    $.ajax({
      url: `/howls/${howlId}/barkbacks`,
      method: "GET",
      dataType: "json"
    })
    .success(barkbacks => callback(howlId, barkbacks))
    .error(Barkback.error)
  },

  createBarkback(howlId, barkbackData, callback) {
    $.ajax({
      url: `/howls/${howlId}/barkbacks`,
      method: "POST",
      dataType:"json",
      data: barkbackData
    })
    .success(barkback => callback(howlId, barkback))
    .error(Barkback.error)
  }
}

// DOM Manipulation Functions
const renderBarkbacks = (howlId, barkbacks) => {
  $("#load_barkbacks").remove();
  const element = $(`#barkbacks_${howlId}`);
  barkbacks.forEach(barkbackAttributes => {
    const barkback = new Barkback(barkbackAttributes);
    barkback.renderToElement(element)
  })
}

const renderNewBarkback = (howlId, barkback) => {
  $(`#barkback_content_${howlId}`).val('')
  const element = $(`#barkbacks_${howlId}`);
  const barkback = new Barkback(barkbackAttributes);
  barkback.renderToElement(element)
}

// ON Page Load
$(function(){
  attachBarkbackFormListener();
  attachLoadBarkbacksListener();
})
