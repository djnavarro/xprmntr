/**
 * xprmntr.js
 * Danielle Navarro
 *
 **/

var xprmntr = {};
xprmntr.savelocally = function(file, data) {
  var xhr = new XMLHttpRequest();
  xhr.open('POST', 'post');
  xhr.setRequestHeader('Content-Type', 'application/json');
  xhr.send(JSON.stringify({filename: file, filedata: data}));
};
