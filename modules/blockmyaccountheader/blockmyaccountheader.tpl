{*
* 2007-2015 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2015 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<!-- Block myaccountheader module -->
<div class="accountHeader col-lg-3 col-md-6 col-sm-12 col-xs-12">
        {if $logged}
        <button class="block_content2" id="block_content2" type="button" data-toggle="dropdown">MI CUENTA &nbsp;&nbsp;<i class="icon icon-chevron-down"></i></button>
        <button class="block_content2" id="block_content3" type="button" data-toggle="dropdown"></button>
		
                <ul class="bullet dropdown-menu menu-account">
                        <li><a class="back-account">{l s='Regresar' mod='blockmyaccountheader'}</a></li>
			<li><a href="{$link->getPageLink('my-account', true)|escape:'html'}" title="">{l s='My Account' mod='blockmyaccountheader'}</a></li>
			{*if $returnAllowed}<li><a href="{$link->getPageLink('order-follow', true)|escape:'html'}" title="{l s='My merchandise returns' mod='blockmyaccountheader'}">{l s='My merchandise returns' mod='blockmyaccountheader'}</a></li>{/if*}
			{*<li><a href="{$link->getPageLink('cardsview', true)|escape:'html'}" title="{l s='My Cards' mod='blockmyaccountheader'}">{l s='My Cards' mod='blockmyaccountheader'}</a></li>*}
			<li><a href="{$link->getPageLink('discount', true)|escape:'html'}" title="{l s='My network' mod='blockmyaccountheader'}">{l s='My Network' mod='blockmyaccountheader'}</a></li>
			<li><a href="{$link->getModuleLink('allinone_rewards', 'sponsorship', [], true)|escape:'html':'UTF-8'}" title="Invitar amigos">Invitar amigos</a></li>
                        <li><a href="{$link->getPageLink('cashout', true)|escape:'html'}" title="{l s='Cash Out' mod='blockmyaccountheader'}">{l s='Cash Out' mod='blockmyaccountheader'}</a></li>
			{*if $voucherAllowed}<li><a href="{$link->getPageLink('discount', true)|escape:'html'}" title="{l s='My vouchers' mod='blockmyaccountheader'}">{l s='My vouchers' mod='blockmyaccountheader'}</a></li>{/if*}
			{*$HOOK_BLOCK_MY_ACCOUNT*}
                        
                        <li class="logout signUp"><a style="border-bottom: none;" href="{$link->getPageLink('index', true, NULL, "mylogout")|escape:'html'}" title="{l s='Sign out' mod='blockmyaccountheader'}">{l s='Sign out' mod='blockmyaccountheader'}</a></li>
                </ul>
        {else}
            <button class="block_content2" id="block_content2" type="button" data-toggle="dropdown">MI CUENTA &nbsp;&nbsp;<i class="icon icon-chevron-down"></i></button>
            <button class="block_content2" id="block_content3" type="button" data-toggle="dropdown"></button>
	
            <ul class="bullet dropdown-menu menu-account">
                        <li><a class="back-account">{l s='Regresar' mod='blockmyaccountheader'}</a></li>
			<li><a href="{$link->getPageLink('my-account', true)|escape:'html'}" title="">{l s='My Account' mod='blockmyaccountheader'}</a></li>
			<li><a href="{$link->getPageLink('discount', true)|escape:'html'}" title="{l s='My network' mod='blockmyaccountheader'}">{l s='My Network' mod='blockmyaccountheader'}</a></li>
			<li><a href="{$link->getModuleLink('allinone_rewards', 'sponsorship', [], true)|escape:'html':'UTF-8'}" title="Invitar amigos">Invitar amigos</a></li>
                        <li><a href="{$link->getPageLink('cashout', true)|escape:'html'}" title="{l s='Cash Out' mod='blockmyaccountheader'}">{l s='Cash Out' mod='blockmyaccountheader'}</a></li>
                        <li class="logout signUp"><a style="border-bottom: none;" href="{$link->getPageLink('index', true, NULL, "mylogout")|escape:'html'}" title="{l s='Sign out' mod='blockmyaccountheader'}">{l s='Sign out' mod='blockmyaccountheader'}</a></li>
            </ul>
        {/if}
</div>
<!-- /Block myaccount module -->
{literal}
    <script>
        $(document).ready(function() {
            $('.back-account').click(function(){
               $('.menu-account').hide('slow'); 
            });
            $('.x-close').click(function(){
                $('.menu-down').fadeOut('slow');
                $('.menu-account').fadeOut('slow');
                $('.block_content3').show();
                $(".x-close").hide();
            })
        });
    </script>
{/literal}