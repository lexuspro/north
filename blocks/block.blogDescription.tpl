{assign var="oUserOwner" value=$oBlog->getOwner()}
{assign var="oVote" value=$oBlog->getVote()}

<section class="panel panel-default block block-type-blog block-type-blogdescription">
	<div class="panel-body">

		<header class="block-header">
			<h3>{$oBlog->getTitle()|escape:'html'}{if $oBlog->getType()=='close'} <span title="{$aLang.blog_closed}" class="glyphicon glyphicon-lock"></span>{/if}</h3>
		</header>

		<div class="block-content">
			<img src="{$oBlog->getAvatarPath(400)}" class="blog-avatar" />

			<ul class="list-unstyled list-inline small blog-info">
				<li class="blog-info-users">
					<a href="{$oBlog->getUrlFull()}users/">
						<span id="blog_user_count_{$oBlog->getId()}">{$iCountBlogUsers}</span> {$iCountBlogUsers|declension:$aLang.reader_declension:'russian'}
					</a>
				</li>
				<li class="text-muted blog-info-topics">
					{$oBlog->getCountTopic()} {$oBlog->getCountTopic()|declension:$aLang.topic_declension:'russian'}
				</li>
				<li class="blog-info-rss">
					<a href="{router page='rss'}blog/{$oBlog->getUrl()}/" class="small">RSS</a>
				</li>
			</ul>

			{if $oUserCurrent and ($oUserCurrent->getId()==$oBlog->getOwnerId() or $oUserCurrent->isAdministrator() or $oBlog->getUserIsAdministrator() )}
				<ul class="list-unstyled list-inline blog-edit">
					<li><a href="{router page='blog'}edit/{$oBlog->getId()}/" title="{$aLang.blog_edit}" class="small actions-edit">{$aLang.blog_edit}</a></li>
					<li>
						{if $oUserCurrent->isAdministrator()}
							<a href="#" title="{$aLang.blog_delete}" id="blog_delete_show" class="small actions-delete">{$aLang.blog_delete}</a>
						{else}
							<a href="{router page='blog'}delete/{$oBlog->getId()}/?security_ls_key={$LIVESTREET_SECURITY_KEY}" title="{$aLang.blog_delete}" onclick="return confirm('{$aLang.blog_admin_delete_confirm}');" class="small actions-delete">{$aLang.blog_delete}</a>
						{/if}
					</li>
				</ul>
			{/if}

			<p class="blog-description">
				{$oBlog->getDescription()}
			</p>

			<ul class="list-unstyled list-inline text-muted small blog-footer-info">
				<li>{$aLang.infobox_blog_create}: {date_format date=$oBlog->getDateAdd() format="j F Y"}</li>
				<li><a class="link-dotted collapsed" aria-controls="blog-admins" aria-expanded="false" href="#blog-admins" data-toggle="collapse" role="button">{$aLang.blog_admins}</a></li>
			</ul>

			<div id="blog-admins" class="collapse">
				<div class="blog-admins">
					{hook run='blog_info_begin' oBlog=$oBlog}

					<strong>{$aLang.blog_user_administrators} ({$iCountBlogAdministrators})</strong><br />
					<span class="small user-avatar">
						<a href="{$oUserOwner->getUserWebPath()}"><img src="{$oUserOwner->getProfileAvatarPath(24)}" alt="avatar" class="img-circle avatar" /></a>
						<a href="{$oUserOwner->getUserWebPath()}">{$oUserOwner->getLogin()}</a>
					</span>
					{if $aBlogAdministrators}
						{foreach from=$aBlogAdministrators item=oBlogUser}
							{assign var="oUser" value=$oBlogUser->getUser()}
							<span class="small user-avatar">
								<a href="{$oUser->getUserWebPath()}"><img src="{$oUser->getProfileAvatarPath(24)}" alt="avatar" class="img-circle avatar" /></a>
								<a href="{$oUser->getUserWebPath()}">{$oUser->getLogin()}</a>
							</span>
						{/foreach}
					{/if}<br /><br />

					<strong>{$aLang.blog_user_moderators} ({$iCountBlogModerators})</strong><br />
					{if $aBlogModerators}
						{foreach from=$aBlogModerators item=oBlogUser}
							{assign var="oUser" value=$oBlogUser->getUser()}
							<span class="user-avatar">
								<a href="{$oUser->getUserWebPath()}"><img src="{$oUser->getProfileAvatarPath(24)}" alt="avatar" class="img-circle avatar" /></a>
								<a href="{$oUser->getUserWebPath()}">{$oUser->getLogin()}</a>
							</span>
						{/foreach}
					{else}
						<span class="text-muted small">{$aLang.blog_user_moderators_empty}</span>
					{/if}

					{hook run='blog_info_end' oBlog=$oBlog}
				</div>
			</div>

			<footer class="blog-footer">
				<div id="vote_area_blog_{$oBlog->getId()}" class="small vote {if $oBlog->getRating() > 0}vote-count-positive{elseif $oBlog->getRating() < 0}vote-count-negative{/if} {if $oVote} voted {if $oVote->getDirection()>0}voted-up{elseif $oVote->getDirection()<0}voted-down{/if}{/if}">
					<a href="#" class="vote-down" onclick="return ls.vote.vote({$oBlog->getId()},this,-1,'blog');"><span class="glyphicon glyphicon-thumbs-down"></span></a>
					<div id="vote_total_blog_{$oBlog->getId()}" class="vote-count count" title="{$aLang.blog_vote_count}: {$oBlog->getCountVote()}">{if $oBlog->getRating() > 0}+{/if}{$oBlog->getRating()}</div>
					<a href="#" class="vote-up" onclick="return ls.vote.vote({$oBlog->getId()},this,1,'blog');"><span class="glyphicon glyphicon-thumbs-up"></span></a>
				</div>

				{if $oUserCurrent and $oUserCurrent->getId()!=$oBlog->getOwnerId()}
					<button type="submit" class="btn btn-default btn-sm{if $oBlog->getUserIsJoin()} active{/if}" id="button-blog-join-first-{$oBlog->getId()}" data-button-additional="button-blog-join-second-{$oBlog->getId()}" data-only-text="1" onclick="ls.blog.toggleJoin(this, {$oBlog->getId()}); return false;">{if $oBlog->getUserIsJoin()}{$aLang.blog_leave}{else}{$aLang.blog_join}{/if}</button>
				{/if}
			</footer>
		</div>
	</div>
</section>
