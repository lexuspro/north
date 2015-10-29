{include file='header.tpl' menu='people'}

<div class="page-header">
	<h1>{$aLang.people}</h1>
</div>

<table class="table table-users">
	<thead>
		<tr>
			<th class="cell-name"><small>{$aLang.user}</small></th>
			<th class="hidden-xs cell-date"><small>{$aLang.user_date_registration}</small></th>
			<th class="hidden-xs cell-skill"><small>{$aLang.user_skill}</small></th>
			<th class="hidden-xs cell-rating"><small>{$aLang.user_rating}</small></th>
		</tr>
	</thead>

	<tbody>
		{if $aUsersRegister}
			{foreach from=$aUsersRegister item=oUserList}
				{assign var="oSession" value=$oUserList->getSession()}
				{assign var="oUserNote" value=$oUserList->getUserNote()}
				<tr>
					<td class="cell-name">
						<a href="{$oUserList->getUserWebPath()}"><img src="{$oUserList->getProfileAvatarPath(48)}" alt="avatar" class="avatar" /></a>
						<div class="name {if !$oUserList->getProfileName()}no-realname{/if}">
							<p class="username">
								<a href="{$oUserList->getUserWebPath()}">{$oUserList->getLogin()}</a>
								{if $oUserNote}
									<span class="glyphicon glyphicon-comment text-muted js-infobox" title="{$oUserNote->getText()|escape:'html'}"></span>
								{/if}
							</p>
							{if $oUserList->getProfileName()}<p class="text-muted realname"><small>{$oUserList->getProfileName()}</small></p>{/if}
						</div>
					</td>
					<td class="hidden-xs text-muted cell-date"><small>{date_format date=$oUserList->getDateRegister() format="d.m.y, H:i"}</small></td>
					<td class="hidden-xs text-info cell-skill"><small>{$oUserList->getSkill()}</small></td>
					<td class="hidden-xs cell-rating{if $oUserList->getRating() < 0} text-danger negative{else} text-success{/if}"><small>{$oUserList->getRating()}</small></td>
				</tr>
			{/foreach}
		{else}
			<tr>
				<td colspan="5">
					{if $sUserListEmpty}
						{$sUserListEmpty}
					{else}
						{$aLang.user_empty}
					{/if}
				</td>
			</tr>
		{/if}
	</tbody>
</table>


{include file='paging.tpl' aPaging=$aPaging}

{include file='footer.tpl'}
