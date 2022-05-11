<script>
	import { onMount } from 'svelte';
	import CampaignFactory from '../CampaignFactory.js';
	import Card from './Components/Card.svelte';
	export let name;

	let campaignList;
	onMount(async()=>{
		campaignList =await CampaignFactory.methods.getDeployedCampaigns().call();
		console.log(campaignList);
	})
</script>

<main>
	{#each [campaignList] as campaign}
		<Card address={campaign} description="View Campaign" />
	{/each}
</main>

<style>
	main {
		margin: 0 auto;
	}

	h1 {
		color: #ff3e00;
		text-transform: uppercase;
		font-size: 4em;
		font-weight: 100;
	}

	@media (min-width: 640px) {
		main {
			max-width: none;
		}
	}
</style>