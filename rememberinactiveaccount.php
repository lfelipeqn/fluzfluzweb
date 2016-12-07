<?php 
include_once('./config/defines.inc.php');
include_once('./config/config.inc.php');
include_once('./modules/allinone_rewards/models/RewardsSponsorshipModel.php');

$customers = Db::getInstance()->executeS("SELECT
                                            IF( o.date_add IS NULL , DATEDIFF(NOW(),MAX(c.date_add)) , DATEDIFF(NOW(),MAX(o.date_add)) ) days_inactive,
                                            c.id_customer,
                                            c.username,
                                            c.email
                                        FROM "._DB_PREFIX_."customer c
                                        LEFT JOIN "._DB_PREFIX_."orders o ON ( c.id_customer = o.id_customer )
                                        GROUP BY c.id_customer
                                        HAVING days_inactive IN ( 30 , 45 , 52 , 59 , 60 )");

// echo '<pre>'; print_r($customers); die();

foreach ( $customers as $key => $customer ) {

    $subject = "";
    $message_alert = "Si tu cuenta Fluz Fluz permanece inactiva por un total de 60 dias,";
    switch ( $customer['days_inactive'] ) {
        case 30:
            $subject = "Tus 2 compras minimas del mes!";
            $message_alert .= " se cancelara.";
            break;
        case 45:
            $subject = "Para gozar de los beneficios Fluz Fuz, recuerda realizar tus 2 compras minimas!";
            $message_alert .= " (15 dias mas) se cancelara.";
            break;
        case 52:
            $subject = "Olvidaste hacer tus 2 compras minimas en Fluz Fluz.";
            $message_alert .= " (8 dias mas) se cancelara.";
            break;
        case 59:
            $subject = "Alerta de Cancelacion de cuenta en Fluz Fluz.";
            $message_alert .= " (1 dias mas) se cancelara.";
            break;
        case 60:
            $subject = "Tu cuenta sera Cancelada.";
            $message_alert .= " se cancelara. Este es el ultimo dia para que renueves la actividad, antes de que tu cuenta se cancele.";
            break;
    }
    
    $contributor_count = 0;
    $listsponsorships = "";
    $sponsorships = RewardsSponsorshipModel::_getTree($customer['id_customer']);
    foreach ( $sponsorships as $sponsorship ) {
        if ( $sponsorship['id'] != $customer['id_customer'] ) {
            $contributor_count++;
            $listsponsorships .= $sponsorship['id'].',';
        }
    }

    $points_count = Db::getInstance()->getValue("SELECT SUM(credits)
                                            FROM ps_rewards
                                            WHERE id_reward_state = 2
                                            AND plugin = 'sponsorship'
                                            AND id_customer IN ( ".substr($listsponsorships, 0, -1)." )");

    $vars = array(
        '{username}' => $customer['username'],
        '{days_inactive}' => $customer['days_inactive'],
        '{message}' => $message_alert,
        '{contributor_count}' => $contributor_count,
        '{points_count}' => $points_count == "" ? 0 : round($points_count),
        '{shop_name}' => Configuration::get('PS_SHOP_NAME'),
        '{shop_url}' => Context::getContext()->link->getPageLink('index', true, Context::getContext()->language->id, null, false, Context::getContext()->shop->id),
        '{learn_more_url}' => "http://reglas.fluzfluz.co"
    );

    Mail::Send(
        Context::getContext()->language->id,
        'remember_inactive_account',
        $subject,
        $vars,
        $customer['email'],
        $customer['username']
    );
}
