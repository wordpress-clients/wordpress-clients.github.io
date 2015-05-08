$ = require 'expose?jQuery!jquery'
WOW = require './js/wow'
require './js/jquery.fittext'
require 'jquery-smooth-scroll'
require 'bootstrap-sass/assets/javascripts/bootstrap/transition.js'
require 'bootstrap-sass/assets/javascripts/bootstrap/collapse.js'
require 'bootstrap-sass/assets/javascripts/bootstrap/dropdown.js'
require 'bootstrap-sass/assets/javascripts/bootstrap/alert.js'
require 'bootstrap-sass/assets/javascripts/bootstrap/modal.js'
require 'bootstrap-sass/assets/javascripts/bootstrap/affix.js'
require 'bootstrap-sass/assets/javascripts/bootstrap/scrollspy.js'
require 'font-awesome/css/font-awesome.css'
require 'animate.css/animate.css'
require './scss/bootstrap'

$('[scroll-section]').smoothScroll
    offset: - 51

$('body').scrollspy
    target: '.navbar-fixed-top'
    offset: 51

# Closes the Responsive Menu on Menu Item Click
$('.navbar-collapse ul li a').click ->
    $('.navbar-toggle:visible').click()

# Fit Text Plugin for Main Header
$('h1').fitText 1.2,
    minFontSize: '35px'
    maxFontSize: '65px'

# Offset for Main Navigation
$('#mainNav').affix
    offset:
        top: 100

# Initialize WOW.js Scrolling Animations
(new WOW).init()
