import axios from 'axios';

export default {

createCollection(name, isPublic){
    return axios.post('/collections', name, isPublic)
},
allCollections(){
    return axios.get('/collections')
},
singleCollection(id){
    return axios.get(`/collections/${id}`)
}
}