<?php
/* @var $this NandaController */
/* @var $data Nanda */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('codigo')); ?>:</b>
	<?php echo CHtml::encode($data->codigo); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('descricao_conceito')); ?>:</b>
	<?php echo CHtml::encode($data->descricao_conceito); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('eixo')); ?>:</b>
	<?php echo CHtml::encode($data->eixo); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('termo')); ?>:</b>
	<?php echo CHtml::encode($data->termo); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('versao')); ?>:</b>
	<?php echo CHtml::encode($data->versao); ?>
	<br />


</div>