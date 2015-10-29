<nav id="nav">
	<div class="container">
		<div class="row">
			<div class="col-sm-8">
				{if $menu}
					{if in_array($menu,$aMenuContainers)}{$aMenuFetch.$menu}{else}{include file="menu.$menu.tpl"}{/if}
				{/if}
			</div>

			<div class="col-sm-4 hidden-xs">
				{if $oUserCurrent}
					<a href="{router page='topic'}add/" class="btn btn-success btn-write pull-right" id="modal_write_show">{$aLang.block_create}</a>
				{/if}

				<form action="{router page='search'}topics/" class="navbar-search pull-right visible-lg">
					<input type="text" placeholder="{$aLang.search}" maxlength="255" name="q" class="form-control">
				</form>
			</div>
		</div>
	</div>
</nav>
