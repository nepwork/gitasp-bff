<script lang="ts" >
	import Calendar from '@event-calendar/core';
	import TimeGrid from '@event-calendar/time-grid';
	import DayGrid from '@event-calendar/day-grid';

	let ec;
	let plugins = [TimeGrid, DayGrid];
	let options = {
			view: 'timeGridDay',
			slotDuration: '01:00'
	};

	function updateOptions() {
			options.slotDuration = '00:00';
	}
</script>

<button on:click={updateOptions}>Change slot duration</button>
<Calendar bind:this={ec} {plugins} {options} />
