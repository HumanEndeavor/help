$(document).ready(function() {

$( "#slider-range" ).slider({
    orientation: "vertical",
    range: true,
    values: [ 0, 10 ],
    slide: function( event, ui ) {
            $( "#amount" ).val( ui.values[ 0 ] + " - " + ui.values[ 1 ] + " yrs" );
            }
    });
$( "#amount" ).val($( "#slider-range" ).slider( "values", 0 ) +
        " - " + $( "#slider-range" ).slider( "values", 1 ) + " yrs" );
    });

