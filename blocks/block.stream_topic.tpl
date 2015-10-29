<ul class="list-unstyled item-list">
	{foreach from=$oTopics item=oTopic name="cmt"}
		{assign var="oUser" value=$oTopic->getUser()}
		{assign var="oBlog" value=$oTopic->getBlog()}
		
		<li class="media text-muted js-title-topic" title="{$oTopic->getText()|strip_tags|trim|truncate:150:'...'|escape:'html'}">
			<a href="{$oUser->getUserWebPath()}" class="pull-left"><img src="{$oUser->getProfileAvatarPath(48)}" width="48" height="48" class="media-object avatar" /></a>
			
			<div class="media-body">
				<p class="small">
					<a href="{$oUser->getUserWebPath()}" class="author">{$oUser->getLogin()}</a>
					<time datetime="{date_format date=$oTopic->getDate() format='c'}">
						· {date_format date=$oTopic->getDateAdd() hours_back="12" minutes_back="60" now="60" day="day H:i" format="j F Y, H:i"}
					</time>
				</p>
				<a href="{$oBlog->getUrlFull()}" class="blog-name">{$oBlog->getTitle()|escape:'html'}</a> &rarr;
				<a href="{$oTopic->getUrl()}" class="stream-topic">{$oTopic->getTitle()|escape:'html'}</a>
				<small class="text-danger">{$oTopic->getCountComment()}</small>
			</div>
		</li>
	{/foreach}
</ul>

<footer class="small text-muted">
	<a href="{router page='index'}newall/">{$aLang.block_stream_topics_all}</a> · <a href="{router page='rss'}new/">RSS</a>
</footer>
