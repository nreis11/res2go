$(document).ready(function() {
  addReservoirLinkListener("#add-reservoir");
  addFormListener();
  sessionButtonListener("#login-button");
  sessionButtonListener("#register-button");

});

var addReservoirLinkListener = function(link) {
  $(link).on("click", function() {
    event.preventDefault();

    var linkTarget = $(this);
    var address = linkTarget.attr("href");
    var method = "GET";

    var request = $.ajax({
      url: address,
      method: method
    });

    request.done(function(response) {
      $("#add-reservoir-container").append(response);
      linkTarget.hide();
    });
  });
};
var addFormListener = function() {
  $("#add-reservoir-container").on("submit", "#threshold-form", function(event) {
    event.preventDefault();

    var addFormTarget = $(this);
    var address = addFormTarget.attr("action");
    var method = addFormTarget.attr("method");
    var data = addFormTarget.serialize();

    var request = $.ajax({
      url: address,
      method: method,
      data: data
    });

    request.done(function(response) {
      $(".reservoir-list").append(response);
      addFormTarget.hide();
      $("#instructions").hide();
      $("#add-reservoir").show();
    });
  });
};

var sessionButtonListener = function(sessionButton) {
  $(sessionButton).on("click", function(event) {
    event.preventDefault();

    var sessionButton = $(this);
    var address = sessionButton.attr("href");

    var request = $.ajax({
      url: address,
      method: "GET"
    });

    request.done(function(response) {
      // console.log(response)

      $("#main-title").append(response);
      $("#main-container").css("z-index", "0");

    });

    request.fail(function(response) {
      alert("An error occured.");
    });
  });

};
