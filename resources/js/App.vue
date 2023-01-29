<template>
    <div class="">


<!--        <div class="container py-4 px-5 text-center component-wrapper">-->
<!--            <div class="row">-->

<!--                <div class="d-flex justify-content-between align-items-center">-->
<!--                    <div class="component-label py-2">Новая заявка на открытие счета</div>-->

<!--                    <div class="ml-auto p-2">-->
<!--                        <a @click="closeCreateApp">-->
<!--                            <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">-->
<!--                                <path d="M18 1.81286L16.1871 0L9 7.18714L1.81286 0L0 1.81286L7.18714 9L0 16.1871L1.81286 18L9 10.8129L16.1871 18L18 16.1871L10.8129 9L18 1.81286Z"-->
<!--                                      fill="url(#paint0_linear_333_5127)"/>-->
<!--                                <defs>-->
<!--                                    <linearGradient id="paint0_linear_333_5127" x1="0.322251" y1="9.72263" x2="18.0038" y2="9.62583"-->
<!--                                                    gradientUnits="userSpaceOnUse">-->
<!--                                        <stop stop-color="#F39034"/>-->
<!--                                        <stop offset="1" stop-color="#FF2727"/>-->
<!--                                    </linearGradient>-->
<!--                                </defs>-->
<!--                            </svg>-->
<!--                        </a>-->
<!--                    </div>-->
<!--                </div>-->
<!--            </div>-->
<!--            <hr>-->
<!--            <div class="row justify-content-md-center my-5 ">-->
<!--                <progress-bar stage="4"/>-->
<!--            </div>-->
<!--            <div class="row">-->
<!--                <div class="fs-4 fw-bold py-2 mt-5">Расчетный счет открыт</div>-->
<!--                <p class="text-success font-weight-light status-green-gradient mt-5" style="font-size: 18px">-->
<!--                    Поздравляем! Расчетный счет открыт! Для работы с платежами перейдите по ссылке.-->
<!--                </p>-->
<!--            </div>-->
<!--            <div class="row">-->
<!--                <a class="fs-5 fw-bold link-dark mt-4" href="https://my.metib.online/auth/login" target="_blank">Перейти в-->
<!--                    ДБО</a>-->
<!--            </div>-->
<!--            <div class="text-align-left mt-5 mb-5" v-if="company.data.brief">-->
<!--                <p class="company-search-name">{{ company.data.brief }}, {{ company.data.founder }}</p>-->
<!--                <p class="company-search-data">-->
<!--                    <span>ОГРН: {{ company.data.ogrn }}, ИНН: {{ company.data.inn }}</span><br>-->
<!--                    <span>Адрес: {{ company.data.address }}</span>-->
<!--                </p>-->
<!--            </div>-->
<!--        </div>-->

        <div class="container">
            <router-view></router-view>
        </div>
    </div>
</template>

<script>
import {mapActions, mapGetters, mapMutations} from "vuex";

export default {
    // name: 'AccountComponent.vue',
    data: function () {
        return {
            // company: []
        }
    },
    async mounted() {
        //---Request---
        // await this.actionApplicationCompanyInfo().then(response => {this.company = response})
    },
    computed: {
        // ...mapGetters('application', {applicationId: 'id'}),
    },
    methods: {
        // ...mapActions('application', {actionApplicationCompanyInfo: 'actionCompanyInfo'}),
        // closeCreateApp: function () {
        //     this.$router.push({name: 'applications_list'})
        // }
    }
}
</script>

<style scoped>

</style>
