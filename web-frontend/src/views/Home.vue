<template>
  <div class="">
    <Navigation />
    <section class="flex lg:flex-row flex-col items-center justify-center gap-4 mt-44 mx-auto px-8 md:px-14 lg:px-24 animate-moveintotop">
      <router-link :to="{ name: 'machines'}"
         class="flex flex-col gap-4 xl:h-96 h-64 xl:w-4/12 lg:w-3/4 md:w-6/12 w-full bg-gray-200 rounded-md justify-center items-center"
      >
        <img class="h-24 w-24 " src="../assets/see.png" alt="">
        <h2 class="font-bold">See Your Machines</h2>
      </router-link>
      <router-link :to="{ name: 'add_machine'}"
        class="flex flex-col gap-4  xl:h-96 h-64 xl:w-4/12 lg:w-3/4 md:w-6/12 w-full bg-gray-200 rounded-md justify-center items-center"
      >
        <img class="h-24 w-24 " src="../assets/add.png" alt="">
        <h2 class="font-bold">Add Machines From Templates</h2>
      </router-link>
    </section>
  </div>
</template>

<script>
import Navigation from "../components/Navigation.vue";

export default {
  name: "Home",
  components: {
    Navigation,
  },
};
</script>
