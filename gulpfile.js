var gulp = require('gulp'),
    path = require('path'),
    header = require('gulp-header'),
    webpack = require('webpack'),
    gulpWebpack = require('gulp-webpack'),
    extend = require('util')._extend,
    pkg = require('./package.json'),
    runSequence = require('run-sequence'),
    sitemap = require('gulp-sitemap'),
    del = require('del'),
    vinylPaths = require('vinyl-paths'),
    webpackBuildConfig = require("./webpack.config.js"),
    libPath = path.join(__dirname, 'lib'),
    wwwPath = path.join(__dirname, 'www');

var banner = ['/*!',
    ' * <%= pkg.title %> v<%= pkg.version %>',
    ' * <%= pkg.description %>',
    ' * Authors: @julienrenaux: https://github.com/shprink',
    ' */',
    ''
].join('\n');

gulp.task('default', ['dev']);
gulp.task('prod', function(callback) {
    runSequence('_build:clean', '_build:prod', '_sitemap', 'build:header', callback);
});

gulp.task('dev', function(callback) {
    runSequence('_build:clean', '_build:dev', callback);
});

gulp.task('_build:clean', function(cb) {
    return gulp.src(wwwPath).pipe(vinylPaths(del));
});

gulp.task("_build:dev", function(callback) {
    var webpackConfig = extend({}, webpackBuildConfig);
    return gulp.src(webpackConfig.entry.vendor)
        .pipe(gulpWebpack(webpackConfig))
        .pipe(gulp.dest(wwwPath));
});

gulp.task("_build:prod", function(callback) {
    var webpackConfig = extend({}, webpackBuildConfig);
    webpackConfig.plugins.push(new webpack.optimize.UglifyJsPlugin({
        'nc': true,
        output: {
            comments: false
        }
    }));
    return gulp.src(webpackConfig.entry.vendor)
        .pipe(gulpWebpack(webpackConfig))
        .pipe(gulp.dest(wwwPath));
});

gulp.task("build:header", ["_build:header:css", "_build:header:js"]);

gulp.task("_build:header:css", function(callback) {
    var wwwPathCss = path.join(wwwPath, 'css');
    return gulp.src(path.join(wwwPathCss, 'style.css'))
        .pipe(header(banner, {
            pkg: pkg
        }))
        .pipe(gulp.dest(wwwPathCss));
});

gulp.task("_build:header:js", function(callback) {
    return gulp.src(path.join(wwwPath, '*.js'))
        .pipe(header(banner, {
            pkg: pkg
        }))
        .pipe(gulp.dest(wwwPath));
});

gulp.task('_sitemap', function() {
    gulp.src(path.join(libPath, '*.html'))
        .pipe(sitemap({
            siteUrl: 'http://wphc.julienrenaux.fr'
        }))
        .pipe(gulp.dest(wwwPath));
});