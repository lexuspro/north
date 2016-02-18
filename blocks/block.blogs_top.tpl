<ul class="list-unstyled item-list">
	{foreach from=$aBlogs item=oBlog}
		<li>
			<a href="{$oBlog->getUrlFull()}" class="blog-top" >{$oBlog->getTitle()|escape:'html'}</a>
			<p class="small text-muted">{$aLang.blog_rating}: {$oBlog->getRating()}</p>
		</li>
	{/foreach}
</ul>
