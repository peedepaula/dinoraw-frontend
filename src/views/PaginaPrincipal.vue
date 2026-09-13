<template>
    <div id="tudo">
        <div id="cabeca"><Header1/></div>
        <div id="corpo">
            <Nav1/>
            <div id="conteudo">
                <Tradutor/>
            </div>
        </div>
        
        
    </div>

</template>

<script>
import Header1 from '@/components/Header.vue';
import Nav1 from '@/components/Nav.vue'
import Tradutor from '@/components/Tradutor.vue';

export default{
    name: 'PaginaPrincipal',
    components: {
        Header1,
        Nav1,
        Tradutor
    }

}
</script>


<style scoped>
html{
    scroll-behavior: smooth;
}

#tudo{
    height: 100vh;
    width: 100%;
    overflow-y: hidden;
}

    div{
    display: flex;
    flex-direction: column;
    }

    #corpo{
    display: flex;
    flex-direction: row;
    height: 100%;
    margin: 0;
    }

    #conteudo{
    display: flex;
    flex-direction: column;
    align-items: center;
    background-color: #262626;
    width: 100%;
    height: calc(100vh - 95px);
    max-height: 100vh;
    overflow-y: auto;
    overflow-x: hidden;
    box-sizing: border-box;
    padding-top: 50px;
    }


    @media (max-width: 600px){
        #conteudo{
            box-sizing: border-box;
            padding-top: 50px;
        }
    }
</style>