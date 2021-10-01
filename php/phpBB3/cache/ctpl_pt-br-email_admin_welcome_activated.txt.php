<?php if (!defined('IN_PHPBB')) exit; ?>Subject: Conta ativada

Olá <?php echo (isset($this->_rootref['USERNAME'])) ? $this->_rootref['USERNAME'] : ''; ?>,

Sua conta em "<?php echo (isset($this->_rootref['SITENAME'])) ? $this->_rootref['SITENAME'] : ''; ?>" está ativada agora, você poderá acessá-la pelo seu nome de usuário e respectiva senha que você recebeu no email anterior.

<?php echo (isset($this->_rootref['EMAIL_SIG'])) ? $this->_rootref['EMAIL_SIG'] : ''; ?>