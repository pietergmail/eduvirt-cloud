<template>
    <div>
        <Navigation />


        <div class="flex flex-col mt-20 mx-auto px-8 md:px-14 lg:px-24 container animate-moveintotop">
        <h2 class="font-bold text-center text-4xl mb-8 text-ucllblue">Create Virtual Machine</h2>
            <div class="grid grid-cols-2 w-full" >
                <div class="bg-ucllblue w-full p-8 flex flex-col gap-4">
                    <label class="text-white font-bold" for="">Template</label>
                    <select class="py-2 cursor-pointer" name="" id="" v-model="selectedTemplate" >
                        <option disabled value="">Choose Template</option>
                        <option v-for="template in templates" :key="template.id" :value="template.name">{{template.name}}</option>
                    </select>
                </div>
                <div class="bg-ucllblue w-full p-8 flex flex-col gap-4">
                    <label class="text-white font-bold" for="">Courses</label>
                    <select class="py-2 cursor-pointer" name="" id="" v-model="selectedCourse">
                        <option disabled value="">Choose Course</option>
                        <option v-for="course in courses" :key=course.id :value="course.name">{{course.name}}</option>
                    </select>
                </div>
                <div class="col-span-2 p-8 bg-ucllblue text-white grid grid-cols-2 w-full">
                    <h2 class="col-span-2 text-3xl">Your selection:</h2>
                    <ul class="text-white text-lg">
                        <li>Template: <p class="text-blue-400"> {{selectedTemplate}} </p></li>
                        <li>Course: <p class="text-blue-400"> {{selectedCourse}} </p></li>
                    </ul>

                </div>
                <input class="col-span-2 p-4 bg-ucllred text-white cursor-pointer" v-on:click="createVM" type="submit" value="Create VM">
            </div>
        </div>


        
    </div>
</template>

<script>
import Navigation from "../components/Navigation.vue";
export default {
    components: {
        Navigation,
    },

    data() {
        return {
            templates: [{"name": "Windows 10"}, {"name": "Windows Server 2019"}, {"name": "Debian 11"}, {"name": "Ubuntu"}],
            courses: [{"name": "Besturing"}, {"name": "Netwerken"}, {"name": "Systeem"}],
            selectedTemplate: '',
            selectedCourse: '',
        };
    },

    methods: {
        createVM() {
            // redirect user to home page
            if(this.selectedTemplate.length > 0 && this.selectedCourse.length > 0) {
                this.$router.push("/" + this.selectedTemplate + "/" + this.selectedCourse);
            }
            else {
                alert("Please select a template and a course");
            }
        },
    },
}
</script>