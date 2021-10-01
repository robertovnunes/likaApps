<?php
/* @var $this NocController */
/* @var $model Noc */

$this->breadcrumbs=array(
	'Nocs'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Noc', 'url'=>array('index')),
	array('label'=>'Manage Noc', 'url'=>array('admin')),
);
?>

<h1>Create Noc</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>