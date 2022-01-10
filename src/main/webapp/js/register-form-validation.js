"use strict";

const getValidationFormByQueryParam = () => {
  const urlSearchParams = new URLSearchParams(window.location.search);
  const params = Object.fromEntries(urlSearchParams.entries());

  if (params && params.userHasExists) {
    const userHasExistsContainer = document.getElementById("userHasExistsContainer");

    userHasExistsContainer.classList.remove("d-none");
  }

  if (params && params.userCreated) {
    const userCreatedContainer = document.getElementById("userCreatedContainer");

    userCreatedContainer.classList.remove("d-none");
  }
}

const checkInputValidity = (input) => {
  if (!input.checkValidity()) {
    input.classList.add("is-invalid");
  }
}

const checkPasswordsMustMatch = (userPasswordInput, userRepeatPasswordInput) => {
  const invalidFormContainer = document.getElementById("invalidFormContainer");
  const passwordsMustMatchContainer = document.getElementById("passwordsMustMatchContainer");

  if (userPasswordInput.checkValidity() && userRepeatPasswordInput.checkValidity() && userPasswordInput.value !== userRepeatPasswordInput.value) {
    userPasswordInput.classList.add("is-invalid");
    userRepeatPasswordInput.classList.add("is-invalid");
    invalidFormContainer.classList.add("d-none");
    passwordsMustMatchContainer.classList.remove("d-none");
  }

}

const register = () => {
  const registerForm = document.forms["registerForm"];
  const userNameInput = registerForm["userName"];
  const userEmailInput = registerForm["userEmail"];
  const userPasswordInput = registerForm["userPassword"];
  const userRepeatPasswordInput = registerForm["userRepeatPassword"];
  const invalidFormContainer = document.getElementById("invalidFormContainer");
  const userHasExistsContainer = document.getElementById("userHasExistsContainer");
  const passwordsMustMatchContainer = document.getElementById("passwordsMustMatchContainer");
  const userCreatedContainer = document.getElementById("userCreatedContainer");

  invalidFormContainer.classList.add("d-none");
  userHasExistsContainer.classList.add("d-none");
  passwordsMustMatchContainer.classList.add("d-none");
  userCreatedContainer.classList.add("d-none");

  userNameInput.classList.remove("is-invalid");
  userEmailInput.classList.remove("is-invalid");
  userPasswordInput.classList.remove("is-invalid");
  userRepeatPasswordInput.classList.remove("is-invalid");

  if (userNameInput.checkValidity() && userEmailInput.checkValidity() && userPasswordInput.checkValidity() && userRepeatPasswordInput.checkValidity() && userPasswordInput.value === userRepeatPasswordInput.value) {
    registerForm.submit();
  } else {
    checkInputValidity(userNameInput);
    checkInputValidity(userEmailInput);
    checkInputValidity(userPasswordInput);
    checkInputValidity(userRepeatPasswordInput);

    invalidFormContainer.classList.remove("d-none");

    checkPasswordsMustMatch(userPasswordInput, userRepeatPasswordInput);
  }
}

getValidationFormByQueryParam();
