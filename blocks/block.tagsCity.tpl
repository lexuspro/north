{if $aCityList && count($aCityList)>0}
	<section class="panel panel-default block">
		<div class="panel-body">
		
			<header class="block-header">
				<h3>{$aLang.block_city_tags}</h3>
			</header>
		
			<div class="block-content">
				<ul class="list-unstyled list-inline tag-cloud word-wrap">
					{foreach from=$aCityList item=oCity}
						<li><a class="tag-size-{$oCity->getSize()}" href="{router page='people'}city/{$oCity->getId()}/">{$oCity->getName()|escape:'html'}</a></li>
					{/foreach}					
				</ul>	
			</div>

		</div>
	</section>
{/if}
