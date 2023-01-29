// import router from "../../app";

const actions = {
    async actionIndex({dispatch, commit, state, rootState}, payload) {
        return axios.get(rootState.api + 'task');
    },
    async actionGet({dispatch, commit, state, rootState}, payload) {
        // console.log(12, router);

        return axios.get(rootState.api + 'task/' + payload.id);
    },
};

export default actions;
