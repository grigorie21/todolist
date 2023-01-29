<template>
    <div class="layout-content">
        <Toast/>
        <div class="card" v-if="model">
            <Button label="New" icon="pi pi-plus" class="p-button-success p-mr-2"></Button>
            <DataTable :value="model" class="catalog-table">
                <Column field="id" header="id"></Column>
                <Column field="title" header="title"></Column>
                <Column field="description" header="description"></Column>
                <Column :exportable="false">
                    <template #body="slotProps">
                        <Button icon="pi pi-pencil" class="p-button-rounded p-button-success p-mr-2"
                                @click="editCatalog(slotProps.data)"/>
                        <Button icon="pi pi-trash" class="p-button-rounded p-button-warning"
                                @click="confirmDeleteCatalog(slotProps.data)"/>
                    </template>
                </Column>
            </DataTable>
        </div>
    </div>
</template>

<script>
import {mapActions, mapGetters} from "vuex";

export default {
    name: "TaskIndex",
    data() {
        return {
            model: null
        }
    },
    async mounted() {
        //---Request---
        // let self = this;

        await this.actionTaskIndex().then(response => {
            console.log(response.data.data);
            this.model = response.data.data;
        });
    },
    computed: {
        ...mapGetters('task', {taskIndex: 'index'}),
    },
    methods: {
        ...mapActions('task', {actionTaskIndex: 'actionIndex'}),
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
        editCatalog(obj) {
            this.$router.push({name: 'TaskEdit', params: {id: obj.id}});
        },
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
