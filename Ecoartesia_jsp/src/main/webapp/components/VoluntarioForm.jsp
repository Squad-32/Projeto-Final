<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
    <!-- Formul�rio para volunt�rio -->
    <section class="card_form">
      <div class="volun_container bg-image">
        <i class="fa-solid fa-xmark fa-fade volun_form_close"></i>
        <div class="form volun_form">
          <form action="#">
            <h2>Registro para Volunt�rios</h2>

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

            <div class="form-group">
              <input type="text" placeholder="CEP" required />
              <i class="fa-solid fa-barcode fa-fade cep"></i>
            </div>

            <div class="form-group">
              <input type="text" placeholder="Endere�o" required />
              <i class="fa-solid fa-home fa-fade address"></i>
            </div>

            <div class="form-group">
              <input type="text" placeholder="N�mero" required />
              <i class="fa-solid fa-hashtag fa-fade number"></i>
            </div>

            <div class="form-group">
              <input type="text" placeholder="Complemento" required />
              <i class="fa-solid fa-plus fa-fade complement"></i>
            </div>

            <div class="form-group">
              <input type="text" placeholder="Bairro" required />
              <i class="fa-solid fa-map-marker fa-fade neighborhood"></i>
            </div>

            <div class="dropdown">
              <button class="btn btn-secondary form-group" id="dropdown-btn" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                Selecione o estado...
                <i class="fa-solid fa-caret-down fa-fade"></i>
              </button>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#" value="">Selecione o estado...</a></li>
                <li><a class="dropdown-item" href="#" value="AC">Acre (AC)</a></li>
                <li><a class="dropdown-item" href="#" value="AL">Alagoas (AL)</a></li>
                <li><a class="dropdown-item" href="#" value="AP">Amap� (AP)</a></li>
                <li><a class="dropdown-item" href="#" value="AM">Amazonas (AM)</a></li>
                <li><a class="dropdown-item" href="#" value="BA">Bahia (BA)</a></li>
                <li><a class="dropdown-item" href="#" value="CE">Cear� (CE)</a></li>
                <li><a class="dropdown-item" href="#" value="DF">Distrito Federal (DF)</a></li>
                <li><a class="dropdown-item" href="#" value="ES">Esp�rito Santo (ES)</a></li>
                <li><a class="dropdown-item" href="#" value="GO">Goi�s (GO)</a></li>
                <li><a class="dropdown-item" href="#" value="MA">Maranh�o (MA)</a></li>
                <li><a class="dropdown-item" href="#" value="MT">Mato Grosso (MT)</a></li>
                <li><a class="dropdown-item" href="#" value="MS">Mato Grosso do Sul (MS)</a></li>
                <li><a class="dropdown-item" href="#" value="MG">Minas Gerais (MG)</a></li>
                <li><a class="dropdown-item" href="#" value="PA">Par� (PA)</a></li>
                <li><a class="dropdown-item" href="#" value="PB">Para�ba (PB)</a></li>
                <li><a class="dropdown-item" href="#" value="PR">Paran� (PR)</a></li>
                <li><a class="dropdown-item" href="#" value="PE">Pernambuco (PE)</a></li>
                <li><a class="dropdown-item" href="#" value="PI">Piau� (PI)</a></li>
                <li><a class="dropdown-item" href="#" value="RJ">Rio de Janeiro (RJ)</a></li>
                <li><a class="dropdown-item" href="#" value="RN">Rio Grande do Norte (RN)</a></li>
                <li><a class="dropdown-item" href="#" value="RS">Rio Grande do Sul (RS)</a></li>
                <li><a class="dropdown-item" href="#" value="RO">Rond�nia (RO)</a></li>
                <li><a class="dropdown-item" href="#" value="RR">Roraima (RR)</a></li>
                <li><a class="dropdown-item" href="#" value="SC">Santa Catarina (SC)</a></li>
                <li><a class="dropdown-item" href="#" value="SP">S�o Paulo (SP)</a></li>
                <li><a class="dropdown-item" href="#" value="SE">Sergipe (SE)</a></li>
                <li><a class="dropdown-item" href="#" value="TO">Tocantins (TO)</a></li>
              </ul>
              <i class="fa-solid fa-flag fa-fade state"></i>
            </div>

            <div class="form-group">
              <input type="text" placeholder="Cidade" required />
              <i class="fa-solid fa-city fa-fade city"></i>
            </div>

            <button class="volun_button">Confirmar</button>
          </form>
        </div>
      </div>
    </section>