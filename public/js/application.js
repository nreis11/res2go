$(document).ready(function() {
  addReservoirLinkListener("#add-reservoir-btn");
  addFormListener();
  sessionButtonListener("#login-button");
  sessionButtonListener("#register-button");
});

var userHeader = $("#user-header");

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
      linkTarget.toggle();
      $("#add-reservoir-container").append(response);
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
      $("#new-reservoir-container").remove();
      $("#add-reservoir-btn").toggle();
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
      // $("#main-container").empty();
      $("#main-data-container").html(response);

    });

    request.fail(function(response) {
      alert("An error occured.");
    });
  });
};