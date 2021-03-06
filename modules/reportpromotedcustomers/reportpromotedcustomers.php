<?php

if (!defined('_PS_VERSION_'))
    exit;

class reportpromotedcustomers extends ModuleGrid
{
    private $html;
    private $query;
    private $columns;

    public function __construct()
    {
        $this->name = 'reportpromotedcustomers';
        $this->tab = 'analytics_stats';
        $this->version = '1.0';
        $this->author = 'Ingenio Contenido Digital SAS';

        parent::__construct();

        $this->columns = array(
            array(
                'id' => 'id_customer',
                'header' => $this->l('ID'),
                'dataIndex' => 'id_customer',
                'align' => 'center'
            ),
            array(
                'id' => 'username',
                'header' => $this->l('Cliente'),
                'dataIndex' => 'username',
                'align' => 'center'
            ),
            array(
                'id' => 'email',
                'header' => $this->l('Email'),
                'dataIndex' => 'email',
                'align' => 'center'
            ),
            array(
                'id' => 'phone',
                'header' => $this->l('Telefono'),
                'dataIndex' => 'phone',
                'align' => 'center'
            ),
            array(
                'id' => 'phone_mobile',
                'header' => $this->l('Telefono Movil'),
                'dataIndex' => 'phone_mobile',
                'align' => 'center'
            ),
            array(
                'id' => 'pendingsinvitation',
                'header' => $this->l('Espacios Disponibles'),
                'dataIndex' => 'pendingsinvitation',
                'align' => 'center'
            ),
            array(
                'id' => 'points',
                'header' => $this->l('Puntos'),
                'dataIndex' => 'points',
                'align' => 'center'
            ),
            array(
                'id' => 'date_add',
                'header' => $this->l('Fecha Promocion'),
                'dataIndex' => 'date_add',
                'align' => 'center'
            ),
            array(
                'id' => 'sponsor',
                'header' => $this->l('Nuevo Padrino'),
                'dataIndex' => 'sponsor',
                'align' => 'center'
            ),
        );

        $this->displayName = $this->l('Reporte Clientes Promovidos');
        $this->description = $this->l('Reporte clientes promovidos de la red');
    }

    public function install()
    {
        return (parent::install() &&
            $this->registerHook('AdminStatsModules'));
    }

    public function getData()
    {
        $date_between = $this->getDate();
        $this->query = "SELECT
                            p.id_customer,
                            c.username,
                            c.email,
                            SUM(r.credits) points,
                            p.date_add,
                            c2.username sponsor,
                            a.phone,
                            a.phone_mobile,
                            (SELECT 2 - COUNT(rs.id_sponsorship)
                            FROM ps_rewards_sponsorship rs 
                            WHERE rs.id_sponsor = p.id_customer) pendingsinvitation
                        FROM "._DB_PREFIX_."promoted p
                        INNER JOIN "._DB_PREFIX_."customer c ON ( p.id_customer = c.id_customer )
                        INNER JOIN "._DB_PREFIX_."rewards_sponsorship rs1 ON ( p.id_customer = rs1.id_customer )
                        INNER JOIN "._DB_PREFIX_."customer c2 ON ( rs1.id_sponsor = c2.id_customer )
                        LEFT JOIN "._DB_PREFIX_."rewards r ON ( c.id_customer = r.id_customer AND r.id_reward_state = 2 )
                        LEFT JOIN "._DB_PREFIX_."address a ON ( c.id_customer = a.id_customer )
                        WHERE p.date_add BETWEEN ".$date_between."
                        GROUP BY p.id_customer";

        $list = Db::getInstance()->executeS($this->query);

        if ( $list[0]['id_customer'] != "" ) {
            $this->_values = $list;
        }
    }

    public function hookAdminStatsModules($params)
    {
        $this->context->smarty->assign(array(
            'displayName' => $this->displayName,
        ));

        $engine_params = array(
            'id' => 'id_customer',
            'title' => $this->displayName,
            'columns' => $this->columns
        );

        if (Tools::getValue('export')) {
            $this->csvExport($engine_params);
        }

        $this->html = '
		<div class="panel-heading">
			'.$this->displayName.'
		</div>
                '.$this->display(__FILE__, 'AdminStatsModules.tpl').'
		'.$this->engine($engine_params).'
		<a class="btn btn-default export-csv" href="'.Tools::safeOutput($_SERVER['REQUEST_URI'].'&export=').'1">
			<i class="icon-cloud-upload"></i> '.$this->l('CSV Export').'
		</a>';

        return $this->html;
    }
}