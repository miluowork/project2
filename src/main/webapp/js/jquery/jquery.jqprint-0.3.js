// -----------------------------------------------------------------------
// Eros Fratini - eros@recoding.it
// jqprint 0.3
//
// - 19/06/2009 - some new implementations, added Opera support
// - 11/05/2009 - first sketch
//
// Printing plug-in for jQuery, evolution of jPrintArea: http://plugins.jquery.com/project/jPrintArea
// requires jQuery 1.3.x
//
// Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php
//------------------------------------------------------------------------

(function($) {
    var opt;

    $.fn.jqprint = function (options) {
        opt = $.extend({}, $.fn.jqprint.defaults, options);

        var $element = (this instanceof jQuery) ? this : $(this);
        
        if (opt.operaSupport && $.browser.opera) 
        { 
            var tab = window.open("","jqPrint-preview");
            tab.document.open();

            var doc = tab.document;
        }
        else 
        {
            var $iframe = $("<iframe  />");
        
            if (!opt.debug) { $iframe.css({ position: "absolute", width: "0px", height: "0px", left: "-600px", top: "-600px" }); }

            $iframe.appendTo("body");
            var doc = $iframe[0].contentWindow.document;
        }
        
        if (opt.importCSS)
        {
            if ($("link[media=print]").length > 0) 
            {
                $("link[media=print]").each( function() {
                    doc.write("<link type='text/css' rel='stylesheet' href='http://127.0.0.1:8080/situ/css/style.css' media='print' />");
                });
            }
            else 
            {
                $("link").each( function() {
                	
                    doc.write("<link type='text/css' rel='stylesheet'  href='http://127.0.0.1:8080/situ/css/style.css' media='print' />");
                });
            }
        }
        
        if (opt.printContainer) { 
        	doc.write($element.outer()); }
        else { $element.each( function() {
        	doc.write($(this).html()); 
        	
        }); }
        
        doc.close();
        
        (opt.operaSupport && $.browser.opera ? tab : $iframe[0].contentWindow).focus();
        setTimeout( function() { (opt.operaSupport && $.browser.opera ? tab : $iframe[0].contentWindow).print(); if (tab) { tab.close(); } }, 1000);
    }
    
    $.fn.jqprint.defaults = {
		debug: false,
		importCSS: true, 
		printContainer: true,
		operaSupport: true
	};

    // Thanks to 9__, found at http://users.livejournal.com/9__/380664.html
    jQuery.fn.outer = function() {
    	var c=this.clone();
    	c.find(".printhide").css("display","none");
    	c.find(".printshow").css("display","block");
    	c.find(".subprint").css("display","block");
    	c.find("th,td").css({"border-left":"1px solid #000","border-top":"1px solid #000"});
    	c.find("table").css({"border-right":"1px solid #000","border-bottom":"1px solid #000"});
    	c.find(".noline").css({border:"none"});
    	c.find(".rightline").css({"border-right":"1px solid #000"});
    	c.find(".leftline").css({"border-left":"1px solid #000"});
    	c.find(".topline").css({"border-top":"1px solid #000"});
    	return $($('<div></div>').html(c)).html();
    } 
})(jQuery);