<template>
    <header>
        
        <h2><img src="../assets/logo1.png" id="logo">Dino<span id="green">Raw</span></h2>
        <img src="../assets/menu.svg"  @click="abrirMenu()" id="menu">
        <div id="nav-mobile" v-show="menuVisivel" ref="navMenu">
            <NavMobile/>
        </div>
    </header>
</template>

<script>
import NavMobile from './NavMobile.vue';


export default{
    name:'Header',
    components:{
        NavMobile
    },

    data() {
    return {
      menuVisivel: false
    }
  },
    methods: {
        abrirMenu() {
            this.menuVisivel = !this.menuVisivel
        }
    }
}
</script>






<style scoped>
header{
    display: flex;
    flex-direction: row;
    justify-content: left;
    align-items: center;
    width: 100%;
    height: 95px;
    background-color: #262626;
    box-shadow: 10px 9px 30px 0px rgba(0, 0, 0, 0.288);
    border-bottom: solid 1px #fcfcfc19;
    position: relative;
}

#green{
    color: #ffffff;
}

#logo{
    padding-left: 40px;
    width: 90px;
    height: auto;
}

h2{
    display: flex;
    justify-content: center;
    align-items: center;
    display: flex;
    text-align: center;
    flex-direction: row;
    font-weight: 400;
    color: #ffffff;
}

#menu{
    display: none;
}

#nav-mobile{
    display: "none";
}

@media (max-width: 600px){
    header{
        display: flex;
        justify-content: space-between;
        box-sizing: border-box;
        padding-left: 20px;
        padding-right: 20px;
    }

    #logo{
        width: 50px;
        height: auto;
        padding: 0;

    }

    h2{
        font-size: 20px;
    }

    #menu{
        display: flex;
        width: 30px;
        height: 30px;
    }

    #nav-mobile{
        display: "";
        position: fixed;
        right: 0;
        top: 95px;
        height: 400px;
        width: auto;
        z-index: 1000;
    }
}
</style>