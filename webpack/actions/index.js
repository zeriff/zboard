import axios from 'axios';

export const LOAD_PINS = 'LOAD_PINS';

export function loadPins() {
    const request = axios.get('/api/getpins');
    return {type: LOAD_PINS, payload: request}
}
