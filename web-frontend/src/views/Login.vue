<template>
    <div class="flex bg-ucllred w-screen h-screen justify-center items-center">
        <div class="flex flex-col mx-auto px-8 md:px-14 lg:px-24 container  items-center">
            <h1 class="font-bold text-3xl text-white">UCLL - Eduvirt</h1>
            <div class="flex flex-col mt-36 gap-4" >
                <label class="text-white text-lg" for="username">Username</label>
                <input class="py-2 rounded-sm" type="text" name="username" id="username" v-model="username">
                <label class="text-white text-lg" for="password">Password</label>
                <input class="py-2 rounded-sm" type="password" name="password" id="password" v-model="password">
                <input class="py-2 rounded-sm" type="submit" value="Login" v-on:click="loginUser">
            </div>
        </div>
    </div>
</template>



<script>
import axios from 'axios';
export default {
    data() {
        return {
            username: '',
            password: '',
        };
    },
    methods: {
        async loginUser() {
            console.log('Loggin in...');
            if(this.username == '' || this.password == '') {
                alert('Please fill in all fields');
            } else {
                const response = await axios.post('http://localhost:3000/loginUser', {
                    username: this.username,
                    password: this.password,
                });
                if(response.data.username === this.username && response.data.password === this.password) {
                    sessionStorage.setItem("username", response.data.username);
                    process.env.USERNAME = response.data.username;
                   this.$router.push("/home");
                } else{
                    alert('Wrong username or password');
                }
            }
        },
    }
}
</script>