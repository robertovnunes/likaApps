<?php if (!defined('IN_PHPBB')) exit; ?>﻿Subject: Nova conta de usuário

Olá,

A conta de usuário "<?php echo (isset($this->_rootref['USERNAME'])) ? $this->_rootref['USERNAME'] : ''; ?>" foi desativada ou recém-criada, você poderá verificar os detalhes deste usuário (se necessário) e ativá-lo através do seguinte atalho:

<?php echo (isset($this->_rootref['U_ACTIVATE'])) ? $this->_rootref['U_ACTIVATE'] : ''; ?>

Use este link para conferir o perfil criado:
<?php echo (isset($this->_rootref['U_USER_DETAILS'])) ? $this->_rootref['U_USER_DETAILS'] : ''; ?>

<?php echo (isset($this->_rootref['EMAIL_SIG'])) ? $this->_rootref['EMAIL_SIG'] : ''; ?>