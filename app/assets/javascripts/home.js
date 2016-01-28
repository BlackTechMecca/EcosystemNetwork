var mvpready_admin = function () {

  "use strict"

  var initNavbarNotifications = function () {
    var notifications = $('.navbar-notification')

    notifications.find ('> .dropdown-toggle').click (function (e) {
      if (mvpready_core.isLayoutCollapsed ()) {
        window.location = $(this).prop ('href')
      }
    })

    notifications.find ('.notification-list').slimScroll ({ height: 225, railVisible: true })
  }

  return {
    init: function () {
      // Layouts
      mvpready_core.navEnhancedInit ()
      mvpready_core.navHoverInit ({ delay: { show: 250, hide: 350 } })      

      initNavbarNotifications ()
      mvpready_core.initLayoutToggles ()
      mvpready_core.initBackToTop ()  

      // Components
      mvpready_helpers.initAccordions ()		
      mvpready_helpers.initFormValidation ()
      mvpready_helpers.initTooltips ()	
      mvpready_helpers.initLightbox ()
      mvpready_helpers.initSelect ()
      mvpready_helpers.initIcheck ()
      mvpready_helpers.initDataTableHelper ()
      mvpready_helpers.initiTimePicker ()
      mvpready_helpers.initDatePicker ()
    }
  }

}()

$(function () {
  mvpready_admin.init ()
})

var mvpready_account = function () {

  "use strict"

  var initPlaceholder = function () {
    $.support.placeholder = false
    var test = document.createElement('input')
    if('placeholder' in test) $.support.placeholder = true

    if (!$.support.placeholder) {
      $('.placeholder-hidden').show ()
    }
  }

  return {
    init: function() {
      initPlaceholder ()
    }
  }

}()

$(function () {
  mvpready_account.init ()
})

var mvpready_core = function () {

  "use strict"

  var getLayoutColors = function (theme) {
    
    var theme_choice = (theme === undefined || theme === '') ? 'slate' : theme

    var color_object = {
      slate: ['#D74B4B', '#475F77', '#BCBCBC', '#777777', '#6685a4', '#E68E8E']
      , belize: ['#2980b9', '#7CB268', '#A9A9A9', '#888888', '#74B5E0', '#B3D1A7']
      , square: ['#6B5C93', '#444444', '#569BAA', '#AFB7C2', '#A89EC2', '#A9CCD3']
      , pom: ['#e74c3c', '#444444', '#569BAA', '#AFB7C2', '#F2A299', '#A9CBD3']
      , royal: ['#3498DB', '#2c3e50', '#569BAA', '#AFB7C2', '#ACCDD5', '#6487AA']
      , carrot: ['#E5723F', '#67B0DE', '#373737', '#BCBCBC', '#F2BAA2', '#267BAE']
    }

    return color_object[theme_choice]
  }   

  var isLayoutCollapsed = function () {
    return $('.navbar-toggle').css ('display') == 'block'
  }

  var initLayoutToggles = function () {
    $('.navbar-toggle, .mainnav-toggle').click (function (e) {
      $(this).toggleClass ('is-open')
    })
  }

  var initBackToTop = function () {
    var backToTop = $('<a>', { id: 'back-to-top', href: '#top' })
        , icon = $('<i>', { 'class': 'fa fa-chevron-up' })

    backToTop.appendTo ('body')
    icon.appendTo (backToTop)

    backToTop.hide ()

    $(window).scroll (function () {
      if ($(this).scrollTop () > 150) {
        backToTop.fadeIn ()
      } else {
        backToTop.fadeOut ()
      }
    })

    backToTop.click (function (e) {
      e.preventDefault ()

      $('body, html').animate({
        scrollTop: 0
      }, 600)
    })
  }

  var navEnhancedInit = function () {
    $('.mainnav-menu').find ('> .active').addClass ('is-open')

    $('.mainnav-menu > .dropdown').on ('show.bs.dropdown', function () {
      $(this).addClass ('is-open')
      $(this).siblings ().removeClass ('is-open')
    })
  }

  var navHoverInit = function (config) {
    $('[data-hover="dropdown"]').each (function () {
      var $this = $(this)
          , defaults = { delay: { show: 1000, hide: 1000 } }
          , $parent = $this.parent ()
          , settings = $.extend (defaults, config)
          , timeout

      if (!('ontouchstart' in document.documentElement)) {
        $parent.find ('.dropdown-toggle').click (function (e) {
            if (!isLayoutCollapsed ()) {
              e.preventDefault ()
              e.stopPropagation ()
            }
        })
      }

      $parent.mouseenter(function () {
        if (isLayoutCollapsed ()) { return false }

        timeout = setTimeout (function () {
          $parent.addClass ('open')
          $parent.trigger ('show.bs.dropdown')
        }, settings.delay.show)
      })

      $parent.mouseleave(function () {
        if (isLayoutCollapsed ()) { return false }

        clearTimeout (timeout)

        timeout = setTimeout (function () {
          $parent.removeClass ('open keep-open')
          $parent.trigger ('hide.bs.dropdown')
        }, settings.delay.hide)
      })
    })
  }  

  return {    
    navEnhancedInit: navEnhancedInit
    , navHoverInit: navHoverInit

    , initBackToTop: initBackToTop    
    , isLayoutCollapsed: isLayoutCollapsed
    , initLayoutToggles: initLayoutToggles

    , layoutColors: getLayoutColors ('slate')
  }

}()

var mvpready_helpers = function () {

  "use strict"

  var initFormValidation = function( ) {
    if ($.fn.parsley) {
      $('.parsley-form').each (function () {
        $(this).parsley ({
          trigger: 'change'
          , errorsContainer: function (el) {            
            if (el.$element.parents ('form').is ('.form-horizontal')) {
              return el.$element.parents ("*[class^='col-']")
            }     
                    
            return el.$element.parents ('.form-group')            
          }
          , errorsWrapper: '<ul class="parsley-error-list"></ul>'
        })
      })
    }
  }

  var initAccordions = function () {
    $('.accordion-simple, .accordion-panel').each (function (i) {
      var accordion = $(this)
          , toggle = accordion.find ('.accordion-toggle')
          , activePanel = accordion.find ('.panel-collapse.in').parent ()

      activePanel.addClass ('is-open')

      toggle.prepend('<i class="fa accordion-caret"></i>')

      toggle.on ('click', function (e) {
        var panel = $(this).parents ('.panel')

        panel.toggleClass ('is-open')
        panel.siblings ().removeClass ('is-open')
      })
    })
  }

  var initTooltips = function () {
    if ($.fn.tooltip) { $('.ui-tooltip').tooltip ({ container: 'body' }) }
    if ($.fn.popover) { $('.ui-popover').popover ({ container: 'body' }) }
  }

  var initLightbox = function () {
    if ($.fn.magnificPopup) {
      $('.ui-lightbox').magnificPopup ({
        type: 'image'
        , closeOnContentClick: false
        , closeBtnInside: true
        , fixedContentPos: true
        , mainClass: 'mfp-no-margins mfp-with-zoom'
        , image: {
          verticalFit: true
          , tError: '<a href="%url%">The image #%curr%</a> could not be loaded.'
        }
      })

      $('.ui-lightbox-video, .ui-lightbox-iframe').magnificPopup ({
        disableOn: 700
        , type: 'iframe'
        , mainClass: 'mfp-fade'
        , removalDelay: 160
        , preloader: false
        , fixedContentPos: false
      })

      $('.ui-lightbox-gallery').magnificPopup ({
        delegate: 'a'
        , type: 'image'
        , tLoading: 'Loading image #%curr%...'
        , mainClass: 'mfp-img-mobile'
        , gallery: {
          enabled: true
          , navigateByImgClick: true
          , preload: [0,1]
        },
        image: {
          tError: '<a href="%url%">The image #%curr%</a> could not be loaded.'
          , titleSrc: function(item) {
            return item.el.attr('title')
          }
        }
      })
    }
  }

  var initSelect = function () {
    if ($.fn.select2) {
      $('.ui-select').select2({ 
        allowClear: true 
        , placeholder: "Select..." })
    }
  }

  var initIcheck = function () {
    if ($.fn.iCheck) {
      $('.ui-check').iCheck ({
        checkboxClass: 'ui-icheck icheckbox_minimal-grey'
        , radioClass: 'ui-icheck iradio_minimal-grey'
        , inheritClass: true
      }).on ('ifChanged', function (e) {
        $(e.currentTarget).trigger ('change')
      })
    }
  }

  var initDataTableHelper = function () {
    if ($.fn.dataTableHelper) {
      $('.ui-datatable').dataTableHelper ()
    }
  }

  var initiTimePicker = function () {
    if ($.fn.timepicker) {
      $('.ui-timepicker').timepicker ()
      $('.ui-timepicker-modal').timepicker ({ template: 'modal' })
    }      
  }

  var initDatePicker = function () {
    if ($.fn.datepicker) {
      $('.ui-datepicker').datepicker({
        autoclose: true
        , todayHighlight: true
      })
    }
  }

  return {
    initAccordions: initAccordions
    , initFormValidation: initFormValidation
    , initTooltips: initTooltips
    , initLightbox: initLightbox
    , initSelect: initSelect
    , initIcheck: initIcheck
    , initDataTableHelper: initDataTableHelper
    , initiTimePicker: initiTimePicker
    , initDatePicker: initDatePicker
  }

}()