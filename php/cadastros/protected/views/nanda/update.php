<?php
/* @var $this NandaController */
/* @var $model Nanda */

$this->breadcrumbs=array(
	'Nandas'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Nanda', 'url'=>array('index')),
	array('label'=>'Create Nanda', 'url'=>array('create')),
	array('label'=>'View Nanda', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage Nanda', 'url'=>array('admin')),
);
?>

<h1>Update Nanda <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>