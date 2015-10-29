{include file='header.tpl'}
{include file='menu.talk.tpl'}


{if $aTalks}
	<table class="table table-talk">
		<thead>
			<tr>
				<th class="cell-recipients"><small>{$aLang.talk_inbox_target}</small></th>
				<th class="hidden-xs cell-favourite"></th>
				<th class="cell-title"><small>{$aLang.talk_inbox_title}</small></th>
				<th class="hidden-xs cell-date"><small>{$aLang.talk_inbox_date}</small></th>
			</tr>
		</thead>

		<tbody>
		{foreach from=$aTalks item=oTalk}
			{assign var="oTalkUserAuthor" value=$oTalk->getTalkUser()}
			<tr>
				<td class="small text-muted">
					{strip}
						{assign var="aTalkUserOther" value=[]}
						{foreach from=$oTalk->getTalkUsers() item=oTalkUser name=users}
							{if $oTalkUser->getUserId()!=$oUserCurrent->getId()}
								{$aTalkUserOther[]=$oTalkUser}
							{/if}
						{/foreach}
						{foreach from=$aTalkUserOther item=oTalkUser name=users}
							{assign var="oUser" value=$oTalkUser->getUser()}
							{if !$smarty.foreach.users.first}, {/if}<a href="{$oUser->getUserWebPath()}" class="user {if $oTalkUser->getUserActive()!=$TALK_USER_ACTIVE}inactive{/if}">{$oUser->getLogin()}</a>
						{/foreach}
					{/strip}
				</td>
				<td class="hidden-xs cell-favourite">
					<a href="#" onclick="return ls.favourite.toggle({$oTalk->getId()},this,'talk');" class="favourite {if $oTalk->getIsFavourite()}active{/if}"><span class="glyphicon glyphicon-star-empty"></span></a>
				</td>
				<td>
					{if $oTalkUserAuthor->getCommentCountNew() or !$oTalkUserAuthor->getDateLast()}
						<a href="{router page='talk'}read/{$oTalk->getId()}/"><strong>{$oTalk->getTitle()|escape:'html'}</strong></a>
					{else}
						<a href="{router page='talk'}read/{$oTalk->getId()}/">{$oTalk->getTitle()|escape:'html'}</a>
					{/if}
					&nbsp;
					{if $oTalk->getCountComment()}
						<span class="text-muted">({$oTalk->getCountComment()}{if $oTalkUserAuthor->getCommentCountNew()}<span class="text-info">+{$oTalkUserAuthor->getCommentCountNew()}</span>{/if})</span>
					{/if}
					<p class="small text-muted">{$oTalk->getTextLast()|strip_tags|truncate:200:'...'|escape:'html'}</p>
				</td>
				<td class="hidden-xs small text-muted cell-date">{date_format date=$oTalk->getDate()}</td>
			</tr>
		{/foreach}
		</tbody>
	</table>
{else}
	<div class="alert alert-info notice-empty">{$aLang.talk_favourite_empty}</div>
{/if}


{include file='paging.tpl' aPaging=$aPaging}
{include file='footer.tpl'}
