<template>
<div>
  <div class="py-6 animate-moveintobottom bg-ucllred">
    <div class="container flex justify-between items-center mx-auto px-8 md:px-14 lg:px-24 w-full ">
      <div class="text-lg font-bold text-white"><router-link :to="{ name: 'Home'}">UCLL - Eduvirt</router-link></div>
      <div class="hidden md:flex space-x-12 items-center text-md">
        <router-link class="text-white border-b-2 border-ucllred px-2.5 hover:border-ucllblue bg-ucllred" :to="{ name: 'machines'}">My Machines</router-link>
        <router-link class="text-white border-b-2 border-ucllred px-2.5 hover:border-ucllblue bg-ucllred" :to="{ name: 'add_machine'}">Add Machines</router-link>
        <button type="button" class=" bg-ucllblue text-white hover:bg-transparent border-2 border-transparent hover:border-ucllblue font-bold rounded-sm text-sm p-2.5 text-center inline-flex items-center mr-2">
  <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
  Contact
</button>
      </div>
      <button v-on:click="toggleMenu" class="md:hidden flex flex-col space-y-1 w-8">
        <span class="bg-ucllblue w-full h-1"></span>
        <span class="bg-ucllblue w-full h-1"></span>
        <span class="bg-ucllblue w-full h-1"></span>
      </button>
    </div>

  </div>
      <div v-if="showMenu" class="menu md:hidden space-y-4 flex flex-col bg-secondary items-center p-4 bg-ucllblue">
        <router-link class="text-white border-b-2 border-ucllblue px-2.5 hover:border-ucllred bg-ucllblue" :to="{ name: 'machines'}">My Machines</router-link>
        <router-link class="text-white border-b-2 border-ucllblue px-2.5 hover:border-ucllred bg-ucllblue" :to="{ name: 'add_machine'}">Add Machine</router-link>
        <button type="button" class=" bg-ucllred text-white hover:bg-transparent border-2 border-transparent hover:border-ucllred  font-bold rounded-sm text-sm p-2.5 text-center inline-flex items-center mr-2">
  <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
  Contact
</button>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      showMenu: false,
    };
  },

  methods: {
    toggleMenu() {
      this.showMenu = !this.showMenu;
    },
  },
};
</script>