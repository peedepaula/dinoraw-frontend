<template>
    <nav>
        <ul>
            <router-link to="/"><li><a class="link">Traduzir</a></li></router-link>
            <hr>
            <router-link to="/posts"><li><a class="link">Posts</a></li></router-link>
            <hr>
            <router-link to="/mensagem"><li><a class="link">Mensagens</a></li></router-link>
            <hr>
            <router-link to="/contato"><li><a class="link">Contato</a></li></router-link>
            <hr>
        </ul>
    </nav>
</template>

<script>
export default{
    name:'NavMobile'
}
</script>


<style scoped>
nav{
    display: flex;
    justify-content: left;
    width: 250px;
    height: 100%;
    background-color: #262626;
    border-right: solid 1px #fcfcfc19;
}

ul{
    display: flex;
    flex-direction: column;
    gap: 10px;
    list-style: none;
    width: 100%;
    padding-top: 30px;
}

li{
    color: #ffffffa0;
    padding-left: 30px;
    cursor: pointer;
}

a, .link{
    color: #ffffffa0;
    text-decoration: none;
    transition: all 0.3s ease;
}

.link:hover{
    color: #006b00;
}

.link.active {
    color: #006b00 !important;
}

hr{
    display: flex;
    width: 80%;
    border: solid 0.5 rgba(0, 0, 0, 0.042);
    margin: 0 auto;
    opacity: 0.25;
}


@media (max-width: 600px)
{
    nav{
        display: flex;
        width: 200px;
        border-left: solid 1px #fcfcfc19;
        border-bottom: solid 1px #fcfcfc19;
        border-radius: 0px 0px 0px 10px;
    }
}

</style>