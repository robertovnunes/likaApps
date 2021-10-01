<?php
/* @var $this NandaController */
/* @var $model Nanda */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'nanda-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'codigo'); ?>
		<?php echo $form->textField($model,'codigo'); ?>
		<?php echo $form->error($model,'codigo'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'descricao_conceito'); ?>
		<?php echo $form->textArea($model,'descricao_conceito',array('rows'=>6, 'cols'=>50)); ?>
		<?php echo $form->error($model,'descricao_conceito'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'eixo'); ?>
		<?php echo $form->textField($model,'eixo',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'eixo'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'termo'); ?>
		<?php echo $form->textField($model,'termo',array('size'=>60,'maxlength'=>100)); ?>
		<?php echo $form->error($model,'termo'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'versao'); ?>
		<?php echo $form->textField($model,'versao',array('size'=>10,'maxlength'=>10)); ?>
		<?php echo $form->error($model,'versao'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->