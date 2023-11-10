/* -------------------------- Função para adicionar a classe .active ao link do menu correto -------------------------- */
function setActiveLink() {
  const currentPage = window.location.pathname; // Obtém o caminho da página atual

  // Remove a classe .active de todos os links do menu
  const links = document.querySelectorAll('.nav-item a');
  links.forEach((link) => {
    link.classList.remove('active');
  });

  // Remove a classe .active da brand (Home)
  const homeBrand = document.querySelector('.navbar-brand');
  homeBrand.classList.remove('active');

  // Adiciona a classe .active ao link correspondente à página atual
  if (currentPage.includes('sobre-nos.html')) {
    document.querySelector('.nav-item a[href="sobre-nos.html"]').classList.add('active');
  } else if (currentPage.includes('projetos-e-acoes.html')) {
    document.querySelector('.nav-item a[href="projetos-e-acoes.html"]').classList.add('active');
  } else if (currentPage.includes('cursos.html')) {
    document.querySelector('.nav-item a[href="cursos.html"]').classList.add('active');
  } else if (currentPage.includes('faca-sua-parte.html')) {
    document.querySelector('.nav-item a[href="faca-sua-parte.html"]').classList.add('active');
  } else if (currentPage.includes('contato.html')) {
    document.querySelector('.nav-item a[href="contato.html"]').classList.add('active');
  }
}

// Chama a função para definir o link ativo na página carregada
setActiveLink();

/* --------------------------------- Funções para abrir e fechar o formulário de login -------------------------------- */
// Constantes padrões
const home = document.querySelector('.home');

// Constantes do login/cadastro
const formOpenBtn = document.querySelector('#form-open');
const formContainer = document.querySelector('.form_container');
const formCloseBtn = document.querySelector('.form_close');
const signupBtn = document.querySelector('#signup');
const loginBtn = document.querySelector('#login');
const pwShowHide = document.querySelectorAll('.pw_hide');

// Abre e fecha o formulário de login e cadastro
formOpenBtn.addEventListener('click', () => {
  home.classList.add('show');
});

// Fecha o formulário de login/cadastro
formCloseBtn.addEventListener('click', () => {
  home.classList.remove('show');
});

// Troca o ícone de mostrar e ocultar senha
pwShowHide.forEach((icon) => {
  icon.addEventListener('click', () => {
    let getPwInput = icon.parentElement.querySelector('input');
    if (getPwInput.type === 'password') {
      getPwInput.type = 'text';
      icon.classList.replace('fa-eye-slash', 'fa-eye');
    } else {
      getPwInput.type = 'password';
      icon.classList.replace('fa-eye', 'fa-eye-slash');
    }
  });
});

/* Permite a troca entre o formulário de login e cadastro */
signupBtn.addEventListener('click', (e) => {
  e.preventDefault();
  formContainer.classList.add('active');
});
loginBtn.addEventListener('click', (e) => {
  e.preventDefault();
  formContainer.classList.remove('active');
});

/* ------------------------------ Funções para abrir e fechar o formulário de voluntário ------------------------------ */
// Constantes padrões
const card_form = document.querySelector('.card_form');

// Constantes do login/cadastro
const volunOpenBtn = document.querySelector('#volun_form_open');
const volunCloseBtn = document.querySelector('.volun_form_close');

// Abre e fecha o formulário de login e cadastro
volunOpenBtn.addEventListener('click', (e) => {
  e.preventDefault();
  card_form.classList.add('show');
});

// Fecha o formulário de login/cadastro quando o botão de fechar é clicado
volunCloseBtn.addEventListener('click', () => {
  card_form.classList.remove('show');
});

/* ------------------------------ Funções para abrir e fechar o formulário de voluntário ------------------------------ */
// Constantes padrões
const card_don = document.querySelector('.card_don');

// Constantes do login/cadastro
const donOpenBtn = document.querySelector('#don_form_open');
const donCloseBtn = document.querySelector('.don_form_close');

// Abre e fecha o formulário de login e cadastro
donOpenBtn.addEventListener('click', (e) => {
  e.preventDefault();
  card_don.classList.add('show');
});

// Fecha o formulário de login/cadastro quando o botão de fechar é clicado
donCloseBtn.addEventListener('click', () => {
  card_don.classList.remove('show');
});

/* -------------------------------- Escurece o fundo quando o menu hamburguer é aberto -------------------------------- */
document.addEventListener('DOMContentLoaded', function () {
  var navbarToggler = document.querySelector('.navbar-toggler');
  var overlay = document.getElementById('overlay');

  navbarToggler.addEventListener('click', function () {
    // Desabilita o botão do menu hamburguer durante a transição
    navbarToggler.setAttribute('disabled', 'disabled');

    if (overlay.style.opacity !== '1') {
      overlay.style.opacity = '1';
      overlay.style.visibility = 'visible';
    } else {
      overlay.style.opacity = '0';
      overlay.style.visibility = 'hidden';
    }

    // Habilita o botão do menu hamburguer após a transição
    setTimeout(function () {
      navbarToggler.removeAttribute('disabled');
    }, 500); // Ajuste este valor para a duração da transição
  });
});