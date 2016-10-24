<?php

class AdminCashOutControllerCore extends AdminController
{
    public function __construct()
    {
        $this->bootstrap = true;
        $this->lang = false;
        $this->context = Context::getContext();
        $this->table = 'rewards_payment';
        
        $this->_select = 'a.id_payment, a.nombre, a.apellido, a.numero_tarjeta, a.banco, a.credits, a.date_add, a.id_status, b.name AS name, b.id_status';
        $this->_join = '
		LEFT JOIN `'._DB_PREFIX_.'rewards_payment_state` b ON (b.`id_status` = a.`id_status`)
                ';
        $this->_orderBy = 'a.id_payment';
        $this->_use_found_rows = true;
        
        $this->fields_list = array(
            'id_payment' => array('title' => $this->l('ID Pago'), 'align' => 'center', 'class' => 'fixed-width-xs'),
            'nombre' => array('title' => $this->l('Nombre')),
            'apellido' => array('title' => $this->l('Apellido')),
            'numero_tarjeta' => array('title' => $this->l('Numero de Tarjeta')),
            'banco' => array('title' => $this->l('Banco')),
            'name' => array(
                'title' => $this->l('Estado'),
                'type' => 'select',
                'color' => 'color',
                'list' => $this->status(),
                'filter_key' => 'b!id_status',
                'filter_type' => 'int',
                'order_key' => 'name'
            ),
            'credits' => array('title' => $this->l('Pago')),
            'date_add' => array(
                'title' => $this->l('Fecha'),
                'type' => 'datetime',
                'align' => 'text-center',
                'filter_key' => 'a!date_add'
            )
            
            /*'active' => array('title' => $this->l('Active'), 'align' => 'center', 'active' => 'status',
                'type' => 'bool', 'class' => 'fixed-width-sm'),*/
        );
        
        /*$this->fields_options = array(
            'general' => array(
                'title' =>    $this->l('Employee options'),
                'fields' =>    array(
                    'PS_PASSWD_TIME_BACK' => array(
                        'title' => $this->l('Password regeneration'),
                        'hint' => $this->l('Security: Minimum time to wait between two password changes.'),
                        'cast' => 'intval',
                        'type' => 'text',
                        'suffix' => ' '.$this->l('minutes'),
                        'visibility' => Shop::CONTEXT_ALL
                    ),
                    'PS_BO_ALLOW_EMPLOYEE_FORM_LANG' => array(
                        'title' => $this->l('Memorize the language used in Admin panel forms'),
                        'hint' => $this->l('Allow employees to select a specific language for the Admin panel form.'),
                        'cast' => 'intval',
                        'type' => 'select',
                        'identifier' => 'value',
                        'list' => array(
                            '0' => array('value' => 0, 'name' => $this->l('No')),
                            '1' => array('value' => 1, 'name' => $this->l('Yes')
                        )
                    ), 'visibility' => Shop::CONTEXT_ALL)
                ),
                'submit' => array('title' => $this->l('Save'))
            )
        );*/

        parent::__construct();
    }
    
    public function status(){
        
        $query = 'SELECT name, id_status FROM '._DB_PREFIX_.'rewards_payment_state';
        $array = DB::getInstance()->executeS($query);
        
        return array_map('current', $array);
        
    }

    public function postProcess()
    {
        return parent::postProcess();
    }

    public function initContent()
    {
        return parent::initContent();
    }
}