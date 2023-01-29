const getters = {
    isErrorMain: state => {
        return state.isErrorMain;
    },
    isErrorPhone: state => {
        return state.isErrorPhone;
    },
    errorMain: state => {
        return state.errorMain;
    },
    errorPhone: state => {
        return state.errorPhone;
    }
};

export default getters;
