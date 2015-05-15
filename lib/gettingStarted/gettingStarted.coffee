showdown = require 'showdown'
converter = new showdown.Converter()
require './gettingStarted.scss'

preloader = new $.materialPreloader
    position: 'top'
    height: '5px'
    col_1: '#159756'
    col_2: '#da4733'
    col_3: '#3b78e7'
    col_4: '#fdba2c'
    fadeIn: 200
    fadeOut: 200

loadDocument = (documentUrl) ->
    preloader.on()
    $.ajax
        url: 'https://cdn.rawgit.com/shprink/wordpress-hybrid-client/' + documentUrl
    .done (content) ->
        html = converter.makeHtml content
        $('#documentation-content').html html
    .fail ->
        documentUrl = 'https://github.com/shprink/wordpress-hybrid-client/' + 'blob/' + documentUrl
        html = "Something wrong happened, documentation: <a href='#{ documentUrl }' target='_blank'>#{ documentUrl }</a>"
        $('#documentation-content').html html
    .always ->
        preloader.off()

bindClicks = (el, page) ->
    el.click ->
        loadDocument page
        $('.menu-button').parents().removeClass 'active'
        el.parent().addClass 'active'

$('.menu-button').each ->
    bindClicks $(this), $(this).data('page')

loadDocument 'master/INSTALLATION.md'
