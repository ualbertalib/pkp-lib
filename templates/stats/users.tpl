{**
 * lib/pkp/templates/stats/users.tpl
 *
 * Copyright (c) 2013-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * The editorial statistics page.
 *
 *}
{extends file="layouts/backend.tpl"}

{block name="page"}
	<div class="pkpStats">
		<div class="pkpStats__panel">
			<pkp-header>
				<h1 id="usersTableLabel" class="pkpHeader__title">{translate key="manager.statistics.statistics.registeredUsers"}</h1>
			</pkp-header>
			<table class="pkpTable" labelled-by="usersTableLabel">
				<thead>
					<tr>
						<th>{translate key="common.name"}</th>
						<th>{translate key="stats.total"}</th>
					</tr>
				</thead>
				<tbody>
					{foreach from=$userStats item=$row}
						<tr>
							<td>{$row.name}</td>
							<td>{$row.value}</td>
						</tr>
					{/foreach}
				</tbody>
			</table>
		</div>
	</div>
{/block}
