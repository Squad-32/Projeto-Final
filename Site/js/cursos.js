// Função para adicionar a classe .active ao link do menu correto
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
  }
}

/* ------------------------------ Funções Para Abrir e Fechar o Formulário de Contato ------------------------------ */
// Constantes padrões
const msg_sec = document.querySelector('.msg_sec');

// Constantes do login/cadastro
const msgOpenBtn = document.querySelector('#msg-open');
const msgCloseBtn = document.querySelector('.msg_close');

// Abre e fecha o formulário de login e cadastro
msgOpenBtn.addEventListener('click', (e) => {
  e.preventDefault();
  msg_sec.classList.add('show');
});

// Fecha o fFormulário de Contato quando o botão de fechar é clicado
msgCloseBtn.addEventListener('click', () => {
  msg_sec.classList.remove('show');
});

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

/*  */
const main_video = document.querySelector('.main-video video');
const main_video_title = document.querySelector('.main-video .title');
const video_playlist = document.querySelector('.video-playlist .videos');

let data = [
  {
    id: 'a1',
    title: 'Diversidade e inclusão',
    name: '../vid/Diversidade e inclusão.mp4',
    duration: '0:12',
  },
  {
    id: 'a2',
    title: 'Preparo e Cuidado Com o Solo',
    name: '../vid/Preparo e Cuidado Com o Solo.mp4',
    duration: '1:02',
  },
  {
    id: 'a3',
    title: 'Ações Voluntária de Limpeza',
    name: '../vid/Ações Voluntária de Limpeza.mp4',
    duration: '0:14',
  },
  {
    id: 'a4',
    title: 'Empoderamento e Liderança',
    name: '../vid/Empoderamento e Liderança.mp4',
    duration: '0:08',
  },
  {
    id: 'a5',
    title: 'Permacultura',
    name: '../vid/Permacultura.mp4',
    duration: '0:15',
  },
  {
    id: 'a6',
    title: 'Descarte Consciente',
    name: '../vid/Descarte Consciente.mp4',
    duration: '0:09',
  },
  {
    id: 'a7',
    title: 'Agricultura Sustentável',
    name: '../vid/Agricultura Sustentável.mp4',
    duration: '0:29',
  },
  {
    id: 'a8',
    title: 'Consumo Consciente',
    name: '../vid/Consumo Consciente.mp4',
    duration: '0:04',
  },
  {
    id: 'a9',
    title: 'Direitos Humanos e a Diversidade LGBTQIA+',
    name: '../vid/Direitos Humanos e a Diversidade LGBTQIA.mp4',
    duration: '0:17',
  },
  {
    id: 'a10',
    title: 'A Importância da Liderança na Promoção dos Direitos Humanos e da Igualdade',
    name: '../vid/A Importância da Liderança na Promoção dos Direitos Humanos e da Igualdade.mp4',
    duration: '0:39',
  },
];

data.forEach((video, i) => {
  let video_element = `
                <div class="video" data-id="${video.id}">
                    <img src="../img/play.svg" alt="">
                    <p>${i + 1 > 9 ? i + 1 : '0' + (i + 1)}. </p>
                    <h3 class="title">${video.title}</h3>
                    <p class="time">${video.duration}</p>
                </div>
    `;
  video_playlist.innerHTML += video_element;
});

let videos = document.querySelectorAll('.video');
videos[0].classList.add('active');
videos[0].querySelector('img').src = '../img/pause.svg';

videos.forEach((selected_video) => {
  selected_video.onclick = () => {
    for (all_videos of videos) {
      all_videos.classList.remove('active');
      all_videos.querySelector('img').src = '../img/play.svg';
    }

    selected_video.classList.add('active');
    selected_video.querySelector('img').src = '../img/pause.svg';

    let match_video = data.find((video) => video.id == selected_video.dataset.id);
    main_video.src = match_video.name;
    main_video_title.innerHTML = match_video.title;
  };
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