<?php
/* @var $this NocController */
/* @var $model Noc */

$this->breadcrumbs=array(
	'Nocs'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List Noc', 'url'=>array('index')),
	array('label'=>'Create Noc', 'url'=>array('create')),
	array('label'=>'Update Noc', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Noc', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Noc', 'url'=>array('admin')),
);
?>

<h1>View Noc #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'codigo',
		'descricao',
	),
)); ?>
