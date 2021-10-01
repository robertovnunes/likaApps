<?php
/* @var $this NandaController */
/* @var $model Nanda */

$this->breadcrumbs=array(
	'Nandas'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List Nanda', 'url'=>array('index')),
	array('label'=>'Create Nanda', 'url'=>array('create')),
	array('label'=>'Update Nanda', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Nanda', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Nanda', 'url'=>array('admin')),
);
?>

<h1>View Nanda #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'codigo',
		'descricao_conceito',
		'eixo',
		'termo',
		'versao',
	),
)); ?>
