// Função para adicionar a classe .active ao link do menu correto
function setActiveLink() {
  const currentPage = window.location.pathname // Obtém o caminho da página atual

  // Remove a classe .active de todos os links do menu
  const links = document.querySelectorAll('.nav-item a')
  links.forEach((link) => {
    link.classList.remove('active')
  })

  // Remove a classe .active da brand (Home)
  const homeBrand = document.querySelector('.navbar-brand')
  homeBrand.classList.remove('active')

  // Adiciona a classe .active ao link correspondente à página atual
  if (currentPage.includes('sobre-nos.html')) {
    document.querySelector('.nav-item a[href="sobre-nos.html"]').classList.add('active')
  } else if (currentPage.includes('projetos-e-acoes.html')) {
    document.querySelector('.nav-item a[href="projetos-e-acoes.html"]').classList.add('active')
  } else if (currentPage.includes('cursos.html')) {
    document.querySelector('.nav-item a[href="cursos.html"]').classList.add('active')
  } else if (currentPage.includes('faca-sua-parte.html')) {
    document.querySelector('.nav-item a[href="faca-sua-parte.html"]').classList.add('active')
  }
}

/* ------------------------------ Funções Para Abrir e Fechar o Formulário de Contato ------------------------------ */
// Constantes padrões
const msg_sec = document.querySelector('.msg_sec')

// Constantes do login/cadastro
const msgOpenBtn = document.querySelector('#msg-open')
const msgCloseBtn = document.querySelector('.msg_close')

// Abre e fecha o formulário de login e cadastro
msgOpenBtn.addEventListener('click', (e) => {
  e.preventDefault()
  msg_sec.classList.add('show')
})

// Fecha o fFormulário de Contato quando o botão de fechar é clicado
msgCloseBtn.addEventListener('click', () => {
  msg_sec.classList.remove('show')
})

// Chama a função para definir o link ativo na página carregada
setActiveLink()

/* --------------------------------- Funções para abrir e fechar o formulário de login -------------------------------- */
// Constantes padrões
const home = document.querySelector('.home')

// Constantes do login/cadastro
const formOpenBtn = document.querySelector('#form-open')
const formContainer = document.querySelector('.form_container')
const formCloseBtn = document.querySelector('.form_close')
const signupBtn = document.querySelector('#signup')
const loginBtn = document.querySelector('#login')
const pwShowHide = document.querySelectorAll('.pw_hide')

// Abre e fecha o formulário de login e cadastro
formOpenBtn.addEventListener('click', () => {
  home.classList.add('show')
})

// Fecha o formulário de login/cadastro
formCloseBtn.addEventListener('click', () => {
  home.classList.remove('show')
})

// Troca o ícone de mostrar e ocultar senha
pwShowHide.forEach((icon) => {
  icon.addEventListener('click', () => {
    let getPwInput = icon.parentElement.querySelector('input')
    if (getPwInput.type === 'password') {
      getPwInput.type = 'text'
      icon.classList.replace('fa-eye-slash', 'fa-eye')
    } else {
      getPwInput.type = 'password'
      icon.classList.replace('fa-eye', 'fa-eye-slash')
    }
  })
})

/* Permite a troca entre o formulário de login e cadastro */
signupBtn.addEventListener('click', (e) => {
  e.preventDefault()
  formContainer.classList.add('active')
})
loginBtn.addEventListener('click', (e) => {
  e.preventDefault()
  formContainer.classList.remove('active')
})

/* -------------------------------- Escurece o fundo quando o menu hamburguer é aberto -------------------------------- */
document.addEventListener('DOMContentLoaded', function () {
  var navbarToggler = document.querySelector('.navbar-toggler')
  var overlay = document.getElementById('overlay')

  navbarToggler.addEventListener('click', function () {
    // Desabilita o botão do menu hamburguer durante a transição
    navbarToggler.setAttribute('disabled', 'disabled')

    if (overlay.style.opacity !== '1') {
      overlay.style.opacity = '1'
      overlay.style.visibility = 'visible'
    } else {
      overlay.style.opacity = '0'
      overlay.style.visibility = 'hidden'
    }

    // Habilita o botão do menu hamburguer após a transição
    setTimeout(function () {
      navbarToggler.removeAttribute('disabled')
    }, 500) // Ajuste este valor para a duração da transição
  })
})

/* ------------------------------------------------------ Tabela ------------------------------------------------------ */
/*$(document).ready(function () {
  $('[data-toggle="tooltip"]').tooltip()
  var actions = $('table td:last-child').html()
  // Append table with add row form on add new button click
  $('.add-new').click(function () {
    $(this).attr('disabled', 'disabled')
    var index = $('table tbody tr:last-child').index()
    var row =
      '<tr>' +
      '<td><input type="text" class="form-control" name="name" id="name"></td>' +
      '<td><input type="text" class="form-control" name="department" id="department"></td>' +
      '<td><input type="text" class="form-control" name="phone" id="phone"></td>' +
      '<td>' +
      actions +
      '</td>' +
      '</tr>'
    $('table').append(row)
    $('table tbody tr')
      .eq(index + 1)
      .find('.add, .edit')
      .toggle()
    $('[data-toggle="tooltip"]').tooltip()
  })
  // Add row on add button click
  $(document).on('click', '.add', function () {
    var empty = false
    var input = $(this).parents('tr').find('input[type="text"]')
    input.each(function () {
      if (!$(this).val()) {
        $(this).addClass('error')
        empty = true
      } else {
        $(this).removeClass('error')
      }
    })
    $(this).parents('tr').find('.error').first().focus()
    if (!empty) {
      input.each(function () {
        $(this).parent('td').html($(this).val())
      })
      $(this).parents('tr').find('.add, .edit').toggle()
      $('.add-new').removeAttr('disabled')
    }
  })
  // Edit row on edit button click
  $(document).on('click', '.edit', function () {
    $(this)
      .parents('tr')
      .find('td:not(:last-child)')
      .each(function () {
        $(this).html('<input type="text" class="form-control" value="' + $(this).text() + '">')
      })
    $(this).parents('tr').find('.add, .edit').toggle()
    $('.add-new').attr('disabled', 'disabled')
  })
  // Delete row on delete button click
  $(document).on('click', '.delete', function () {
    $(this).parents('tr').remove()
    $('.add-new').removeAttr('disabled')
  })
})*/

/* ------------------------------------------------------ Tabela ------------------------------------------------------ */
/* $(document).ready(function () {
  $('[data-toggle="tooltip"]').tooltip()
  var actions = $('table td:last-child').html()

  // Adiciona uma nova linha na tabela para inserir um novo contato
  $('.add-new').click(function () {
    $(this).attr('disabled', 'disabled')
    var index = $('table tbody tr:last-child').index()
    var row =
      '<tr>' +
      '<td><input type="text" class="form-control" name="nome" id="nome"></td>' +
      '<td><input type="text" class="form-control" name="email" id="email"></td>' +
      '<td><input type="text" class="form-control" name="telefone" id="telefone"></td>' +
      '<td><input type="text" class="form-control" name="mensagem" id="mensagem"></td>' +
      '<td>' +
      actions +
      '</td>' +
      '</tr>'
    $('table').append(row)
    $('table tbody tr')
      .eq(index + 1)
      .find('.add, .edit')
      .toggle()
    $('[data-toggle="tooltip"]').tooltip()
  })

  // Adiciona um contato ao banco de dados quando o botão de adicionar é clicado
  $(document).on('click', '.add', function () {
    var empty = false
    var input = $(this).parents('tr').find('input[type="text"]')
    input.each(function () {
      if (!$(this).val()) {
        $(this).addClass('error')
        empty = true
      } else {
        $(this).removeClass('error')
      }
    })
    $(this).parents('tr').find('.error').first().focus()
    if (!empty) {
      var contato = {
        nome: $('#nome').val(),
        email: $('#email').val(),
        telefone: $('#telefone').val(),
        mensagem: $('#mensagem').val(),
      }

      // Chamada AJAX para adicionar o contato
      $.ajax({
        url: '/contatos/adicionar', // Substitua pela URL do seu endpoint
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(contato),
        success: function (response) {
          // Atualiza a tabela com o novo contato
          location.reload()
        },
        error: function (error) {
          console.log(error)
        },
      })
    }
  })

  // Edita um contato existente
  $(document).on('click', '.edit', function () {
    $(this)
      .parents('tr')
      .find('td:not(:last-child)')
      .each(function () {
        $(this).html('<input type="text" class="form-control" value="' + $(this).text() + '">')
      })
    $(this).parents('tr').find('.add, .edit').toggle()
    $('.add-new').attr('disabled', 'disabled')
  })

  // Deleta um contato
  $(document).on('click', '.delete', function () {
    var contatoId = $(this).data('id') // Supondo que você tenha um atributo data-id no botão de deletar

    // Chamada AJAX para deletar o contato
    $.ajax({
      url: '/contatos/deletar/' + contatoId, // Substitua pela URL do seu endpoint
      type: 'DELETE',
      success: function (response) {
        // Remove a linha da tabela
        location.reload()
      },
      error: function (error) {
        console.log(error)
      },
    })
  })
}) */

$(document).ready(function () {
  $('[data-toggle="tooltip"]').tooltip()
  var actions = $('#actionButtons').html()

  // Adiciona uma nova linha na tabela para inserir um novo contato
  $('.add-new').click(function () {
    $(this).attr('disabled', 'disabled')
    var index = $('table tbody tr:last-child').index()
    var row =
      '<tr>' +
      '<td><input type="text" class="form-control" name="id" disabled></td>' +
      '<td><input type="text" class="form-control" name="nome" id="nome"></td>' +
      '<td><input type="email" class="form-control" name="email" id="email"></td>' +
      '<td><input type="tel" class="form-control" name="telefone" id="telefone"></td>' +
      '<td><input type="text" class="form-control" name="mensagem" id="mensagem"></td>' +
      '<td>' +
      actions +
      '</td>' +
      '</tr>'
    $('table tbody').append(row)
    $('table tbody tr')
      .eq(index + 1)
      .find('.add, .edit')
      .toggle()
    $('[data-toggle="tooltip"]').tooltip()
  })

  // Adiciona um contato ao banco de dados quando o botão de adicionar é clicado
  $(document).on('click', '.add', function () {
    var empty = false
    var input = $(this).parents('tr').find('input[type="text"], input[type="email"], input[type="tel"]')
    input.each(function () {
      if (!$(this).val()) {
        $(this).addClass('error')
        empty = true
      } else {
        $(this).removeClass('error')
      }
    })
    $(this).parents('tr').find('.error').first().focus()
    if (!empty) {
      var contato = {
        nome: $('#nome').val(),
        email: $('#email').val(),
        telefone: $('#telefone').val(),
        mensagem: $('#mensagem').val(),
      }

      // Chamada AJAX para adicionar o contato
      $.ajax({
        url: '/contatos/adicionar', // Substitua pela URL do seu endpoint
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(contato),
        success: function (response) {
          // Atualiza a tabela com o novo contato
          location.reload()
        },
        error: function (error) {
          console.log(error)
        },
      })
    }
  })

  // Edit row on edit button click
  $(document).on('click', '.edit', function () {
    $(this)
      .parents('tr')
      .find('td:not(:last-child)')
      .each(function () {
        $(this).html('<input type="text" class="form-control" value="' + $(this).text() + '">')
      })
    $(this).parents('tr').find('.add, .edit').toggle()
    $('.add-new').removeAttr('disabled')
  })

  // Delete row on delete button click
  $(document).on('click', '.delete', function () {
    var contatoId = $(this).data('id') // Supondo que você tenha um atributo data-id no botão de deletar

    // Chamada AJAX para deletar o contato
    $.ajax({
      url: '/contatos/deletar/' + contatoId, // Substitua pela URL do seu endpoint
      type: 'DELETE',
      success: function (response) {
        // Remove a linha da tabela
        location.reload()
      },
      error: function (error) {
        console.log(error)
      },
    })
  })
})
