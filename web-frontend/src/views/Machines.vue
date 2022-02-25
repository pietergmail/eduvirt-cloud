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
        <div class="grid grid-cols-4 bg-gray-200 sm:px-8 py-8 text-center" v-for="machine in machines" :key="machine.id">
          <p>{{machine.machineName}}</p>
          <p>{{machine.templateName}}</p>
          <p>{{machine.courseName}}</p>
          <a class="text-blue-600" href="#">Open Console</a>
        </div>  
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import Navigation from "../components/Navigation.vue";

export default {
  components: {
    Navigation,
  },
      data() {
        return {
          machines: [],
        };
    },

      methods: {
        // async getVMS() {
        //   console.log('Getting VM list...');
        //   await axios.get('http://192.168.139.128:4646/v1/jobs')
        //   .then(response => {
        //     this.users = response.data;
        //   })
        //   .catch(error => {
        //     console.log(error);
        //   });
        // },

        async getUserWithUsername() {
            console.log('Getting User...');
            const response = await axios.post('http://200.200.200.102:3000/getUser', {"username": sessionStorage.getItem('username')});
            this.machines = response.data;
        },


    },

    created() {
      this.getUserWithUsername();
    },
};
</script>
