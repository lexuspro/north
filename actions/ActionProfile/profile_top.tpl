{assign var="oVote" value=$oUserProfile->getVote()}

<div class="profile">
	{hook run='profile_top_begin' oUserProfile=$oUserProfile}

	<div class="media">
		<div class="media-left media-middle">
			<a href="{$oUserProfile->getUserWebPath()}"><img src="{$oUserProfile->getProfileAvatarPath(100)}" alt="{$oUserProfile->getLogin()}" class="img-circle avatar" itemprop="photo" /></a>
		</div>

		<div class="media-body media-middle">
			<h1 class="user-login word-wrap {if !$oUserProfile->getProfileName()}no-user-name{/if}" itemprop="nickname">{$oUserProfile->getLogin()}</h1>
			{if $oUserProfile->getProfileName()}
				<p class="user-name" itemprop="name">{$oUserProfile->getProfileName()|escape:'html'}</p>
			{/if}
		</div>

		<div class="small media-right media-middle strength" title="{$aLang.user_skill}">
			<div class="strength-inner">
				<span class="glyphicon glyphicon-flash"></span>
				<div class="count" id="user_skill_{$oUserProfile->getId()}">{$oUserProfile->getSkill()}</div>
			</div>
		</div>

		<div id="vote_area_user_{$oUserProfile->getId()}" title="{$aLang.user_rating}" class="small media-right media-middle vote {if $oUserProfile->getRating()>=0}vote-count-positive{else}vote-count-negative{/if} {if $oVote} voted {if $oVote->getDirection()>0}voted-up{elseif $oVote->getDirection()<0}voted-down{/if}{/if}">
			<a href="#" class="vote-up" onclick="return ls.vote.vote({$oUserProfile->getId()},this,1,'user');"><span class="glyphicon glyphicon-chevron-up"></span></a>
			<div id="vote_total_user_{$oUserProfile->getId()}" class="vote-count count" title="{$aLang.user_vote_count}: {$oUserProfile->getCountVote()}">{if $oUserProfile->getRating() > 0}+{/if}{$oUserProfile->getRating()}</div>
			<a href="#" class="vote-down" onclick="return ls.vote.vote({$oUserProfile->getId()},this,-1,'user');"><span class="glyphicon glyphicon-chevron-down"></span></a>
		</div>
	</div>

	{hook run='profile_top_end' oUserProfile=$oUserProfile}
</div>
