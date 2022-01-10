"use strict";

const checkInputValidity = (input) => {
  if (!input.checkValidity()) {
    input.classList.add("is-invalid");
  }
}

const login = () => {
  const loginForm = document.forms["loginForm"];
  const userEmailInput = loginForm["userEmail"];
  const userPasswordInput = loginForm["userPassword"];
  const invalidFormContainer = document.getElementById("invalidFormContainer");
  const userNotFoundContainer = document.getElementById("userNotFoundContainer");
  const sessionExpiredContainer = document.getElementById("sessionExpiredContainer");

  invalidFormContainer.classList.add("d-none");
  userNotFoundContainer.classList.add("d-none");
  sessionExpiredContainer.classList.add("d-none");

  userEmailInput.classList.remove("is-invalid");
  userPasswordInput.classList.remove("is-invalid");

  if (userEmailInput.checkValidity() && userPasswordInput.checkValidity()) {
    loginForm.submit();
  } else {
    checkInputValidity(userEmailInput);
    checkInputValidity(userPasswordInput);

    invalidFormContainer.classList.remove("d-none");
  }
}
