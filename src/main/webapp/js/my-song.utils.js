"use strict";

/**
Listener para pausa o player atual quando um novo começar a tocar
 */
document.addEventListener('play', (event) => {
  var audios = document.getElementsByTagName('audio');
  for (var i = 0, len = audios.length; i < len; i++) {
    if (audios[i] != event.target) {
      audios[i].pause();
    }
  }
}, true);
