const mutations = {
    initialiseStore(state) {
        // Check if the ID exists
        if (localStorage.getItem('store')) {
            // Replace the state object with the stored item
            this.replaceState(
                Object.assign(state, JSON.parse(localStorage.getItem('store')))
            );
        }
    },
    setIsErrorMain(state, payload) {
        return state.isErrorMain = payload;
    },
    setIsErrorPhone(state, payload) {
        return state.isErrorPhone = payload;
    },
    setErrorMain(state, payload) {
        return state.errorMain = payload;
    },
    setErrorPhone(state, payload) {
        return state.errorPhone = payload;
    },
};

export default mutations;
