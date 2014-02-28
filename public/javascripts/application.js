click = function(direction) {
  var xhr = new XMLHttpRequest();
  xhr.open('POST', '/click', true);
  xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
  xhr.send('direction=' + direction);
}

clickLeft = function() {
  click('left');
}

clickRight = function() {
  click('right');
}
