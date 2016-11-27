import {combineReducers} from 'redux';
import PostsReducer from './reducer_pins';

const rootReducers = combineReducers({pins: PostsReducer});

export default rootReducers;
