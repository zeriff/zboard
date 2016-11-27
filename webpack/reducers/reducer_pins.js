import {LOAD_PINS} from '../actions/index';

const INITIAL_STATE = {
    pins: []
}

export default function(state = [], action) {
    console.log(state);
    switch (action.type) {
        case LOAD_PINS:
            return {
                ...state,
                pins: state.pins.concat(action.payload.data)
            };
        default:
            return INITIAL_STATE
    }
    return INITIAL_STATE;
}
