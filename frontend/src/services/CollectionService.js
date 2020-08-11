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
},

singleCollectionArtistStats(id, artist) {
    return axios.get(`/collections/${id}/artist/${artist}`)
},

singleCollectionAuthorStats(id, author) {
    return axios.get(`/collections/${id}/author/${author}`)
},

allCollectionsArtistStats(artist) {
    return axios.get(`/collections/artist/${artist}`)
},

allCollectionsAuthorStats(author) {
    return axios.get(`/collections/artist/${author}`)
}
}