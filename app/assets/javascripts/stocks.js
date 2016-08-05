$(function() {
   
  lookupStock();
    
});

var lookupStock ;

lookupStock = function() {
 $('#stock-lookup-form').on('ajax:success', function(event, data, status) {
    $('#stock-lookup').replaceWith(data);
    lookupStock();
 }).on('ajax:error', function(event, data, status) {
   $('#stock-lookup-results').replaceWith(' ');
   $('#stock-lookup-errors').replaceWith('<p class="alert alert-danger">Stock was not found.</p>');
 });
  
  
}