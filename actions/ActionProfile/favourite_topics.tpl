{assign var="bTopicListPage" value=true}


{include file='header.tpl' jumbotron='profile'}

<div class="action-header">
	{include file='menu.profile_favourite.tpl'}
</div>

{if $oUserCurrent and $oUserCurrent->getId()==$oUserProfile->getId()}
	{$aBlockParams.user=$oUserProfile}
	{insert name="block" block=tagsFavouriteTopic params=$aBlock.params}
{/if}

{include file='topic_list.tpl'}


{include file='footer.tpl'}
