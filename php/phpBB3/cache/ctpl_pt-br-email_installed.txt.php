<?php if (!defined('IN_PHPBB')) exit; ?>Subject: phpBB Olympus Instalado!

Parabéns,

Você instalou com sucesso o phpBB no seu servidor!

Este email contém informações sobre sua instalação, e deve ser mantido em local seguro. A senha foi encriptografada em nosso banco de dados e não pode ser recuperada. Você poderá requerer uma nova senha, mas perderá esta aqui.

----------------------------
Usuário: <?php echo (isset($this->_rootref['USERNAME'])) ? $this->_rootref['USERNAME'] : ''; ?>
Password: <?php echo (isset($this->_rootref['PASSWORD'])) ? $this->_rootref['PASSWORD'] : ''; ?>

URL do Fórum: <?php echo (isset($this->_rootref['U_BOARD'])) ? $this->_rootref['U_BOARD'] : ''; ?>
----------------------------

Assuntos e informações pertinentes sobre a sua instalação podem ser encontrados na sua pasta de Documentos (dentro do diretório docs) ou então em um dos suportes abaixo: 
+ http://www.phpbb.com/support/ (Suporte Oficial em Inglês)
+ http://www.phpbbrasil.com.br/ (Suporte em Português Brasileiro)

Em ordem de manter o seu fórum seguro e salvo, é altamente recomendado que mantenha seu fórum atualizado, que podem ser facilmente conseguidas se inscrevendo na Lista de Emails do phpBB.com, localizado no link abaixo.

+ http://www.phpbb.com/support/

<?php echo (isset($this->_rootref['EMAIL_SIG'])) ? $this->_rootref['EMAIL_SIG'] : ''; ?>