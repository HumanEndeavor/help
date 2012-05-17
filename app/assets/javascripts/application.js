// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
//= require jquery
//= require jquery.min
//= require jquery-ui
//= require jquery-ui.min
//= require_self
//= require jquery.sizes
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .
//= require_jquery.hoverimagetext
jQuery(document).ready(function(){
displayOnMouseover() = function(){
  $(document).ready(function() {
  $('.swv li').HoverImageText();
  })
  }
  



jQuery(document).ready(function(){
    jQuery('input#education_search_id').live('click', function() {
        jQuery.ajax({
            url: jQuery('#frm_search_educations').attr("action"),
            data: jQuery('#frm_search_educations').serialize(),
            success: function(data){
                alert(data);
            },
            error: function() {
                alert('We had problems submitting your information. Please try again or email us at "Know Feedback"');
            },
            complete: function() {
            },
            type: "post"
        });
    });
});




