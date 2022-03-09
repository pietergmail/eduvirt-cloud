<template>
  <div>
    <Navigation />

    <div class="container mx-auto w-full h-96 mt-20 animate-moveintotop">
      <h2 class="font-bold text-center text-4xl mb-8 text-ucllblue">Your Machines</h2>
      <h3 class="font-bold text-center text-xl mb-8 text-ucllblue">Use VNC to connect to the VM</h3>
      <div
        class="xl:overflow-hidden overflow-x-auto flex flex-col justify-between"
      >
        <div class="overflow-x-auto sm:-mx-6 lg:-mx-8">
          <div class="py-2 inline-block min-w-full sm:px-6 lg:px-8">
            <div class="overflow-hidden">
              <table class="min-w-full">
                <thead class="border-b bg-ucllred text-white">
                  <tr class="text-lg text-bold">
                    <th scope="col" class="px-6 py-4 text-center">Machine</th>
                    <th scope="col" class="px-6 py-4 text-center">Loader</th>
                    <th scope="col" class="px-6 py-4 text-center">Course</th>
                    <th scope="col" class="px-6 py-4 text-center">Cores</th>
                    <th scope="col" class="px-6 py-4 text-center">RAM</th>
                    <th scope="col" class="px-6 py-4 text-center">IP</th>
                    <th scope="col" class="px-6 py-4 text-center">Status</th>
                    <th scope="col" class="px-6 py-4 text-center">Controls</th>
                  </tr>
                </thead>
                <tbody class="bg-gray-200">
                  <tr
                    class="text-md text-center"
                    v-for="machine in machines"
                    :key="machine.id"
                  >
                    <td class="px-6 py-4 whitespace-nowrap">
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
                    <td class="px-6 py-4 whitespace-nowrap">
                      {{ machine.mIP }}
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                      {{ machine.mStatus }}
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                      <button
                        v-if="machine.mStatus == 'Stopped'"
                        class="bg-green-300 px-12 py-2.5"
                        type="submit"
                        v-on:click="startVM(machine.mName)"
                      >
                        On
                      </button>
                      <button
                        v-if="machine.mStatus == 'Running'"
                        class="bg-red-300 px-12 py-2.5"
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
    this.getVMS();
  },
};
</script>
