import axios from 'axios';

export default {

createCollection(collection){
    return axios.post('/collections', collection)
},
allCollections(){
    return axios.get('/collections')
},
singleCollection(id){
    return axios.get(`/collections/${id}`)
},

myCollections(username){
    return axios.get(`/collections/user/${username}`)
}

}