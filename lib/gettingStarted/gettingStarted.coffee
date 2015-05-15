showdown = require 'showdown'
converter = new showdown.Converter()
require './gettingStarted.scss'
tagSelected = ''
documentSelected = ''
tagSelect = $("#version-selector").change () ->
    tagSelected = $(@).val()
    loadDocument documentSelected

preloader = new $.materialPreloader
    position: 'top'
    height: '5px'
    col_1: '#159756'
    col_2: '#da4733'
    col_3: '#3b78e7'
    col_4: '#fdba2c'
    fadeIn: 200
    fadeOut: 200

preloader.on()

loadDocument = (file) ->
    documentSelected = file
    preloader.on()
    $.ajax
        dataType: 'text'
        cache: true
        url: "https://cdn.rawgit.com/shprink/wordpress-hybrid-client/#{ tagSelected }/#{ file }"
    .done (content) ->
        html = converter.makeHtml content
        $('#documentation-content').html html
    .fail ->
        url = "https://github.com/shprink/wordpress-hybrid-client/blob/#{ tagSelected }/#{ file }"
        html = "Something wrong happened, documentation: <a href='#{ url }' target='_blank'>#{ url }</a>"
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

latestTagPromise = $.ajax
    dataType: 'json'
    cache: true
    url: 'https://api.github.com/repos/shprink/wordpress-hybrid-client/git/refs/heads/master'
tagListPromise = $.ajax
    dataType: 'json'
    cache: true
    url: 'https://api.github.com/repos/shprink/wordpress-hybrid-client/tags'

selectList = []
pushToList = (value, text) ->
    selectList.push
        val: value
        text: text

$.when(latestTagPromise, tagListPromise)
    .done ( latestTagResponse, tagListResponse ) ->
        if latestTagResponse[1] is 'success'
            pushToList latestTagResponse[0].object.sha, 'Latest'

        if tagListResponse[1] is 'success'
            pushToList tag.commit.sha, tag.name for tag in tagListResponse[0]

        for version, i in selectList
            el = $("<option />")
            .val version.val
            .text version.text
            el.prop 'selected', true if i is 0

            tagSelect.append el

        # Init page
        tagSelected = selectList[0].val
        loadDocument 'INSTALLATION.md'
