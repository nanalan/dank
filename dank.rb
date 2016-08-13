require 'stylus'
require 'autoprefixer-rails'

puts 'Compiling...'

compiled = Stylus.compile File.read 'source/dank.styl'
prefixed = AutoprefixerRails.process compiled
css = prefixed.css.gsub("'", '"').delete("\n")

js = File.read 'source/dank.js'

dank = "// ==UserScript==
// @name         Dank Theme
// @namespace    https://github.com/nanalan/dank
// @version      1.0
// @description  A dark & cold Scratch theme.
// @author       nanalan
// @match        https://scratch.mit.edu/*
// @exclude      https://scratch.mit.edu/accounts/*
// @exclude      https://scratch.mit.edu/site-api/*
// @grant        none
// @run-at       document-body
// @downloadURL  https://github.com/nanalan/dank-theme/raw/master/release/dank.user.js
// @updateURL    https://github.com/nanalan/dank-theme/raw/master/release/dank.user.js
// ==/UserScript==

/* jshint ignore:start */
(function() {
  'use strict';
  const css = '#{css}';
  #{js}
})();
/* jshint ignore:end */
"

css = '@-moz-document domain("scratch.mit.edu") { ' + css.gsub(/navbar-color/, '/*[[navbar-color]]*/') + ' }'

File.write 'release/dank.css', css
File.write 'release/dank.user.js', dank

puts '...done!'
