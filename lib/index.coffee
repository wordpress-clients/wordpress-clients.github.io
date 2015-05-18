require 'expose?$!expose?jQuery!jquery'
require 'expose?WOW!./js/wow'
require './js/jquery.fittext'
require './js/checkbox'
require './js/social-share-kit'
require './js/ga'
require 'jquery-smooth-scroll'
require 'bootstrap-sass/assets/javascripts/bootstrap/transition.js'
require 'bootstrap-sass/assets/javascripts/bootstrap/collapse.js'
require 'bootstrap-sass/assets/javascripts/bootstrap/dropdown.js'
# require 'bootstrap-sass/assets/javascripts/bootstrap/alert.js'
# require 'bootstrap-sass/assets/javascripts/bootstrap/modal.js'
require 'bootstrap-sass/assets/javascripts/bootstrap/affix.js'
require 'bootstrap-sass/assets/javascripts/bootstrap/scrollspy.js'
require 'font-awesome/css/font-awesome.css'
require 'animate.css/animate.css'
require './js/material-loader.js'
require '!file?name=css/style.css!autoprefixer!sass!./scss/bootstrap'
# img
require './img/opengraph.jpg'

SocialShareKit.init
    text: 'Build amazing WordPress based applications effortless and for free! #wphc'
    url: 'http://wphc.julienrenaux.fr/'
    title: 'WordPress Hybrid Client'
    twitter:
        via: 'julienrenaux'
    facebook:
        via: 'julienrenauxblog'
