{include file='header.tpl' menu='people'}

<div class="page-header">
	<h1>{$aLang.user_list}: <span class="text-muted">{$oCountry->getName()|escape:'html'}{if $aPaging} ({$aPaging.iCount}){/if}</span></h1>
</div>

{include file='user_list.tpl' aUsersList=$aUsersCountry}

{include file='footer.tpl'}
