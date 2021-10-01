<?php
/* @var $this NocController */
/* @var $model Noc */

$this->breadcrumbs=array(
	'Nocs'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Noc', 'url'=>array('index')),
	array('label'=>'Create Noc', 'url'=>array('create')),
	array('label'=>'View Noc', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage Noc', 'url'=>array('admin')),
);
?>

<h1>Update Noc <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>