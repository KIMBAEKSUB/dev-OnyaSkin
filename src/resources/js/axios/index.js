import axios from "axios";

const serverHttp = axios.create({
    baseURL: '/server',
    validateStatus(status){
        return 200 <= status && status < 300;
    }
})

export default serverHttp;