"use strict";

function changeSelected(select, unselect1, unselect2){
    select.classList.add("selected");
    unselect1.classList.remove("selected");
    unselect2.classList.remove("selected");
}

const register = document.querySelector(".register");
const login = document.querySelector(".login");
const recover = document.querySelector(".recover");
const form = document.querySelector(".form");

register.addEventListener("click", ()=>{
    changeSelected(register, login, recover);
    form.innerHTML = `
    <input class="loginInput" type="text" placeholder="Ingrese correo electrónico" name="email">
    <input class="loginInput" type="text placeholder="Ingrese nombre de usuario" name="username">
    <input class="loginInput" type="password" placeholder="Ingrese contraseña" name="password">
    <input class="input loginInput" type="submit" value="Crear cuenta"></input>
    `
})

login.addEventListener("click", ()=>{
    changeSelected(login, recover, register);
    form.innerHTML = `
    <input class="loginInput" type="text" placeholder="Ingrese correo electrónico" name="email">
    <input class="loginInput" type="password" placeholder="Ingrese contraseña" name="password">
    <input class="input loginInput" type="submit" value="Iniciar sesión"></input>
    `
})

recover.addEventListener("click", ()=>{
    changeSelected(recover, register, login);
    form.innerHTML = `
    <input class="loginInput" type="text" placeholder="Ingrese correo electrónico" name="email">
    <input class="input loginInput" type="submit" value="Enviar correo de recuperación">
    `
})