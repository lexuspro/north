<ul class="list-unstyled item-list">
	{foreach from=$aComments item=oComment name="cmt"}
		{assign var="oUser" value=$oComment->getUser()}
		{assign var="oTopic" value=$oComment->getTarget()}
		{assign var="oBlog" value=$oTopic->getBlog()}
		
		<li class="media js-title-comment" title="{$oComment->getText()|strip_tags|trim|truncate:100:'...'|escape:'html'}">
			<a href="{$oUser->getUserWebPath()}" class="hidden-xs pull-left"><img src="{$oUser->getProfileAvatarPath(48)}" width="48" height="48" class="media-object avatar" /></a>
			
			<div class="media-body">
				<p class="small">
					<a href="{$oUser->getUserWebPath()}" class="author">{$oUser->getLogin()}</a>
					<time datetime="{date_format date=$oComment->getDate() format='c'}" class="text-muted">
						· {date_format date=$oComment->getDate() hours_back="12" minutes_back="60" now="60" day="day H:i" format="j F Y, H:i"}
					</time>
				</p>
				<a href="{if $oConfig->GetValue('module.comment.nested_per_page')}{router page='comments'}{else}{$oTopic->getUrl()}#comment{/if}{$oComment->getId()}" class="stream-topic">{$oTopic->getTitle()|escape:'html'}</a>
				<small class="text-danger">{$oTopic->getCountComment()}</small>
			</div>
		</li>
	{/foreach}
</ul>

<footer class="small text-muted">
	<a href="{router page='comments'}">{$aLang.block_stream_comments_all}</a> · <a href="{router page='rss'}allcomments/">RSS</a>
</footer>
