$( document ).ready(function() {
  $('.moar-barkbacks').click( function() {
    $(this).on('ajax:success', function(event, data, status, xhr) {
      var howlId = $(this).data("howl-id");
      $("#barkbacks_" + howlId).html(data);
      $("#barkbacks-paginator-" + howlId).html("<a id='moar-barkbacks' data-howl-id=" + howlId + "data-type='html' data-remote='true' href='/howls/" + howlId + "/barkbacks>show moar barkbacks</a>");
    });
  });
});
