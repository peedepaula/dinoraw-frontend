<template>
    <div id="Contato">
        <h2>Contato</h2>  
        <div id="itens">
            <div class="item">
                <div class="img"></div>
                <h3>@dinoraw_site</h3>
            </div>

            <div class="item">
                <div class="img"></div>
                <h3>dinoraw.site@gmail.com</h3>
            </div>

            <div class="item">
                <div class="img"></div>
                <h3>https://dinoraw.com.br</h3>
            </div>
        </div>      
    </div>
        
</template>

<script>
export default{
    name:'Contato'
}
</script>


<style scoped>
#Contato{
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    width: 70%;
    height: 400px;
    background-color: #262626;
    border-radius: 15px;
    padding-top: 30px;
    padding-bottom: 30px;
    margin-bottom: 60px;
    gap: 50px;
    box-shadow: 10px 9px 30px 0px rgba(0, 0, 0, 0.288);
    border: solid 1px #fcfcfc19;
}

h2{
    font-weight: 300;
    color: #ffffff;
    text-align: center;
}

#itens{
    display: flex;
    flex-direction: column;
    justify-content: left;
    width: 90%;
    gap: 10px;
    padding-left: 20px;
    
}

.item{
    display: flex;
    flex-direction: row;
    padding-left: 10px;
    align-items: center;
    gap: 10px;
    width: 300px;
    height: 60px;
    background-color: rgb(50, 50, 50);
    border-radius: 15px;

}

h3{
    font-weight: 600;
    color: #ffffffcd;
    text-align: center;
}

.img{
    width: 35px;
    height: 35px;
    background-color: #ffffffcd;
    border-radius: 100px;
}

@media (max-width: 600px){
    #Contato{
        width: 90%;
    }
    #itens{
        gap: 20px;
        align-items: center;
        padding: 0;
    }

    .item{
        width: 250px;
        border: none;

        

    }

    h3{
        font-size: 15px;
    }
}
</style>