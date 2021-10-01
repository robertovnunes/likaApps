<?php
/* @var $this NicController */
/* @var $model Nic */

$this->breadcrumbs=array(
	'Nics'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Nic', 'url'=>array('index')),
	array('label'=>'Create Nic', 'url'=>array('create')),
	array('label'=>'View Nic', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage Nic', 'url'=>array('admin')),
);
?>

<h1>Update Nic <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>