class Strings {
  // #region generic strings
  static const String email = 'email';
  static const String password = 'senha';
  static const String add = 'adicionar';
  static const String hidePassword = 'Ocultar senha';
  static const String showPassword = 'Exibir senha';
  static const String save = 'Salvar';
  static const String send = 'enviar';
  static const String logout = 'Sair';
  static const String cancel = 'Cancelar';
  static const String confirm = 'Confirmar';
  static const String close = 'Fechar';
  static const String warning = 'Atenção';
  static const String loadingMore = 'Carregar mais';

  // #endregion

  // #region login
  static const String titleLoginPage = 'iupp! Que bom que você veio!';
  static const String subTitleLoginPage = 'Acesse sua conta ou cadastre-se';
  static const String loginWithEmail = 'Ou entre com seu e-mail e senha';
  static const String forgotPassword = 'oops! esqueci minha senha';
  static const String buttonLogin = 'entrar';
  static const String labelDontHaveAccount = 'ainda não possui conta? ';
  static const String labelRegisterNow = 'cadastre-se aqui';
  static const String loginWithGoogle = 'Fazer login com o Google';
  static const String emailPlaceholder = 'seu e-mail cadastrado';
  static const String passwordPlaceholder = 'digite sua senha';

  // #endregion

// #region products
  static const String products = 'Produtos';
  static const String productNotFound =
      'opps! \nnão conseguimos \nencontrar nenhum \nproduto';
  static const String newProduct = 'Novo produto';
  static const String addProduct = 'Adicionar produto';
  static const String removeProduct = 'Remover produto';
  static const String productName = 'Nome do produto';
  static const String productDescription = 'Descrição do produto';
  static const String productPrice = 'Preço do produto';
  static const String cancelEditWarning =
      'Você deseja realmente sair? \nOs dados não serão salvos.';
  static const String confirmDeleting =
      'Você realmente deseja apagar este produto?';
  static const String removingProductSuccess = 'Produto removido com sucesso';
  static const String removingProductError = 'Erro ao remover um produto';
  static const String usePointsAndMoney = 'ou utilize pontos + dinheiro';

  static String winSomePoints(var points) => 'ganhe $points pts';
  static const String points = 'pontos';
  static const String card = 'cartão';

// #endregion

// #region register
  static const String registerTitle = 'Cadastro';
  static const String registerSubTitle =
      'Faça um rápido cadastro e comece sua experiência iupp!';
  static const String invalidEmail = 'Email inválido';
  static const String validatePassword =
      'A senha precisa ter mais que 6 caracteres';
  static const String confirmPassword = 'confirmação de senha';
  static const String equalPasswords = 'As senhas devem ser iguais';
  static const String accountAlreadyExists =
      'Já existe uma conta com este email.';
  static const String register = 'cadastrar';
  static const String agreeWithTerms =
      'Concordo que meus dados sejam utilizados pelo iupp e aceito os Termos de Condições e a Política de Privacidade.';

// #endregion

// #region search gifs
  static const String gifs = 'Gifs';

// #endregion

// #region animals
  static const String animals = 'Pets';
  static const String lifeTime = 'Vida: ';
  static const String years = ' anos';
  static const String dogs = 'cães';
  static const String cats = 'gatos';

// #endregion

// #region forget password
  static const String titleForgetPasswordPage = 'oops! Esqueceu sua senha?';
  static const String subTitleForgetPasswordPage =
      'Não se preocupe, enviaremos em e-mail com um link para que você possa redefinir sua senha.';
  static const String confirmEmail = 'Confirme seu email';
  static const String emailSendSuccess = 'E-mail enviado com sucesso';
// #endregion
}
