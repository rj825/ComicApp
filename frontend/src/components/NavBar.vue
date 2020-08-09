<template>
  <div class="navbarroot">

        <b-navbar class="navbar"  toggleable="lg" type="light" variant="info">
            <router-link v-bind:to="{ name: 'home' }">Three-Point</router-link>
            

            <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

            <b-collapse id="nav-collapse" is-nav>
                <b-navbar-nav>
                    <b-nav-item>
                        <router-link v-bind:to="{path: `/collections/user/${username}`}" v-if="$store.state.token !=''">Profile</router-link>
                    </b-nav-item>
                    <b-nav-item>
                        <router-link v-bind:to="{ name: 'collections' }">Collections</router-link>
                    </b-nav-item>
                </b-navbar-nav>

                <!-- Right aligned nav items -->
                <b-navbar-nav class="ml-auto">
                        <b-nav-form>
                            <b-form-input size="sm" class="mr-sm-2" placeholder="Search (not active)"></b-form-input>
                            <b-button size="sm" class="my-2 my-sm-0" type="submit">Search</b-button>
                        </b-nav-form>

                        <b-nav-item-dropdown right>
                             <!-- Using 'button-content' slot -->
                            <template v-slot:button-content>
                                <em>{{username}}</em>
                            </template>

                            <b-dropdown-item>
                                <router-link  v-bind:to="{ name: 'upgrade' }">Upgrade to Premium</router-link>
                            </b-dropdown-item>
                            <b-dropdown-item>
                                <router-link v-bind:to="{ name: 'login' }" v-if="$store.state.token === ''">Login</router-link>
                            </b-dropdown-item>
                            <b-dropdown-item>
                                <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
                            </b-dropdown-item>
                        
                        </b-nav-item-dropdown>
                </b-navbar-nav>

            </b-collapse>
        </b-navbar>

  </div>
</template>

<script>
export default {
    name: 'navbar',
    computed: {
        username() {
            return this.$store.state.user.username
        }
    }

}
</script>

<style>

.navbarroot {
    font-family: "Bangers";
}



</style>