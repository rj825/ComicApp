import axios from 'axios';

export default {

createCollection(name){
    return axios.post('/collections', name)
},
allCollections(){
    return axios.get('/collections')
},
singleCollection(id){
    return axios.get(`/collections/${id}`)
}
}