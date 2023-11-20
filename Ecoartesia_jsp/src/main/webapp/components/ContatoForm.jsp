<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

      <section class="msg_sec">
        <div class="msg_container bg-image">
          <i class="fa-solid fa-xmark fa-fade msg_close"></i>
          <form action="#">
            <h2>Contato</h2>

            <div class="form-group">
              <input type="text" placeholder="Digite seu nome" required />
              <i class="fa-solid fa-user fa-fade name"></i>
            </div>

            <div class="form-group">
              <input type="email" placeholder="Digite seu email" required />
              <i class="fa-solid fa-envelope fa-fade email"></i>
            </div>
            <div class="form-group">
              <input type="tel" placeholder="Telefone" required />
              <i class="fa-solid fa-phone fa-fade phone"></i>
            </div>

            <div class="form-group" id="form-group-msg">
              <textarea placeholder="Digite sua mensagem..." required></textarea>
              <i class="fa-regular fa-comment-dots fa-fade message"></i>
            </div>
            <button class="msg_button">Enviar Mensagem</button>
          </form>
        </div>
      </section>