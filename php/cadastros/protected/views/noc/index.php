<?php
/* @var $this NocController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Nocs',
);

$this->menu=array(
	array('label'=>'Create Noc', 'url'=>array('create')),
	array('label'=>'Manage Noc', 'url'=>array('admin')),
);
?>

<h1>Nocs</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
