require './home.scss'

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

$(":checkbox").labelauty
    label: false

console.log 'home'
