$(document).ready(function(){
  var placeholder = null;
  $('input[type=text]').focus(function(){
    placeholder = $(this).attr("placeholder");
    $(this).attr("placeholder","");
  });
  $('input[type=text]').blur(function(){
    $(this).attr("placeholder", placeholder);
  });
});