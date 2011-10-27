//jQuery.noConflict();
jQuery(document).ready(function() {

    jQuery( "#age-range-slider" ).slider({
        orientation: "horizontal",
        animate: true,
        max: 30,
        min: 0,
        step: 1,
        range: true,
        values: [5, 10],
        slide: function(e, u) {
                    jQuery( "#lower_age" ).val = u.values[0];
                    jQuery( "#upper_age" ).val = u.values[1];
                    jQuery( "#age-range" ).html( u.values[ 0 ] + " - " + u.values[ 1 ] + " yrs" );
                }
    });
    jQuery("#age-range").html(jQuery("#age-range-slider").slider("values", 0)+" - "+jQuery("#age-range-slider").slider("values", 1)+" yrs");

});

function ajax_call_for_states(ngo, states_url)     {
    var inputs = new Object;
    inputs["ngo"] = ngo;
    jQuery.ajax({
    url: states_url,
    data: inputs,
    error: function (XMLHttpRequest, textStatus, errorThrown) {
      alert("We are sorry something went wrong, please try again");

    },
    success: function(data){
       jQuery("#state").html(data);
       jQuery("#state_spinner").hide();
    },
    type: "get"
  });
}

function get_children_details(){

}