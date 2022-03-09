<template>
  <div id="app">
    <!-- block mobile apps -->

    <!-- <div class="sm:block hidden">
      <router-view/>
    </div>
    <div class="sm:hidden flex bg-ucllred h-screen justify-center items-center">
      <h1 class="text-white font-bold text-lg">Please use app on a bigger screen!</h1>
    </div> -->

    <!-- block mobile apps end -->

    <router-view/>
  </div>
</template>

<script>
export default {
  name: 'App',
  components: {
  }
}
</script>
<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
body {
  @apply pb-12 bg-white;
}

</style>
