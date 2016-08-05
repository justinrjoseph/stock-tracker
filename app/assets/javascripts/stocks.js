$(function() {
   
  lookupStock();
    
});

var lookupStock ;

lookupStock = function() {
  $('#stock-lookup-form').on('ajax:before', function(event, data, status) {
    showSpinner();
  }).on('ajax:after', function(event, data, status) {
    hideSpinner();
  });
  
  $('#stock-lookup-form').on('ajax:success', function(event, data, status) {
    $('#stock-lookup').replaceWith(data);
    lookupStock();
  }).on('ajax:error', function(event, data, status) {
    hideSpinner();
    $('#stock-lookup-results').replaceWith(' ');
    $('#stock-lookup-errors').replaceWith('<div class="col-md-12 alert alert-danger">Stock was not found.</div>');
  });
}