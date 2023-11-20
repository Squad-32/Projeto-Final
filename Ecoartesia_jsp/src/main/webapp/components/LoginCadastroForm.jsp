<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <div class="form_container">
        <i class="fa-solid fa-xmark fa-fade form_close" id="X"></i>
        <!-- Formulário de login -->
        <div class="form login_form">
          <form action="#">
            <h2>Login</h2>

            <div class="form-group">
              <input type="email" placeholder="Digite seu email" required />
              <i class="fa-solid fa-envelope fa-fade email"></i>
            </div>

            <div class="form-group">
              <input type="password" placeholder="Digite sua senha" required />
              <i class="fa-solid fa-unlock-keyhole fa-fade password"></i>
              <i class="fa-solid fa-eye-slash fa-fade pw_hide"></i>
            </div>

            <div class="option_field">
              <span class="checkbox">
                <input type="checkbox" id="check" />
                <label for="check">Lembre-se de mim</label>
              </span>
              <a href="#" class="forgot_pw" id="forgot_custom">Esqueceu sua senha?</a>
            </div>

            <button class="lgn_button">Fazer Login</button>

            <div class="login_signup">Não possui uma conta? <a href="#" id="signup">Cadastrar</a></div>
          </form>
        </div>

        <!-- Formulário de cadastro -->
        <div class="form signup_form">
          <form action="#">
            <h2>Cadastro</h2>

            <div class="form-group">
              <input type="email" placeholder="Digite seu email" required />
              <i class="fa-solid fa-envelope fa-fade email"></i>
            </div>

            <div class="form-group">
              <input type="password" placeholder="Senha" required />
              <i class="fa-solid fa-unlock-keyhole fa-fade password"></i>
              <i class="fa-solid fa-eye-slash fa-fade pw_hide"></i>
            </div>

            <div class="form-group">
              <input type="password" placeholder="Confirmar senha" required />
              <i class="fa-solid fa-unlock-keyhole fa-fade password"></i>
              <i class="fa-solid fa-eye-slash fa-fade pw_hide"></i>
            </div>

            <button class="sgn_button">Fazer Cadastro</button>

            <div class="login_signup">Já possui uma conta? <a href="#" id="login">Login</a></div>
          </form>
        </div>
      </div>
    </section>