(function(jQuery) {

jQuery.fn.electricSlide = function(options){
  /*
    In all of the functions defined in settings,
    "this" refers to the slide element.

    Each slide element has a "electricSlide" attribute
    which you can use to refer to settings, variables, and
    functions defined below. See line 266.
  */
  // dummy function; is this necessary?
  function trueSlideFunction(oldSlidePosition, newSlidePosition){
    return true;
  }
  
  // override these settings when you call the electricSlide function
  var settings = {
    slideClass               : "slide",

    // header/navigation
    shouldInsertHeader   : true,
    shouldInsertFooter   : true,
    slideHeaderClass     : "slide-header",
    slideFooterClass     : "slide-footer",
    titleSelector        : "h3",
    // "next/previous" text is replaced with title if there is one
    // href is replaced with "#slide-i", where i is slide's position
    nextHtml             : "<a href='#' class='slide-navigation next'>next</a>",
    previousHtml         : "<a href='#' class='slide-navigation previous'>previous</a>",
                         
    buildToc             : true,
    tocContainerSelector : "#table-of-contents",

    // show/hide 
    showFunction         : function(){jQuery(this).show()},
    hideFunction         : function(){jQuery(this).hide()},

    // callbacks
    slideShouldShow      : trueSlideFunction, 
    slideWillShow        : trueSlideFunction, // setup the slide before it appears.. or something
    slideDidShow         : trueSlideFunction, // do stuff with the slide after it appears
    slideShouldHide      : trueSlideFunction, // allows you to prevent the slide from being hidden; useful for validation
    slideWillHide        : trueSlideFunction,
    slideDidHide         : trueSlideFunction,
    
    // When clicked, this will toggle presentation styles
    // The toggle element must be within the element containing all slides
    toggleSelector       : ".slide-toggle"
  }

  jQuery.extend(settings, options)
  settings.slideSelector = "." + settings.slideClass
  settings.slideHeaderSelector = "." + settings.slideHeaderClass
  settings.slideFooterSelector = "." + settings.slideFooterClass
  
  this.each(function(){
    var slideContainerElem   = this;
    var slideContainer       = jQuery(this);
    var slides               = jQuery(settings.slideSelector, slideContainer);
    var currentSlidePosition = 0;
    var titles               = jQuery(settings.slideSelector + " > " + settings.titleSelector);
    var tocContainer; // table of contents container
    var tableOfContents;
    
    
    /***
     * Height and width functions
     */
    // Set slide container height
    var maxHeight = 0;
    
    // This function gets called on each slide.
    // Its purpose is to find the height of the tallest element.
    // That height is then used to set the height of the slide container
    // so that the page doesn't jump around when the user navigates the slides.
    function findMaxHeight(slideElem) {
      var height = jQuery(slideElem).height();

      var margins = jQuery(slideElem).margin();
      var topMargin = margins.top;
      var bottomMargin = margins.bottom;

      var padding = jQuery(slideElem).padding();
      var topPadding = padding.top;
      var bottomPadding = padding.bottom;
      
      var border = jQuery(slideElem).border();
      var topBorder = border.top;
      var bottomBorder = border.bottom;
      
      var totalHeight = height + topMargin + 
        bottomMargin + topPadding + 
        bottomPadding + topBorder + bottomBorder;
      
      if(totalHeight > maxHeight) maxHeight = totalHeight;
    }

    function resetDimensions(animationDuration) {
      maxHeight = 0;
      maxTopMargin = 0;
      maxBottomMargin = 0;
      maxTopPadding = 0;
      maxBottomPadding = 0;
      maxTopBorder = 0;
      maxBottomBorder = 0;
      slides.each(function(){
        findMaxHeight(this);
      })
      setSlideContainerHeight(animationDuration);
    }
    
    function slideWidth() {
      return slideContainer.width();
    }
    
    function slideContainerHeight() {
      return maxHeight;
    }
    
    function setSlideContainerHeight(animationDuration) {
      if(typeof(animationDuration) == "number") {
        slideContainer.animate({height:slideContainerHeight()}, animationDuration)
      } else {
        slideContainer.height(slideContainerHeight())
      }
    }

    /***
     * Navigation functions
     */
    function maxSlidePosition() {
      return slides.size() - 1;
    }
    
    // Navigation
    function showSlide(newSlidePosition) {
      var oldSlidePosition = currentSlidePosition;
      var oldSlide = slides[currentSlidePosition];
      var newSlide = slides[newSlidePosition];

      if(!newSlide || oldSlidePosition == newSlidePosition) {
        return false;
      }
      
      // give the opportunity to prevent the slide from changing
      if(!oldSlide.shouldHide(oldSlidePosition, newSlidePosition)) {
        return false;
      }
      
      oldSlide.willHide(oldSlidePosition, newSlidePosition);
      jQuery(oldSlide).stop();
      oldSlide.hide(oldSlidePosition, newSlidePosition);
      oldSlide.didHide(oldSlidePosition, newSlidePosition);

      // should I really be doing this? will just leave the slideshow blank
      if(!newSlide.shouldShow(oldSlidePosition, newSlidePosition)) {
        return false;
      }
      newSlide.willShow(oldSlidePosition, newSlidePosition);
      newSlide.show(oldSlidePosition, newSlidePosition);
      newSlide.didShow(oldSlidePosition, newSlidePosition);
      currentSlidePosition = newSlidePosition;
      
      // highlight toc item if applicable
      if(typeof(activateCurrentTocLine) != "undefined")  activateCurrentTocLine();
    }

    function showNextSlide() {
      newSlidePosition = currentSlidePosition + 1;
      if(newSlidePosition <= maxSlidePosition()) {
        showSlide(newSlidePosition)
      }
      return false
    }

    function showPreviousSlide() {
      newSlidePosition = currentSlidePosition - 1;
      if(newSlidePosition >= 0) {
        showSlide(newSlidePosition)
      }
      return false
    }
    
    // similar to http://github.com/nakajima/slidedown/blob/master/templates/javascripts/slides.js
    // This will 'navigate' to the next/prev slide if the user clicks in the right/left half
    // of the slide div
    function clickMove(e) {
      var x = e.pageX - this.offsetLeft;

      if (x < slideWidth() / 2) {
        showPreviousSlide();
      } else {
        showNextSlide();
      }
    }
    
    /***
     * Navigation HTML functions
     */
    function insertNavigation(slidePosition, slideElem){
      var header = jQuery("<div><div class='clear-slide-header'></div></div>'");
      var titleIndex;
      
      // TODO clean this confusing mess up
      // don't show next/previous if there is no next/previous
      if(slidePosition < maxSlidePosition()) {
        titleIndex = slidePosition + 1;
        var nextElement = jQuery(settings.nextHtml)
        if(titles[titleIndex]) {
          nextElement.text((titleIndex + 1) + ". " + jQuery(titles[titleIndex]).text()) // replace link text with title of next slide
        }
        header.prepend(nextElement);
      }
      
      if(slidePosition > 0) {
        titleIndex = slidePosition - 1;
        var previousElement = jQuery(settings.previousHtml)
        if(titles[titleIndex]) {
          previousElement.text((titleIndex + 1) + ". " + jQuery(titles[titleIndex]).text()) // replace link text with title of prev slide
        }
        header.prepend(previousElement)
      }
      
      if(settings.shouldInsertFooter) {
        var footer = header.clone();
        footer.addClass(settings.slideFooterClass)
        jQuery(slideElem).append(footer)
      }
      
      if(settings.shouldInsertHeader) {
        header.addClass(settings.slideHeaderClass)
        jQuery(slideElem).prepend(header)
      }
      
      jQuery(".slide-navigation.next", slideElem).click(showNextSlide)
      jQuery(".slide-navigation.previous", slideElem).click(showPreviousSlide)
    }
    
    // TODO allow users to provide their own function for generating the toc
    function generateToc() {
      tocContainer = jQuery(settings.tocContainerSelector)

      tableOfContents = jQuery("<ol class='slide-toc'></ol>")

      titles.each(function(i){
        line = jQuery("<li><a href='#slide-" + i + "'>" + jQuery(this).text() + "</a></li>")
        jQuery("a", line).click(function(){showSlide(i)}) // could optimize this
        tableOfContents.append(line)
      })

      tocContainer.append(tableOfContents);

      this.activateCurrentTocLine = function() {
        tableOfContents.children("li.active").removeClass("active")
        tableOfContents.children("li:eq(" + currentSlidePosition + ")").addClass("active")
      }
    }
    
    /***
     * Expand/Collapse
     */
    function expandAll() {
      slides.show()
      slides.children(settings.slideHeaderSelector + "," + settings.slideFooterSelector).hide()
      slideContainer.animate({height:jQuery(".track", slideContainer).height()})
      return false;
    }
    
    function collapseAll() {
      slides.children(settings.slideHeaderSelector + "," + settings.slideFooterSelector).show()
      slides.hide()
      jQuery(slides[0]).show()
      resetDimensions(400)
      return false;
    }
    
    /***
     * Alter elements - create an electric slide! Yeah!
     */
    var electricSlide = {
      slides            : slides,
      settings          : settings,
      expandAll         : expandAll,
      collapseAll       : collapseAll,
      resetDimensions   : resetDimensions,
      showSlide         : showSlide,
      showNextSlide     : showNextSlide,
      showPreviousSlide : showPreviousSlide
    };
     
    this.electricSlide = electricSlide;
    
    // setup slides
    slides.each(function(i){

      // insert an anchor  
      if(settings.shouldInsertHeader || settings.shouldInsertFooter) insertNavigation(i, this);
      findMaxHeight(this);

      if(i == 0) {
        jQuery(this).show();
      }

      this.electricSlide = electricSlide;
      this.show          = settings.showFunction;
      this.hide          = settings.hideFunction;
      this.shouldShow    = settings.slideShouldShow;
      this.willShow      = settings.slideWillShow;
      this.didShow       = settings.slideDidShow;
      this.shouldHide    = settings.slideShouldHide;
      this.willHide      = settings.slideWillHide;
      this.didHide       = settings.slideDidHide;
    })
    
    // setup dimensions - needs to happen after slides are set up
    // to account for navigation being inserted
    setSlideContainerHeight();
    jQuery(window).resize(resetDimensions)
    
    // generate the TOC
    if(settings.buildToc) generateToc();
    activateCurrentTocLine();
    
    // Let's turn this off for now - it's a bit unintuitive
    // slideContainer.click(clickMove)
    jQuery(settings.toggleSelector, this).toggle(expandAll, collapseAll)
    
  }); // end this.each
  return this;
};

})(jQuery);