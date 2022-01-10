"use strict";

const selectSongToDelete = (id) => {
  const deleteSongForm = document.forms["deleteSongForm"];
  const songIdInput = deleteSongForm["songId"];

  songIdInput.value = id;

  $("#deleteSongModal").modal("show");
}
