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
  } else if (currentPage.includes('blog.html')) {
    document.querySelector('.nav-item a[href="blog.html"]').classList.add('active');
  } else if (currentPage.includes('produtos.html')) {
    document.querySelector('.nav-item a[href="produtos.html"]').classList.add('active');
  } else if (currentPage.includes('faca-sua-parte.html')) {
    document.querySelector('.nav-item a[href="faca-sua-parte.html"]').classList.add('active');
  } else if (currentPage.includes('contato.html')) {
    document.querySelector('.nav-item a[href="contato.html"]').classList.add('active');
  } else if (currentPage.includes('login.html')) {
    document.querySelector('.nav-item a[href="login.html"]').classList.add('active');
  }
}

// Chama a função para definir o link ativo na página carregada
setActiveLink();