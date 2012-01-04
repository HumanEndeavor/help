/*!
 * JSizes - JQuery plugin v0.33
 *
 * Licensed under the revised BSD License.
 * Copyright 2008-2010 Bram Stein
 * All rights reserved.
 */
/*global jQuery*/
(function(a){var b=function(a){return parseInt(a,10)||0};a.each(["min","max"],function(c,d){a.fn[d+"Size"]=function(a){var c,e;return a?(a.width!==undefined&&this.css(d+"-width",a.width),a.height!==undefined&&this.css(d+"-height",a.height),this):(c=this.css(d+"-width"),e=this.css(d+"-height"),{width:d==="max"&&(c===undefined||c==="none"||b(c)===-1)&&Number.MAX_VALUE||b(c),height:d==="max"&&(e===undefined||e==="none"||b(e)===-1)&&Number.MAX_VALUE||b(e)})}}),a.fn.isVisible=function(){return this.is(":visible")},a.each(["border","margin","padding"],function(c,d){a.fn[d]=function(a){return a?(a.top!==undefined&&this.css(d+"-top"+(d==="border"?"-width":""),a.top),a.bottom!==undefined&&this.css(d+"-bottom"+(d==="border"?"-width":""),a.bottom),a.left!==undefined&&this.css(d+"-left"+(d==="border"?"-width":""),a.left),a.right!==undefined&&this.css(d+"-right"+(d==="border"?"-width":""),a.right),this):{top:b(this.css(d+"-top"+(d==="border"?"-width":""))),bottom:b(this.css(d+"-bottom"+(d==="border"?"-width":""))),left:b(this.css(d+"-left"+(d==="border"?"-width":""))),right:b(this.css(d+"-right"+(d==="border"?"-width":"")))}}})})(jQuery)