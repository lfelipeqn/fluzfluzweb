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
{if isset($cms) && !isset($cms_category)}
	{if !$cms->active}
		<br />
		<div id="admin-action-cms">
			<p>
				<span>{l s='This CMS page is not visible to your customers.'}</span>
				<input type="hidden" id="admin-action-cms-id" value="{$cms->id}" />
				<input type="submit" value="{l s='Publish'}" name="publish_button" class="button btn btn-default"/>
				<input type="submit" value="{l s='Back'}" name="lnk_view" class="button btn btn-default"/>
			</p>
			<div class="clear" ></div>
			<p id="admin-action-result"></p>
		</div>
                        
	{/if}
        <div class="rte{if $content_only} content_only{/if}">
        {$cms->content}
        </div>
        <div>
        {include file="$tpl_dir./breadcrumb.tpl"}
        </div>
        <div class="row containerFeatured">
                {hook h='customCMS'}
        </div>
        {if $cms->id==6}
            <div class="row containerFeatured"> 
                {hook h='newMerchants'}
            </div>
        {/if}
        {if $cms->id==6}
            <section class="col-sm-8 col-xs-12">
                <article class="sectionBanner"><img src="/img/cms/FluzFluz/categories/sectionBanner.png" /></article>
                <article class="sectionFooter"><img src="/img/cms/FluzFluz/categories/bannerSectionFooter1.png" /> <img src="/img/cms/FluzFluz/categories/bannerSectionFooter2.png" /></article>
            </section>
            <aside class="asideCategory col-sm-4 col-xs-12"><img src="/img/cms/FluzFluz/categories/aside1.png" alt="aside1.png" /><img src="/img/cms/FluzFluz/categories/aside2.png" /></aside>
        {/if}
	       
{elseif isset($cms_category)}
	<div class="block-cms">
		<h1><a href="{if $cms_category->id eq 1}{$base_dir}{else}{$link->getCMSCategoryLink($cms_category->id, $cms_category->link_rewrite)}{/if}">{$cms_category->name|escape:'html':'UTF-8'}</a></h1>
		{if $cms_category->description}
			<p>{$cms_category->description|escape:'html':'UTF-8'}</p>
		{/if}
		{if isset($sub_category) && !empty($sub_category)}	
			<p class="title_block">{l s='List of sub categories in %s:' sprintf=$cms_category->name}</p>
			<ul class="bullet list-group">
				{foreach from=$sub_category item=subcategory}
					<li>
						<a class="list-group-item" href="{$link->getCMSCategoryLink($subcategory.id_cms_category, $subcategory.link_rewrite)|escape:'html':'UTF-8'}">{$subcategory.name|escape:'html':'UTF-8'}</a>
					</li>
				{/foreach}
			</ul>
		{/if}
		{if isset($cms_pages) && !empty($cms_pages)}
		<p class="title_block">{l s='List of pages in %s:' sprintf=$cms_category->name}</p>
			<ul class="bullet list-group">
				{foreach from=$cms_pages item=cmspages}
					<li>
						<a class="list-group-item" href="{$link->getCMSLink($cmspages.id_cms, $cmspages.link_rewrite)|escape:'html':'UTF-8'}">{$cmspages.meta_title|escape:'html':'UTF-8'}</a>
					</li>
				{/foreach}
			</ul>
		{/if}
	</div>
{else}
	<div class="alert alert-danger">
		{l s='This page does not exist.'}
	</div>
{/if}
<br />
{strip}
{if isset($smarty.get.ad) && $smarty.get.ad}
{addJsDefL name=ad}{$base_dir|cat:$smarty.get.ad|escape:'html':'UTF-8'}{/addJsDefL}
{/if}
{if isset($smarty.get.adtoken) && $smarty.get.adtoken}
{addJsDefL name=adtoken}{$smarty.get.adtoken|escape:'html':'UTF-8'}{/addJsDefL}
{/if}
{/strip}

{literal}
    <style>
        .btn-shop{width: 50% !important;}
        @media (max-width:420px){
            .btn-shop{margin-top: 0% !important; height: 35px;}
            .btn-shop span, .btn-shop2 span{font-size: 12px;}
            article.sectionBanner{margin-right: 0px !important;}
        }
        @media (max-width:425px){article.sectionBanner{margin-right: 0px !important; padding-left: 0px !important;}
            .sectionFooter{text-align: center; padding-left: 0; margin-right: 0;}
        }
    </style>
    {/literal}
