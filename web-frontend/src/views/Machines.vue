<template>
  <div>
    <Navigation />
    <div class="flex flex-col mt-20 mx-auto sm:px-8 md:px-14 lg:px-24 xl:w-7/12 w-full animate-moveintotop">
      <h2 class="font-bold text-center text-4xl mb-8 text-ucllblue">Your Machines</h2>
        <div class="grid grid-cols-7 bg-ucllred p-4 text-white text-center">
          <h3>Machine Name</h3>
          <h3>Loader Name</h3>
          <h3>Course</h3>
          <h3>Cores</h3>
          <h3>RAM</h3>
          <h3>IP</h3>
          <h3>Status</h3>
        </div>
        <div class="grid grid-cols-7 bg-gray-200 p-4 text-center" v-for="machine in machines" :key="machine.id">
          <p>{{machine.mName}}</p>
          <p>{{machine.mLoader}}</p>
          <p>{{machine.mCourse}}</p>
          <p>{{machine.mCores}}</p>
          <p>{{machine.mRAM}}</p>
          <p>{{machine.mIP}}</p>
          <p>{{machine.mStatus}}</p>
        </div> 
        <div class="bg-yellow-200 p-4 text-center">{{machines}}</div>
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

        // async getUserWithUsername() {
        //     console.log('Getting User...');
        //     const response = await axios.post('http://200.200.200.102:3000/getUser', {"username": sessionStorage.getItem('username')});
        //     this.machines = response.data;
        // },


        async getVMS() {
          console.log('Getting VM list...');
          const response = await axios.post('http://200.200.200.102:3000/machines', {"username": sessionStorage.getItem('username')})
          console.log(response.data);
          this.machines = response.data;
        },
    },

    mounted() {
      // this.getUserWithUsername();
      this.getVMS();
    },
};
</script>
