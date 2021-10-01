<?php if (!defined('IN_PHPBB')) exit; ?>﻿Subject: Bem vindo a "<?php echo (isset($this->_rootref['SITENAME'])) ? $this->_rootref['SITENAME'] : ''; ?>"

<?php echo (isset($this->_rootref['WELCOME_MSG'])) ? $this->_rootref['WELCOME_MSG'] : ''; ?>

Por favor, salve este email para consultas futuras. As informações sobre sua conta são as seguintes:

----------------------------
Usuário:      <?php echo (isset($this->_rootref['USERNAME'])) ? $this->_rootref['USERNAME'] : ''; ?>


URL do Fórum: <?php echo (isset($this->_rootref['U_BOARD'])) ? $this->_rootref['U_BOARD'] : ''; ?>
----------------------------

Sua conta encontra-se inativa, o administrador do fórum necessita ativar-lá para você poder entrar no fórum. Você receberá outro email quando isto ocorrer.

Por favor, não esqueça a sua senha pois ela esta encriptada no banco de dados e nós não podemos recuperá-la para você. Entretanto, você se esquecer de sua senha você pode pedir uma nova. 

Sua senha foi armazenada com segurança em nosso banco de dados e não poderá ser recuperada. Caso tenha esquecido a mesma, você poderá definir uma nova usando este endereço de email associado a esta conta no login da comunidade.

Obrigado por se registrar.

<?php echo (isset($this->_rootref['EMAIL_SIG'])) ? $this->_rootref['EMAIL_SIG'] : ''; ?>