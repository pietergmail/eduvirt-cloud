<template>
  <div>
    <Navigation />
    <div class="flex flex-col mt-20 mx-auto sm:px-8 md:px-14 lg:px-24 xl:w-7/12 w-full animate-moveintotop">
      <h2 class="font-bold text-center text-4xl mb-8 text-ucllblue">Your Machines</h2>
        <div class="grid grid-cols-4 bg-ucllred p-4 text-white text-center">
          <h3>Machine Name</h3>
          <h3>Template Name</h3>
          <h3>Course</h3>
          <h3>Console</h3>
        </div>
        <div class="grid grid-cols-4 bg-gray-200 sm:px-8 py-8 text-center" v-for="user in users" :key="user.id">
          <p>{{user.servers.name}}</p>
          <p>{{user.servers.template}}</p>
          <p>{{user.servers.course}}</p>
          <a class="text-blue-600" :href="user.servers.console">Open Console</a>
        </div>  
    </div>
  </div>
</template>

<script lang="ts">
import Navigation from "../components/Navigation.vue";

export default {
  components: {
    Navigation,
  },
      data() {
        return {
            users: [{"username": "admin", "servers": {"id": "1", "name": "Windows 10 voor Besturing", "course": "Besturing", "template": "Windows 10", "console": "https://console.cloud.ucll.be/"}},
            {"username": "user", "servers": {"id": "1", "name": "Ubuntu 11 voor Besturing", "course": "Besturing", "template": "Ubuntu 11", "console": "https://console.cloud.ucll.be/"}}],
            selectedTemplate: '',
            selectedCourse: '',
        };
    },
};
</script>
