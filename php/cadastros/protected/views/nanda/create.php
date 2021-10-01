<?php
/* @var $this NandaController */
/* @var $model Nanda */

$this->breadcrumbs=array(
	'Nandas'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Nanda', 'url'=>array('index')),
	array('label'=>'Manage Nanda', 'url'=>array('admin')),
);
?>

<h1>Create Nanda</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>