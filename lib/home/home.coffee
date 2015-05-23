require '../js/jquery.ajaxchimp.js'
require './home.scss'
# img
require '../img/header.jpg'
require '../img/phone-case.png'
require '../img/ionic.png'
require '../img/wpapi.png'
require '../img/cordova.png'
require '../img/angular.png'
require '../img/input-checked.png'
require '../img/input-unchecked.png'

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

$(":checkbox.beautify").labelauty
    label: false

$('#features').scrollspy().on 'activate.bs.scrollspy', ->
    alert 'ee'

$('#demo').load ->
    $('#demo-loading').hide()
    $('#phone-case-wrapper').fadeIn 500

$('#newsletter-form').ajaxChimp
    url: 'http://julienrenaux.us11.list-manage.com/subscribe/post?u=6d71d93727ca86fadf997ad3c&amp;id=45e802cef7'
