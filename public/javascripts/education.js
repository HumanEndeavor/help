$(document).ready(function() {

    $( "#age-range-slider" ).slider({
        orientation: "horizontal",
        animate: true,
        max: 30,
        min: 0,
        step: 1,
        range: true,
        values: [5, 10],
        slide: function(e, u) {
                    $( "#lower_age" ).val = u.values[0];
                    $( "#upper_age" ).val = u.values[1];
                    $( "#age-range" ).html( u.values[ 0 ] + " - " + u.values[ 1 ] + " yrs" );
                }
    });
    $("#age-range").html($("#age-range-slider").slider("values", 0)+" - "+$("#age-range-slider").slider("values", 1)+" yrs");

});
