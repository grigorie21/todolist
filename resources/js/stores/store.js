import task from './task/index'
import {createApp} from 'vue';
import {createStore} from 'vuex';
import Vuex from 'vuex';
import actions from './actions'
import getters from './getters'
import state from './state'
import mutations from './mutations'

export default createStore({
    state: state,
    getters: getters,
    mutations: mutations,
    actions: actions,
    modules: {
        task: task,
    },
});

// // Subscribe to store updates
// Store.subscribe((mutation, state) => {
//     // Store the state object as a JSON string
//     localStorage.setItem('store', JSON.stringify(state));
// });

// export default Store
