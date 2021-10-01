<?php
/* @var $this NicController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Nics',
);

$this->menu=array(
	array('label'=>'Create Nic', 'url'=>array('create')),
	array('label'=>'Manage Nic', 'url'=>array('admin')),
);
?>

<h1>Nics</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
