/*!
 * slideViewer 1.2
 * Examples and documentation at:
 * http://www.gcmingati.net/wordpress/wp-content/lab/jquery/imagestrip/imageslide-plugin.html
 * 2007-2010 Gian Carlo Mingati
 * Version: 1.2.3 (9-JULY-2010)
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 *
 * Requires:
 * jQuery v1.4.1 or later, jquery.easing.1.2
 *
 */
jQuery(function(){jQuery("div.svw").prepend("<img src='images/small_spinner.gif' class='ldrgif' alt='loading...'/ >")});var j=0,quantofamo=0;jQuery.fn.slideView=function(a){return a=jQuery.extend({easeFunc:"easeInOutExpo",easeTime:750,uiBefore:!1,toolTip:!1,ttOpacity:.9},a),this.each(function(){var b=jQuery(this);b.find("img.ldrgif").remove(),b.removeClass("svw").addClass("stripViewer");var c=b.find("img").width(),d=b.find("img").height(),e=b.find("li").size(),f=c*e;b.find("ul").css("width",f),b.css("width",c),b.css("height",d),b.each(function(d){a.uiBefore?jQuery(this).before("<div class='stripTransmitter' id='stripTransmitter"+j+"'><ul></ul></div>"):jQuery(this).after("<div class='stripTransmitter' id='stripTransmitter"+j+"'><ul></ul></div>"),jQuery(this).find("li").each(function(a){jQuery("div#stripTransmitter"+j+" ul").append("<li><a title='"+jQuery(this).find("img").attr("alt")+"' href='#'>"+(a+1)+"</a></li>")}),jQuery("div#stripTransmitter"+j+" a").each(function(d){jQuery(this).bind("click",function(){jQuery(this).addClass("current").parent().parent().find("a").not(jQuery(this)).removeClass("current");var e=-(c*d);return b.find("ul").animate({left:e},a.easeTime,a.easeFunc),!1})}),b.bind("click",function(b){var d=a.uiBefore?jQuery(this).prev().find("a.current"):jQuery(this).next().find("a.current"),e=parseFloat(jQuery(this).css("borderLeftWidth").replace("px",""))+parseFloat(jQuery(this).css("borderRightWidth").replace("px","")),f=jQuery(this).offset(),g=e/2+c-(b.pageX-f.left);if(g>=c/2){var h=d.parent().prev().find("a");jQuery(h).length!=0?h.trigger("click"):d.parent().parent().find("a:last").trigger("click")}else{var i=d.parent().next().find("a");jQuery(i).length!=0?i.trigger("click"):d.parent().parent().find("a:first").trigger("click")}}),jQuery("div#stripTransmitter"+j).css("width",c),jQuery("div#stripTransmitter"+j+" a:first").addClass("current"),jQuery("body").append('<div class="tooltip" style="display:none;"></div>');if(a.toolTip){var e=jQuery("div#stripTransmitter"+j+" a");e.live("mousemove",function(b){var c=jQuery(this).attr("title");posX=b.pageX+10,posY=b.pageY+10,jQuery(".tooltip").html(c).css({position:"absolute",top:posY+"px",left:posX+"px",display:"block",opacity:a.ttOpacity})}),e.live("mouseout",function(){jQuery(".tooltip").hide()})}}),j++})}