<template>
    <div class="flex bg-ucllred w-screen h-screen justify-center items-center">
        <div class="flex flex-col mx-auto px-8 md:px-14 lg:px-24 container  items-center">
            <h1 class="font-bold text-3xl text-white">UCLL - Eduvirt</h1>
            <div class="flex flex-col mt-36 gap-4" >
                <label class="text-white text-lg" for="username">Username</label>
                <input class="py-2 rounded-sm" type="text" name="username" id="username" v-model="username">
                <label class="text-white text-lg" for="password">Password</label>
                <input class="py-2 rounded-sm" type="text" name="password" id="password" v-model="password">
                <input class="py-2 rounded-sm" type="submit" value="Login" v-on:click="login">
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            username: '',
            password: '',
        };
    },
    methods: {
        login() {
            if(this.username.length > 0 && this.password.length > 0) {
                this.$router.push("/home");
                
            }
            else {
                alert("Please enter a username and a password");
            }
        }
    }
}
</script>