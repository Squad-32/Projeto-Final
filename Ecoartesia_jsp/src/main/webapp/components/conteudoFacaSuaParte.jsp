<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <!-- QR Code -->
    <section class="card_don">
      <div class="don_container bg-image">
        <i class="fa-solid fa-xmark fa-fade don_form_close"></i>
        <div class="form don_form">
          <form action="#">
            <h2>Faça a sua doação</h2>
            <p>
              Use seu celular para escanear o código QR abaixo e fazer uma doação via Pix. É fácil e rápido! Basta abrir a câmera do seu celular e
              apontá-la para o código QR. Você será redirecionado para a página de pagamento. Agradecemos sua cooperação!
            </p>
            <div class="image-container">
              <img src="assets/img/qrcode.png" class="qrcode" alt="QR Code" />
            </div>
          </form>
        </div>
      </div>
    </section>

    <!-- Conteúdo da página -->
    <main>
      <section class="section parallax">
        <div class="container">
          <h2 class="display-3 display-md-4">FAÇA PARTE DA REDE</h2>
          <h2 class="display-3 display-md-4">ECOARTESIA!</h2>
          <p class="fs-4 fs-md-2">"Plantar ideias ecológicas é a garantia de um futuro fértil, tempo de colhermos sustentabilidade."</p>
          <p class="fs-5 fs-md-2">- Gabriel García de Oliveira</p>
        </div>
      </section>
      <section class="section-info">
        <h4>Você se identifica com a missão da Ecoartesia e quer fazer parte dessa rede de transformação social e</h4>
        <h4>ambiental, existem várias formas de ajudar. Você pode:</h4>

        <div class="container text-center">
          <div class="row">
            <ol class="col list">
              <li>Se inscrever nos cursos online ou presenciais da Ecoartesia e aprender sobre economia circular;</li>
              <li>
                Se tornar um voluntário da Ecoartesia e participar das atividades de educação ambiental, limpeza urbana, mobilização social, etc;
              </li>
              <li>Doar materiais recicláveis ou recursos financeiros para a Ecoartesia continuar seu trabalho;</li>
              <li>Divulgar a Ecoartesia nas suas redes sociais e incentivar outras pessoas a conhecerem o projeto;</li>
            </ol>
          </div>
        </div>
      </section>

      <!-- Voluntário -->
      <div class="card-group">
        <div class="card mb-0">
          <div class="card-body py-0 bg-image">
            <h5 class="card-title">Faça parte da Ecoartesia</h5>
            <p class="card-text">
              Seja um membro ativo da nossa comunidade comprometida com práticas sustentáveis. Junte-se a nós para promover um futuro mais verde e
              consciente!
            </p>
            <!-- Botão para abrir formulário do voluntário -->
            <div class="btn_link_vonl">
              <a href="#" class="btn btn-link bg-image" id="volun_form_open"> Seja um voluntário </a>
            </div>
          </div>
        </div>

        <!-- Doações -->
        <div class="card mb-0 custom-card-don">
          <div class="card-body py-0 bg-image">
            <h5 class="card-title">Faça uma doação</h5>
            <p class="card-text">
              Contribua para a nossa causa e ajude-nos a continuar fazendo a diferença na preservação do meio ambiente e na promoção da
              sustentabilidade.
            </p>
            <!-- Botão para abrir o qrcode -->
            <div class="btn_link_don">
              <a href="#" class="btn btn-link bg-image" id="don_form_open"> Faça uma doação </a>
            </div>
          </div>
        </div>
      </div>
    </main>