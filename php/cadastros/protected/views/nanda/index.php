<?php
/* @var $this NandaController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Nandas',
);

$this->menu=array(
	array('label'=>'Create Nanda', 'url'=>array('create')),
	array('label'=>'Manage Nanda', 'url'=>array('admin')),
);
?>

<h1>Nandas</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
