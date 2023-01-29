<template>
    <div class="layout-content">
        <div v-if="model">
            <div class="p-field p-fluid">
                <label for="Title">Title</label>
                <InputText id="Title" v-model="model.title"/>
            </div>
            <div class="p-field p-fluid">
                <label for="Description">Description</label>
                <InputText id="Description" v-model="model.description"/>
            </div>

        </div>
    </div>
</template>


<script>
import {mapActions, mapGetters} from "vuex";

export default {
    name: "TaskEdit",
    data() {
        return {
            model: null
        }
    },
    async mounted() {
        //---Request---
        console.log(132, this.$route.params.id);
        await this.actionTaskGet({id: this.$route.params.id}).then(response => {
            this.model = response.data.data;
        });
    },
    computed: {
        ...mapGetters('task', {taskIndex: 'index'}),
    },
    methods: {
        ...mapActions('task', {actionTaskGet: 'actionGet'}),
        //     async getData() {
        //         await this.request('GET', this.dataUrl).then(response => {
        //             this.model.data = response.data;
        //             this.isDataLoaded = true;
        //         });
        //     },
        //     confirmDeleteCatalog(catalog) {
        //         this.officer = catalog;
        //         this.deleteOfficerDialog = true;
        //     },
        //     deleteOfficer() {
        //         this.request('DELETE', this.dataUrl, {ids: [this.officer.id]}).then(response => {
        //             this.getData();
        //             this.deleteOfficerDialog = false;
        //             this.officer = {};
        //
        //             if (['system', 'error'].includes(response.type)) {
        //                 this.$toast.add(response.message);
        //             }
        //         });
        //     },
        //     confirmDeleteSelected() {
        //         this.deleteOfficersDialog = true;
        //     },
        //     deleteSelectedOfficers() {
        //         this.request('DELETE', this.dataUrl, {ids: this.selectedOfficers.map(o => o['id'])}).then(response => {
        //             this.getData();
        //             this.deleteOfficersDialog = false;
        //             this.selectedOfficers = null;
        //
        //             if (['system', 'error'].includes(response.type)) {
        //                 this.$toast.add(response.message);
        //             }
        //         });
        //     },
        //     openNew() {
        //         this.$router.push({name: 'account.edit', params: {id: 'create'}});
        //     },
        //     editCatalog(officer) {
        //         this.$router.push({name: 'account.edit', params: {id: officer.id}});
        //     },
        //     hideDialog() {
        //         this.submitted = false;
        //     },
        //     getRoleTitle(model) {
        //         console.log(11133, model);
        //         //убрать проверку
        //         if (model.role.translations.find(item => item.language.key == this.$store.state.adminLanguageKey))
        //             return model.role.translations.find(item => item.language.key == this.$store.state.adminLanguageKey).title;
        //         return;
        //     },
    }
}
</script>

<style scoped>

</style>
