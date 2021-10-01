<?php

/**
 * This is the model class for table "Nanda".
 *
 * The followings are the available columns in table 'Nanda':
 * @property integer $id
 * @property integer $codigo
 * @property string $descricao_conceito
 * @property string $eixo
 * @property string $termo
 * @property string $versao
 */
class Nanda extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'nanda';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('codigo', 'numerical', 'integerOnly'=>true),
			array('eixo', 'length', 'max'=>50),
			array('termo', 'length', 'max'=>100),
			array('versao', 'length', 'max'=>10),
			array('descricao_conceito', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, codigo, descricao_conceito, eixo, termo, versao', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'codigo' => 'Codigo',
			'descricao_conceito' => 'Descricao Conceito',
			'eixo' => 'Eixo',
			'termo' => 'Termo',
			'versao' => 'Versao',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('codigo',$this->codigo);
		$criteria->compare('descricao_conceito',$this->descricao_conceito,true);
		$criteria->compare('eixo',$this->eixo,true);
		$criteria->compare('termo',$this->termo,true);
		$criteria->compare('versao',$this->versao,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Nanda the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
