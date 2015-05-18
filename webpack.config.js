var path = require('path'),
    fs = require('fs'),
    webpack = require("webpack"),
    libPath = path.join(__dirname, 'lib'),
    wwwPath = path.join(__dirname, 'www'),
    pkg = require('./package.json'),
    HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
    entry: {
        vendor: path.join(libPath, 'index.coffee'),
        home: path.join(libPath, 'home', 'home.coffee'),
        gettingStarted: path.join(libPath, 'gettingStarted', 'gettingStarted.coffee'),
    },
    output: {
        path: wwwPath,
        filename: '[name].bundle-[hash:6].js',
        chunkFilename: "[id].bundle.js"
    },
    module: {
        loaders: [{
            test: /\.html$/,
            loader: 'html'
        }, {
            test: /\.md$/,
            loader: "html!markdown"
        }, {
            test: /\.json$/,
            loader: "json"
        }, {
            test: /\.(png|jpg)$/,
            loader: 'file?name=img/[name].[ext]' // inline base64 URLs for <=10kb images, direct URLs for the rest
        }, {
            test: /\.css$/,
            loader: "style!css"
        }, {
            test: /\.coffee$/,
            loader: "coffee"
        }, {
            test: /\.scss$/,
            loader: "style!css!autoprefixer!sass"
        }, {
            test: [/fontawesome-webfont\.svg/, /fontawesome-webfont\.eot/, /fontawesome-webfont\.ttf/, /fontawesome-webfont\.woff/],
            loader: 'file?name=fonts/[name].[ext]'
        }]
    },
    resolve: {
        extensions: ['', '.js', '.json', '.scss', '.coffee', '.html']
    },
    externals: {
        "jquery": "jQuery"
    },
    plugins: [
        new webpack.optimize.CommonsChunkPlugin("vendor", "vendor-[hash:6].js"),
        new webpack.optimize.CommonsChunkPlugin("home", "home-[hash:6].js"),
        new webpack.optimize.CommonsChunkPlugin("gettingStarted", "gettingStarted-[hash:6].js"),
        new HtmlWebpackPlugin({
            filename: 'index.html',
            pkg: pkg,
            // chunks: ['home'],
            // excludeChunks: ['gettingStarted'],
            template: path.join(libPath, 'home', 'home.html')
        }),
        new HtmlWebpackPlugin({
            filename: 'getting-started.html',
            pkg: pkg,
            // chunks: ['gettingStarted'],
            // excludeChunks: ['home'],
            template: path.join(libPath, 'gettingStarted', 'gettingStarted.html')
        })
    ]
};