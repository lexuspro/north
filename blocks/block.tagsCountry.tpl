{if $aCountryList && count($aCountryList)>0}
	<section class="panel panel-default block">
		<div class="panel-body">
		
			<header class="block-header">
				<h3>{$aLang.block_country_tags}</h3>
			</header>
		
			<div class="block-content">
				<ul class="list-unstyled list-inline tag-cloud word-wrap">
					{foreach from=$aCountryList item=oCountry}
						<li><a class="tag-size-{$oCountry->getSize()}" href="{router page='people'}country/{$oCountry->getId()}/">{$oCountry->getName()|escape:'html'}</a></li>
					{/foreach}					
				</ul>	
			</div>	
		
		</div>
	</section>
{/if}
