document.head.innerHTML += '<!-- Dank Theme by nanalan -->\n<link href="https://fonts.googleapis.com/css?family=Hind:400,500|Montserrat" rel="stylesheet">\n<style id="dank">' + css + '</style>'

if(window.jQuery) document.body.classList.add('dank')
else document.body.classList.add('dank-new')

document.querySelector('#footer p').innerHTML += '.<br><a href="https://github.com/nanalan/dank-theme">Dank Theme</a> is a project by <a href="/users/nanalan">@nanalan</a> and is being used on this page right now.'
