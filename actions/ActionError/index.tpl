{assign var="noSidebar" value=true}
{include file='header_light.tpl' noShowSystemMessage=true}


{if $aMsgError[0].title}
	<div class="text-center page-header">
		<h3>{$aLang.error}: <span>{$aMsgError[0].title}</span></h3>
	</div>
{/if}

<p>{$aMsgError[0].msg}</p>
<p><a href="javascript:history.go(-1);">{$aLang.site_history_back}</a>, <a href="{cfg name='path.root.web'}">{$aLang.site_go_main}</a></p>


{include file='footer_light.tpl'}
