<?php
/* @var $this NicController */
/* @var $model Nic */

$this->breadcrumbs=array(
	'Nics'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List Nic', 'url'=>array('index')),
	array('label'=>'Create Nic', 'url'=>array('create')),
	array('label'=>'Update Nic', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Nic', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Nic', 'url'=>array('admin')),
);
?>

<h1>View Nic #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'codigo',
		'descricao',
	),
)); ?>
