<script lang="ts">
	import dayjs from 'dayjs';
	import { GradientButton } from 'flowbite-svelte';
	import { InlineCalendar } from 'svelte-calendar';
	import { writable } from 'svelte/store';
	import { darkTheme, lightTheme } from './calendar.theme';
	import DayAppointmentTable from './DayAppointmentTable.svelte';


	let store: any;
	let theme = writable(lightTheme);

	document.addEventListener('dark-mode', (e) => {
		theme.set($theme === lightTheme ? darkTheme : lightTheme);
	})
</script>

<div class="flex gap-8">
	<InlineCalendar bind:store theme={$theme} format={'DD/MM/YYYY'} selected={new Date()}/>

	<div class="shadow-xl w-[40vw] mt-3" >
		<p class="mx-auto py-4 pl-4 text-teal-700">Appointments for {dayjs($store?.selected).format('DD/MM/YYYY')}</p>
		<div class="flex gap-2 ml-2">
			<div class="flex mx-4">
				<div class="relative z-0 w-full mb-5 mr-2 group">
					<input type="patient" name="floating_patient" id="floating_patient" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
					<label for="floating_patient" class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Patient's Name</label>
			</div>
			<div class="mb-5">
				<label for="floating_time" class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Time </label>
				<input type="time" id="floating_time" name="floating_time" min="09:00" max="18:00" list="time-slots" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required >
				<datalist id="time-slots">
					<option value="09:00">
					<option value="10:00">
					<option value="11:00">
					<option value="12:00">
					<option value="13:00">
					<option value="14:00">
					<option value="15:00">
					<option value="16:00">
					<option value="17:00">
					<option value="18:00">
				</datalist>
			</div>
			<div class="relative z-0 w-full mb-5 ml-2 group">
					<input type="text" name="doctor" id="floating_doctor" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
					<label for="repeat_doctor" class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Doctor</label>
			</div>
		</div>

			<div class="mb-6 px-1 place-self-end">
				<GradientButton class="bg-teal-400 font-semibold" shadow>Quick Add</GradientButton>
			</div>
		</div>

		<DayAppointmentTable/>
	</div>
</div>	

<style>
	input[type="time"] {
  	accent-color: teal; /* Set the accent color to teal */
	}
</style>
