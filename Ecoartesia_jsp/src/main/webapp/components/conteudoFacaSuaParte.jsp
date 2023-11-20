<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <!-- QR Code -->
    <section class="card_don">
      <div class="don_container bg-image">
        <i class="fa-solid fa-xmark fa-fade don_form_close"></i>
        <div class="form don_form">
          <form action="#">
            <h2>Fa�a a sua doa��o</h2>
            <p>
              Use seu celular para escanear o c�digo QR abaixo e fazer uma doa��o via Pix. � f�cil e r�pido! Basta abrir a c�mera do seu celular e
              apont�-la para o c�digo QR. Voc� ser� redirecionado para a p�gina de pagamento. Agradecemos sua coopera��o!
            </p>
            <div class="image-container">
              <img src="assets/img/qrcode.png" class="qrcode" alt="QR Code" />
            </div>
          </form>
        </div>
      </div>
    </section>

    <!-- Conte�do da p�gina -->
    <main>
      <section class="section parallax">
        <div class="container">
          <h2 class="display-3 display-md-4">FA�A PARTE DA REDE</h2>
          <h2 class="display-3 display-md-4">ECOARTESIA!</h2>
          <p class="fs-4 fs-md-2">"Plantar ideias ecol�gicas � a garantia de um futuro f�rtil, tempo de colhermos sustentabilidade."</p>
          <p class="fs-5 fs-md-2">- Gabriel Garc�a de Oliveira</p>
        </div>
      </section>
      <section class="section-info">
        <h4>Voc� se identifica com a miss�o da Ecoartesia e quer fazer parte dessa rede de transforma��o social e</h4>
        <h4>ambiental, existem v�rias formas de ajudar. Voc� pode:</h4>

        <div class="container text-center">
          <div class="row">
            <ol class="col list">
              <li>Se inscrever nos cursos online ou presenciais da Ecoartesia e aprender sobre economia circular;</li>
              <li>
                Se tornar um volunt�rio da Ecoartesia e participar das atividades de educa��o ambiental, limpeza urbana, mobiliza��o social, etc;
              </li>
              <li>Doar materiais recicl�veis ou recursos financeiros para a Ecoartesia continuar seu trabalho;</li>
              <li>Divulgar a Ecoartesia nas suas redes sociais e incentivar outras pessoas a conhecerem o projeto;</li>
            </ol>
          </div>
        </div>
      </section>

      <!-- Volunt�rio -->
      <div class="card-group">
        <div class="card mb-0">
          <div class="card-body py-0 bg-image">
            <h5 class="card-title">Fa�a parte da Ecoartesia</h5>
            <p class="card-text">
              Seja um membro ativo da nossa comunidade comprometida com pr�ticas sustent�veis. Junte-se a n�s para promover um futuro mais verde e
              consciente!
            </p>
            <!-- Bot�o para abrir formul�rio do volunt�rio -->
            <div class="btn_link_vonl">
              <a href="#" class="btn btn-link bg-image" id="volun_form_open"> Seja um volunt�rio </a>
            </div>
          </div>
        </div>

        <!-- Doa��es -->
        <div class="card mb-0 custom-card-don">
          <div class="card-body py-0 bg-image">
            <h5 class="card-title">Fa�a uma doa��o</h5>
            <p class="card-text">
              Contribua para a nossa causa e ajude-nos a continuar fazendo a diferen�a na preserva��o do meio ambiente e na promo��o da
              sustentabilidade.
            </p>
            <!-- Bot�o para abrir o qrcode -->
            <div class="btn_link_don">
              <a href="#" class="btn btn-link bg-image" id="don_form_open"> Fa�a uma doa��o </a>
            </div>
          </div>
        </div>
      </div>
    </main>