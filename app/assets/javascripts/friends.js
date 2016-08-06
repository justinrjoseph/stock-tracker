$(function() {
   
  lookupFriend();
    
});

var lookupFriend ;

lookupFriend = function() {
  $('#friend-lookup-form').on('ajax:before', function(event, data, status) {
    showSpinner();
  }).on('ajax:after', function(event, data, status) {
    hideSpinner();
  });
  
  $('#friend-lookup-form').on('ajax:success', function(event, data, status) {
    $('#friend-lookup').replaceWith(data);
    lookupFriend();
  }).on('ajax:error', function(event, data, status) {
    hideSpinner();
    $('#friend-lookup-results').replaceWith(' ');
    $('#friend-lookup-errors').replaceWith('<div class="col-md-12 alert alert-danger">User was not found.</div>');
  });
}