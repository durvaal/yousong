"use strict";

const selectUserToEdit = (id, name) => {
  const editUserForm = document.forms["editUserForm"];
  const userIdInput = editUserForm["userId"];
  const userNameInput = editUserForm["userName"];

  userIdInput.value = id;
  userNameInput.value = name;

  $("#editUserModal").modal("show");
}

const selectUserToDelete = (id) => {
  const deleteUserForm = document.forms["deleteUserForm"];
  const userIdInput = deleteUserForm["userId"];

  userIdInput.value = id;

  $("#deleteUserModal").modal("show");
}


const checkInputValidity = (input) => {
  if (!input.checkValidity()) {
    input.classList.add("is-invalid");
  }
}

const editUserForm = () => {
  const editUserForm = document.forms["editUserForm"];
  const userNameInput = editUserForm["userName"];
  const invalidFormContainer = document.getElementById("invalidFormContainer");

  invalidFormContainer.classList.add("d-none");

  userNameInput.classList.remove("is-invalid");

  if (userNameInput.checkValidity()) {
    editUserForm.submit();
  } else {
    checkInputValidity(userNameInput);

    invalidFormContainer.classList.remove("d-none");
  }
}
