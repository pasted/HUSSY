// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function checkChar(limit, currentId, nextId) {
  var element = document.getElementById(currentId);
  if (element.value.length >= limit) {
    document.getElementById(nextId).focus();
  }
}

$(document).ready(function() {
  $('a#add-travel').click(function() {
    $('#travel_list li:first').clone().find('input').val('').end().appendTo('#travel_list');
   });
  
  $('.delete-travel').live('click', function() {
    if ($('#travel_list li').length > 1)
     $(this).parent().parent().remove();
    else
     alert('No travel items listed.');
   });
  
  $('a#add-contact').click(function() {
    $('#contact_list li:first').clone().find('input').val('').end().appendTo('#contact_list');
  });
  
  $('.delete-contact').live('click', function() {
  	if ($('#contact_list li').length > 1)
         $(this).parent().parent().remove();
        else
         alert('No contact items listed.');
  });

});
