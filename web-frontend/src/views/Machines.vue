<template>
  <div>
    <Navigation />
    <!-- <div class="mt-20 mx-auto w-full animate-moveintotop">
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
        
        <div class="font-bold text-center text-xl mb-8 text-red-500 mt-20" v-if="machines.length == 0 ">
          You have no machines <br>
          <a class="text-blue-800" href="/add_machine">create one</a>
        </div>

        <div class="bg-yellow-200 p-4 text-center">{{machines}}</div>


    </div> -->

    <!-- <div class="container mx-auto mt-20">
      <h2 class="font-bold text-center text-4xl mb-8 text-ucllblue">Your Machines</h2>
      <div class="bg-gray-500 flex md:flex-row flex-col gap-4 flex-wrap text-white text-xl justify-between items-center text-center p-4">
        <p>user1_Ubuntu</p> 
        <p>default</p>
        <p>uefi</p>
        <p>2</p>
        <p>8G</p>
        <p>-</p>
        <p>No</p>
        <p>Stopped</p>
      </div>
    </div> -->

    <div class="container mx-auto w-full h-96 mt-20">
      <div
        class="xl:overflow-hidden overflow-x-auto flex flex-col justify-between"
      >
        <div class="overflow-x-auto sm:-mx-6 lg:-mx-8">
          <div class="py-2 inline-block min-w-full sm:px-6 lg:px-8">
            <div class="overflow-hidden">
              <table class="min-w-full">
                <thead class="border-b bg-ucllred text-white">
                  <tr class="text-lg text-bold">
                    <th scope="col" class="px-6 py-4 text-left">Machine</th>
                    <th scope="col" class="px-6 py-4 text-left">Loader</th>
                    <th scope="col" class="px-6 py-4 text-left">Course</th>
                    <th scope="col" class="px-6 py-4 text-left">Cores</th>
                    <th scope="col" class="px-6 py-4 text-left">RAM</th>
                    <th scope="col" class="px-6 py-4 text-left">IP</th>
                    <th scope="col" class="px-6 py-4 text-left">Status</th>
                    <th scope="col" class="px-6 py-4 text-left">Controls</th>
                  </tr>
                </thead>
                <tbody class="bg-gray-200">
                  <tr
                    class="text-md"
                    v-for="machine in machines"
                    :key="machine.id"
                  >
                    <td class="px-6 py-4 whitespace-nowrap text-bold">
                      {{ machine.mName }}
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                      {{ machine.mLoader }}
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                      {{ machine.mCourse }}
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                      {{ machine.mCores }}
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                      {{ machine.mRAM }}
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-bold">
                      {{ machine.mIP }}
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                      {{ machine.mStatus }}
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                      <button
                        v-if="machine.mStatus == 'Stopped'"
                        class="bg-green-300 w-full px-4 py-2.5 h-full"
                        type="submit"
                        v-on:click="startVM(machine.mName)"
                      >
                        On
                      </button>
                      <button
                        v-if="machine.mStatus == 'Running'"
                        class="bg-red-300 w-full px-4 py-2.5 h-full"
                        type="submit"
                        v-on:click="stopVM(machine.mName)"
                      >
                        Off
                      </button>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import Navigation from "../components/Navigation.vue";

export default {
  components: {
    Navigation,
  },
  data() {
    return {
      machines: [],
      arr: ["102", "124"],
      mName: "",
    };
  },

  methods: {
    async getVMS() {
      console.log("Getting VM list...");
      // const testresponse = await axios.post('http://localhost:3000/machines', {"username": sessionStorage.getItem('username')})
      for (let index = 0; index < this.arr.length; index++) {
        const response = await axios.post(
          "http://200.200.200." + this.arr[index] + ":3000/machines",
          { username: sessionStorage.getItem("username") }
        );
        this.machines = this.machines.concat(response.data);
        console.log(this.machines);
      }
    },

    startVM(mName) {
      console.log("Starting VM...");
      var machinename = mName;
      console.log(machinename);
      if (machinename.includes("Server1")) {
        axios.post("http://200.200.200." + this.arr[0] + ":3000/startVM", {
          mName: machinename,
        });
        console.log(machinename + " on Server1 starting...");
        setTimeout(function () {
          window.location.reload();
        }, 1500);
      } else if (machinename.includes("Server2")) {
        axios.post("http://200.200.200." + this.arr[1] + ":3000/startVM", {
          mName: machinename,
        });
        console.log(machinename + " on Server2 starting...");
        setTimeout(function () {
          window.location.reload();
        }, 1500);
      } else {
        console.log("Error");
      }
    },

    stopVM(mName) {
      console.log("Stopping VM...");
      var machinename = mName;
      console.log(machinename);
      if (machinename.includes("Server1")) {
        axios.post("http://200.200.200." + this.arr[0] + ":3000/stopVM", {
          mName: machinename,
        });
        console.log(machinename + " on Server1 stopping...");
        setTimeout(function () {
          window.location.reload();
        }, 1500);
      } else if (machinename.includes("Server2")) {
        axios.post("http://200.200.200." + this.arr[1] + ":3000/stopVM", {
          mName: machinename,
        });
        console.log(machinename + " on Server2 stopping...");
        setTimeout(function () {
          window.location.reload();
        }, 1500);
      } else {
        console.log("Error");
      }
    },
  },

  mounted() {
    // this.getUserWithUsername();
    this.getVMS();
  },
};
</script>
