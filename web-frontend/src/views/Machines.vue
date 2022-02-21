<template>
  <div>
    <Navigation />
    <div class="flex flex-col mt-20 mx-auto px-8 md:px-14 lg:px-24 xl:w-7/12 w-full">
    <h2 class="font-bold text-center text-4xl mb-8 text-ucllblue">Your Machines</h2>
      <div class="overflow-x-auto sm:-mx-6 lg:-mx-8">
        <div class="inline-block py-2 min-w-full sm:px-6 lg:px-8">
          <div class="overflow-hidden shadow-md sm:rounded-lg">
            <table class="min-w-full">
              <thead class="bg-ucllblue">
                <tr>
                  <th
                    scope="col"
                    class="
                      py-3
                      px-6
                      text-xs
                      font-medium
                      tracking-wider
                      text-left text-white
                      uppercase
                    "
                  >
                    Template
                  </th>
                  <th
                    scope="col"
                    class="
                      py-3
                      px-6
                      text-xs
                      font-medium
                      tracking-wider
                      text-left text-white
                      uppercase
                      
                    "
                  >
                    Course
                  </th>
                  <th scope="col" class="relative py-3 px-6">
                    <span class="sr-only">Edit</span>
                  </th>
                </tr>
              </thead>
              <tbody v-for="n in 10" v-bind:key="n">
                <tr
                  class="
                    bg-white
                    border-b
                    border-ucllblue
                     
                  "
                >
                  <td
                    class="
                      py-4
                      px-6
                      text-sm
                      font-medium
                      text-black
                      whitespace-nowrap
                      
                    "
                  >
                    Ubuntu Client
                  </td>
                  <td
                    class="
                      py-4
                      px-6
                      text-sm text-gray-500
                      whitespace-nowrap
                      
                    "
                  >
                    Besturingssytemen 2
                  </td>

                  <td
                    class="
                      py-4
                      px-6
                      text-sm
                      font-bold
                      text-right
                      whitespace-nowrap
                    "
                  >
                    <a
                      href="#"
                      class="text-blue-600  hover:underline"
                      >Open Console</a
                    >
                  </td>
                </tr>

              </tbody>
            </table>
          </div>
        </div>
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
};
</script>
