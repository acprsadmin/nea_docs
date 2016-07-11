/*!
 * froala_editor v2.2.1 (https://www.froala.com/wysiwyg-editor)
 * License https://froala.com/wysiwyg-editor/terms/
 * Copyright 2014-2016 Froala Labs
 */


!function(a){"function"==typeof define&&define.amd?define(["jquery"],a):"object"==typeof module&&module.exports?module.exports=function(b,c){return void 0===c&&(c="undefined"!=typeof window?require("jquery"):require("jquery")(b)),a(c),c}:a(jQuery)}(function(a){"use strict";a.extend(a.FE.POPUP_TEMPLATES,{"video.insert":"[_BUTTONS_][_BY_URL_LAYER_][_EMBED_LAYER_]","video.edit":"[_BUTTONS_]","video.size":"[_BUTTONS_][_SIZE_LAYER_]"}),a.extend(a.FE.DEFAULTS,{videoInsertButtons:["videoBack","|","videoByURL","videoEmbed"],videoEditButtons:["videoDisplay","videoAlign","videoSize","videoRemove"],videoResize:!0,videoSizeButtons:["videoBack","|"],videoSplitHTML:!1,videoTextNear:!0,videoDefaultAlign:"center",videoDefaultDisplay:"block",videoMove:!0}),a.FE.VIDEO_PROVIDERS=[{test_regex:/^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#\&\?]*).*/,url_regex:/(?:https?:\/\/)?(?:www\.)?(?:m\.)?(?:youtube\.com|youtu\.be)\/(?:watch\?v=|embed\/)?([0-9a-zA-Z_\-]+)(.+)?/g,url_text:"//www.youtube.com/embed/$1",html:'<iframe width="640" height="360" src="{url}" frameborder="0" allowfullscreen></iframe>'},{test_regex:/^.*(vimeo\.com\/)((channels\/[A-z]+\/)|(groups\/[A-z]+\/videos\/))?([0-9]+)/,url_regex:/(?:https?:\/\/)?(?:www\.)?(?:vimeo\.com)\/(?:channels\/[A-z]+\/|groups\/[A-z]+\/videos\/)?(.+)/g,url_text:"//player.vimeo.com/video/$1",html:'<iframe width="640" height="360" src="{url}" frameborder="0" allowfullscreen></iframe>'},{test_regex:/^.+(dailymotion.com|dai.ly)\/(video|hub)?\/?([^_]+)[^#]*(#video=([^_&]+))?/,url_regex:/(?:https?:\/\/)?(?:www\.)?(?:dailymotion\.com|dai\.ly)\/(?:video|hub)?\/?(.+)/g,url_text:"//www.dailymotion.com/embed/video/$1",html:'<iframe width="640" height="360" src="{url}" frameborder="0" allowfullscreen></iframe>'},{test_regex:/^.+(screen.yahoo.com)\/[^_&]+/,url_regex:"",url_text:"",html:'<iframe width="640" height="360" src="{url}?format=embed" frameborder="0" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true" allowtransparency="true"></iframe>'},{test_regex:/^.+(rutube.ru)\/[^_&]+/,url_regex:/(?:https?:\/\/)?(?:www\.)?(?:rutube\.ru)\/(?:video)?\/?(.+)/g,url_text:"//rutube.ru/play/embed/$1",html:'<iframe width="640" height="360" src="{url}" frameborder="0" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true" allowtransparency="true"></iframe>'}],a.FE.PLUGINS.video=function(b){function c(){var a=b.popups.get("video.insert"),c=a.find(".fr-video-by-url-layer input");c.val("").trigger("change");var d=a.find(".fr-video-embed-layer textarea");d.val("").trigger("change")}function d(){var a=b.$tb.find('.fr-command[data-cmd="insertVideo"]'),c=b.popups.get("video.insert");if(c||(c=f()),!c.hasClass("fr-active")){b.popups.refresh("video.insert"),b.popups.setContainer("video.insert",b.$tb);var d=a.offset().left+a.outerWidth()/2,e=a.offset().top+(b.opts.toolbarBottom?10:a.outerHeight()-10);b.popups.show("video.insert",d,e,a.outerHeight())}}function e(){var c=b.popups.get("video.edit");c||(c=z()),b.popups.setContainer("video.edit",a(b.opts.scrollableContainer)),b.popups.refresh("video.edit");var d=S.find("iframe, embed, video"),e=d.offset().left+d.outerWidth()/2,f=d.offset().top+d.outerHeight();b.popups.show("video.edit",e,f,d.outerHeight())}function f(a){if(a)return b.popups.onRefresh("video.insert",c),b.popups.onHide("video.insert",j),!0;var d="";b.opts.videoInsertButtons.length>1&&(d='<div class="fr-buttons">'+b.button.buildList(b.opts.videoInsertButtons)+"</div>");var e="";b.opts.videoInsertButtons.indexOf("videoByURL")>=0&&(e='<div class="fr-video-by-url-layer fr-layer fr-active" id="fr-video-by-url-layer-'+b.id+'"><div class="fr-input-line"><input type="text" placeholder="http://" tabIndex="1"></div><div class="fr-action-buttons"><button type="button" class="fr-command fr-submit" data-cmd="videoInsertByURL" tabIndex="2">'+b.language.translate("Insert")+"</button></div></div>");var f="";b.opts.videoInsertButtons.indexOf("videoEmbed")>=0&&(f='<div class="fr-video-embed-layer fr-layer" id="fr-video-embed-layer-'+b.id+'"><div class="fr-input-line"><textarea type="text" placeholder="'+b.language.translate("Embedded Code")+'" tabIndex="1" rows="5"></textarea></div><div class="fr-action-buttons"><button type="button" class="fr-command fr-submit" data-cmd="videoInsertEmbed" tabIndex="2">'+b.language.translate("Insert")+"</button></div></div>");var g={buttons:d,by_url_layer:e,embed_layer:f},h=b.popups.create("video.insert",g);return h}function g(a){var c,d,e=b.popups.get("video.insert");if(!S&&!b.opts.toolbarInline){var f=b.$tb.find('.fr-command[data-cmd="insertVideo"]');c=f.offset().left+f.outerWidth()/2,d=f.offset().top+(b.opts.toolbarBottom?10:f.outerHeight()-10)}b.opts.toolbarInline&&(d=e.offset().top-b.helpers.getPX(e.css("margin-top")),e.hasClass("fr-above")&&(d+=e.outerHeight())),e.find(".fr-layer").removeClass("fr-active"),e.find(".fr-"+a+"-layer").addClass("fr-active"),b.popups.show("video.insert",c,d,0)}function h(a){var c=b.popups.get("video.insert");c.find(".fr-video-by-url-layer").hasClass("fr-active")&&a.addClass("fr-active")}function i(a){var c=b.popups.get("video.insert");c.find(".fr-video-embed-layer").hasClass("fr-active")&&a.addClass("fr-active")}function j(){}function k(a){b.events.focus(!0),b.selection.restore(),b.html.insert('<span contenteditable="false" draggable="true" class="fr-jiv fr-video fr-dv'+b.opts.videoDefaultDisplay[0]+("center"!=b.opts.videoDefaultAlign?" fr-fv"+b.opts.videoDefaultAlign[0]:"")+'">'+a+"</span>",!1,b.opts.videoSplitHTML),b.popups.hide("video.insert");var c=b.$el.find(".fr-jiv");c.removeClass("fr-jiv"),c.toggleClass("fr-draggable",b.opts.videoMove),b.events.trigger("video.inserted",[c])}function l(c){if("undefined"==typeof c){var d=b.popups.get("video.insert");c=d.find('.fr-video-by-url-layer input[type="text"]').val()||""}var e=null;if(b.helpers.isURL(c))for(var f=0;f<a.FE.VIDEO_PROVIDERS.length;f++){var g=a.FE.VIDEO_PROVIDERS[f];if(g.test_regex.test(c)){e=c.replace(g.url_regex,g.url_text),e=g.html.replace(/\{url\}/,e);break}}e?k(e):b.events.trigger("video.linkError",[c])}function m(a){if("undefined"==typeof a){var c=b.popups.get("video.insert");a=c.find(".fr-video-embed-layer textarea").val()||""}0===a.length?b.events.trigger("video.codeError",[a]):k(a)}function n(c){if(!b.core.sameInstance(R))return!0;c.preventDefault(),c.stopPropagation();var d=c.pageX||(c.originalEvent.touches?c.originalEvent.touches[0].pageX:null),e=c.pageY||(c.originalEvent.touches?c.originalEvent.touches[0].pageY:null);return d&&e?(b.undo.canDo()||b.undo.saveStep(),Q=a(this),Q.data("start-x",d),Q.data("start-y",e),P.show(),b.popups.hideAll(),void w()):!1}function o(a){if(!b.core.sameInstance(R))return!0;if(Q){a.preventDefault();var c=a.pageX||(a.originalEvent.touches?a.originalEvent.touches[0].pageX:null),d=a.pageY||(a.originalEvent.touches?a.originalEvent.touches[0].pageY:null);if(!c||!d)return!1;var e=Q.data("start-x"),f=Q.data("start-y");Q.data("start-x",c),Q.data("start-y",d);var g=c-e,h=d-f,i=S.find("iframe, embed, video"),j=i.width(),k=i.height();(Q.hasClass("fr-hnw")||Q.hasClass("fr-hsw"))&&(g=0-g),(Q.hasClass("fr-hnw")||Q.hasClass("fr-hne"))&&(h=0-h),i.css("width",j+g),i.css("height",k+h),i.removeAttr("width"),i.removeAttr("height"),s()}}function p(a){return b.core.sameInstance(R)?void(Q&&S&&(a&&a.stopPropagation(),Q=null,P.hide(),s(),e(),b.undo.saveStep())):!0}function q(a){return'<div class="fr-handler fr-h'+a+'"></div>'}function r(){var c;b.shared.$video_resizer?(R=b.shared.$video_resizer,P=b.shared.$vid_overlay,b.events.on("destroy",function(){R.removeClass("fr-active").appendTo(a("body"))},!0)):(b.shared.$video_resizer=a('<div class="fr-video-resizer"></div>'),R=b.shared.$video_resizer,b.events.$on(R,"mousedown",function(a){a.stopPropagation()},!0),b.opts.videoResize&&(R.append(q("nw")+q("ne")+q("sw")+q("se")),b.shared.$vid_overlay=a('<div class="fr-video-overlay"></div>'),P=b.shared.$vid_overlay,c=R.get(0).ownerDocument,a(c).find("body").append(P))),b.events.on("shared.destroy",function(){R.html("").removeData().remove(),b.opts.videoResize&&P.remove()},!0),b.helpers.isMobile()||b.events.$on(a(b.o_win),"resize.video",function(){u(!0)}),b.opts.videoResize&&(c=R.get(0).ownerDocument,b.events.$on(R,b._mousedown,".fr-handler",n),b.events.$on(a(c),b._mousemove,o),b.events.$on(a(c.defaultView||c.parentWindow),b._mouseup,p),b.events.$on(P,"mouseleave",p))}function s(){R||r(),(b.$wp||a(b.opts.scrollableContainer)).append(R),R.data("instance",b);var c=S.find("iframe, embed, video");R.css("top",(b.opts.iframe?c.offset().top-1:c.offset().top-b.$wp.offset().top-1)+b.$wp.scrollTop()).css("left",(b.opts.iframe?c.offset().left-1:c.offset().left-b.$wp.offset().left-1)+b.$wp.scrollLeft()).css("width",c.outerWidth()).css("height",c.height()).addClass("fr-active")}function t(c){if(c&&"touchend"==c.type&&T)return!0;if(c.preventDefault(),c.stopPropagation(),b.edit.isDisabled())return!1;for(var d=0;d<a.FE.INSTANCES.length;d++)a.FE.INSTANCES[d]!=b&&a.FE.INSTANCES[d].events.trigger("video.hideResizer");b.toolbar.disable(),b.helpers.isMobile()&&(b.events.disableBlur(),b.$el.blur(),b.events.enableBlur()),S=a(this),a(this).addClass("fr-active"),b.opts.iframe&&b.size.syncIframe(),s(),e(),b.selection.clear(),b.button.bulkRefresh(),b.events.trigger("image.hideResizer")}function u(a){S&&(x()||a===!0)&&(R.removeClass("fr-active"),b.toolbar.enable(),S.removeClass("fr-active"),S=null,w())}function v(){b.shared.vid_exit_flag=!0}function w(){b.shared.vid_exit_flag=!1}function x(){return b.shared.vid_exit_flag}function y(){b.events.on("mousedown window.mousedown",v),b.events.on("window.touchmove",w),b.events.on("mouseup window.mouseup",u),b.events.on("commands.mousedown",function(a){a.parents(".fr-toolbar").length>0&&u()}),b.events.on("blur video.hideResizer commands.undo commands.redo element.dropped",function(){u(!0)})}function z(){var a="";b.opts.videoEditButtons.length>1&&(a+='<div class="fr-buttons">',a+=b.button.buildList(b.opts.videoEditButtons),a+="</div>");var c={buttons:a},d=b.popups.create("video.edit",c);return b.events.$on(b.$wp,"scroll.video-edit",function(){S&&b.popups.isVisible("video.edit")&&e()}),d}function A(){if(S){var a=b.popups.get("video.size"),c=S.find("iframe, embed, video");a.find('input[name="width"]').val(c.get(0).style.width||c.attr("width")).trigger("change"),a.find('input[name="height"]').val(c.get(0).style.height||c.attr("height")).trigger("change")}}function B(){var c=b.popups.get("video.size");c||(c=C()),b.popups.refresh("video.size"),b.popups.setContainer("video.size",a(b.opts.scrollableContainer));var d=S.find("iframe, embed, video"),e=d.offset().left+d.width()/2,f=d.offset().top+d.height();b.popups.show("video.size",e,f,d.height())}function C(a){if(a)return b.popups.onRefresh("video.size",A),!0;var c="";c='<div class="fr-buttons">'+b.button.buildList(b.opts.videoSizeButtons)+"</div>";var d="";d='<div class="fr-video-size-layer fr-layer fr-active" id="fr-video-size-layer-'+b.id+'"><div class="fr-video-group"><div class="fr-input-line"><input type="text" name="width" placeholder="'+b.language.translate("Width")+'" tabIndex="1"></div><div class="fr-input-line"><input type="text" name="height" placeholder="'+b.language.translate("Height")+'" tabIndex="1"></div></div><div class="fr-action-buttons"><button type="button" class="fr-command fr-submit" data-cmd="videoSetSize" tabIndex="2">'+b.language.translate("Update")+"</button></div></div>";var e={buttons:c,size_layer:d},f=b.popups.create("video.size",e);return b.events.$on(b.$wp,"scroll",function(){S&&b.popups.isVisible("video.size")&&B()}),f}function D(a){S.removeClass("fr-fvr fr-fvl"),"left"==a?S.addClass("fr-fvl"):"right"==a&&S.addClass("fr-fvr"),s(),e()}function E(a){return S?void(S.hasClass("fr-fvl")?a.find("> *:first").replaceWith(b.icon.create("align-left")):S.hasClass("fr-fvr")?a.find("> *:first").replaceWith(b.icon.create("align-right")):a.find("> *:first").replaceWith(b.icon.create("align-justify"))):!1}function F(a,b){var c="justify";S.hasClass("fr-fvl")?c="left":S.hasClass("fr-fvr")&&(c="right"),b.find('.fr-command[data-param1="'+c+'"]').addClass("fr-active")}function G(a){S.removeClass("fr-dvi fr-dvb"),"inline"==a?S.addClass("fr-dvi"):"block"==a&&S.addClass("fr-dvb"),s(),e()}function H(a,b){var c="block";S.hasClass("fr-dvi")&&(c="inline"),b.find('.fr-command[data-param1="'+c+'"]').addClass("fr-active")}function I(){if(S&&b.events.trigger("video.beforeRemove",[S])!==!1){var a=S;b.popups.hideAll(),u(!0),b.selection.setBefore(a.get(0))||b.selection.setAfter(a.get(0)),a.remove(),b.selection.restore(),b.html.fillEmptyBlocks(),b.events.trigger("video.removed",[a])}}function J(a){if(!a.hasClass("fr-dvi")&&!a.hasClass("fr-dvb")){var c=a.css("float");a.css("float","none"),"block"==a.css("display")?(a.css("float",c),0===parseInt(a.css("margin-left"),10)&&(a.attr("style")||"").indexOf("margin-right: auto")>=0?a.addClass("fr-fvl"):0===parseInt(a.css("margin-right"),10)&&(a.attr("style")||"").indexOf("margin-left: auto")>=0&&a.addClass("fr-fvr"),a.addClass("fr-dvb")):(a.css("float",c),"left"==a.css("float")?a.addClass("fr-fvl"):"right"==a.css("float")&&a.addClass("fr-fvr"),a.addClass("fr-dvi")),a.css("margin",""),a.css("float",""),a.css("display",""),a.css("z-index",""),a.css("position",""),a.css("overflow",""),a.css("vertical-align","")}b.opts.videoTextNear||a.removeClass("fr-dvi").addClass("fr-dvb")}function K(){b.$el.find("video").filter(function(){return 0===a(this).parents("span.fr-video").length}).wrap('<span class="fr-video" contenteditable="false"></span>'),b.$el.find("embed, iframe").filter(function(){if(b.browser.safari&&this.getAttribute("src")&&this.setAttribute("src",this.src),a(this).parents("span.fr-video").length>0)return!1;for(var c=a(this).attr("src"),d=0;d<a.FE.VIDEO_PROVIDERS.length;d++){var e=a.FE.VIDEO_PROVIDERS[d];if(e.test_regex.test(c))return!0}return!1}).map(function(){return 0===a(this).parents("object").length?this:a(this).parents("object").get(0)}).wrap('<span class="fr-video" contenteditable="false"></span>');for(var c=b.$el.find("span.fr-video"),d=0;d<c.length;d++)J(a(c[d]));c.toggleClass("fr-draggable",b.opts.videoMove)}function L(){y(),b.helpers.isMobile()&&(b.events.$on(b.$el,"touchstart","span.fr-video",function(){T=!1}),b.events.$on(b.$el,"touchmove",function(){T=!0})),b.events.on("html.set",K),K(),b.events.$on(b.$el,"mousedown","span.fr-video",function(a){a.stopPropagation()}),b.events.$on(b.$el,"click touchend","span.fr-video",t),b.events.on("keydown",function(c){var d=c.which;return!S||d!=a.FE.KEYCODE.BACKSPACE&&d!=a.FE.KEYCODE.DELETE?S&&d==a.FE.KEYCODE.ESC?(u(!0),c.preventDefault(),!1):S&&!b.keys.ctrlKey(c)?(c.preventDefault(),!1):void 0:(c.preventDefault(),I(),!1)},!0),b.events.on("keydown",function(){b.$el.find("span.fr-video:empty").remove()}),f(!0),C(!0)}function M(){S?S.trigger("click"):(b.events.disableBlur(),b.selection.restore(),b.events.enableBlur(),b.popups.hide("video.insert"),b.toolbar.showInline())}function N(a,c){if(S){var d=b.popups.get("video.size"),e=S.find("iframe, embed, video");e.css("width",a||d.find('input[name="width"]').val()),e.css("height",c||d.find('input[name="height"]').val()),e.get(0).style.width&&e.removeAttr("width"),e.get(0).style.height&&e.removeAttr("height"),d.find("input").blur(),setTimeout(function(){S.trigger("click")},b.helpers.isAndroid()?50:0)}}function O(){return S}var P,Q,R,S,T;return b.shared.vid_exit_flag=!1,{_init:L,showInsertPopup:d,showLayer:g,refreshByURLButton:h,refreshEmbedButton:i,insertByURL:l,insertEmbed:m,insert:k,align:D,refreshAlign:E,refreshAlignOnShow:F,display:G,refreshDisplayOnShow:H,remove:I,showSizePopup:B,back:M,setSize:N,get:O}},a.FE.RegisterCommand("insertVideo",{title:"Insert Video",undo:!1,focus:!0,refreshAfterCallback:!1,popup:!0,callback:function(){this.popups.isVisible("video.insert")?(this.$el.find(".fr-marker")&&(this.events.disableBlur(),this.selection.restore()),this.popups.hide("video.insert")):this.video.showInsertPopup()},plugin:"video"}),a.FE.DefineIcon("insertVideo",{NAME:"video-camera"}),a.FE.DefineIcon("videoByURL",{NAME:"link"}),a.FE.RegisterCommand("videoByURL",{title:"By URL",undo:!1,focus:!1,callback:function(){this.video.showLayer("video-by-url")},refresh:function(a){this.video.refreshByURLButton(a)}}),a.FE.DefineIcon("videoEmbed",{NAME:"code"}),a.FE.RegisterCommand("videoEmbed",{title:"Embedded Code",undo:!1,focus:!1,callback:function(){this.video.showLayer("video-embed")},refresh:function(a){this.video.refreshEmbedButton(a)}}),a.FE.RegisterCommand("videoInsertByURL",{undo:!0,focus:!0,callback:function(){this.video.insertByURL()}}),a.FE.RegisterCommand("videoInsertEmbed",{undo:!0,focus:!0,callback:function(){this.video.insertEmbed()}}),a.FE.DefineIcon("videoDisplay",{NAME:"star"}),a.FE.RegisterCommand("videoDisplay",{title:"Display",type:"dropdown",options:{inline:"Inline",block:"Break Text"},callback:function(a,b){this.video.display(b)},refresh:function(a){this.opts.videoTextNear||a.addClass("fr-hidden")},refreshOnShow:function(a,b){this.video.refreshDisplayOnShow(a,b)}}),a.FE.DefineIcon("videoAlign",{NAME:"align-center"}),a.FE.RegisterCommand("videoAlign",{type:"dropdown",title:"Align",options:{left:"Align Left",justify:"None",right:"Align Right"},html:function(){var b='<ul class="fr-dropdown-list">',c=a.FE.COMMANDS.videoAlign.options;for(var d in c)b+='<li><a class="fr-command fr-title" data-cmd="videoAlign" data-param1="'+d+'" title="'+this.language.translate(c[d])+'">'+this.icon.create("align-"+d)+"</a></li>";return b+="</ul>"},callback:function(a,b){this.video.align(b)},refresh:function(a){this.video.refreshAlign(a)},refreshOnShow:function(a,b){this.video.refreshAlignOnShow(a,b)}}),a.FE.DefineIcon("videoRemove",{NAME:"trash"}),a.FE.RegisterCommand("videoRemove",{title:"Remove",callback:function(){this.video.remove()}}),a.FE.DefineIcon("videoSize",{NAME:"arrows-alt"}),a.FE.RegisterCommand("videoSize",{undo:!1,focus:!1,title:"Change Size",callback:function(){this.video.showSizePopup()}}),a.FE.DefineIcon("videoBack",{NAME:"arrow-left"}),a.FE.RegisterCommand("videoBack",{title:"Back",undo:!1,focus:!1,back:!0,callback:function(){this.video.back()},refresh:function(a){var b=this.video.get();b||this.opts.toolbarInline?(a.removeClass("fr-hidden"),a.next(".fr-separator").removeClass("fr-hidden")):(a.addClass("fr-hidden"),a.next(".fr-separator").addClass("fr-hidden"))}}),a.FE.RegisterCommand("videoSetSize",{undo:!0,focus:!1,callback:function(){this.video.setSize()}})});
