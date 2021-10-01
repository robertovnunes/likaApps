<?php
/* @var $this NicController */
/* @var $model Nic */

$this->breadcrumbs=array(
	'Nics'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Nic', 'url'=>array('index')),
	array('label'=>'Manage Nic', 'url'=>array('admin')),
);
?>

<h1>Create Nic</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>