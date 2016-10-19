$(document).ready(function() {
  addReservoirLinkListener("#add-reservoir")

});

var addReservoirLinkListener = function(link) {
  $(link).on("click", function() {
    console.log(this)
    event.preventDefault()

    var linkTarget = $(this);
    var address = linkTarget.attr("href");
    var method = "GET";

    var request = $.ajax({
      url: address,
      method: method
    })

    request.done(function(response) {
      // console.log('Success!')
      $(".reservoir-container").append(response)
      linkTarget.hide()
    })
    // TODO: Add ajax to new reservoir form
  })
}
