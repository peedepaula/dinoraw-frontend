<template>
    <div id="Posts">
        <h2>Posts</h2>
        <ul>
            <li> <img class="img" src="../assets/foto1.jpg" alt=""></li>
            <li> <img class="img" src="../assets/foto2.jpg" alt=""></li>
            <li> <img class="img" src="../assets/foto3.jpg" alt=""></li>
            <li> <img class="img" src="../assets/foto4.jpg" alt=""></li>
            <li> <img class="img" src="../assets/foto5.jpg" alt=""></li>
            <li> <img class="img" src="../assets/foto6.jpg" alt=""></li>
            <li> <img class="img" src="../assets/foto5.jpg" alt=""></li>
            <li> <img class="img" src="../assets/foto6.jpg" alt=""></li>
        </ul>
    </div>

</template>

<script>
export default{
    name:'Posts'
}
</script>


<style scoped>
#Posts{
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    background-color: #262626;
    margin-bottom: 50px;
    width: 70%;
    height: 650px;
    border-radius: 15px;
    padding-top: 30px;
    padding-bottom: 30px;
    box-shadow: 10px 9px 30px 0px rgba(0, 0, 0, 0.288);
    border: solid 1px #fcfcfc19;
}


h2{
    font-weight: 300;
    color: #ffffff;
    padding-bottom: 20px;
}

ul{
    display: flex;
    align-items: center;
    justify-content: space-around;
    flex-wrap: wrap;
    width: 95%;
    height: 95%;
    list-style: none;
    gap: 10px;
    max-height: 90%;
    overflow-y: auto;
    overflow-x: hidden;
}


li{
    height: 250px;
    width: 250px;
    border-radius: 15px;
    background-color: rgb(82, 82, 82);
}

.img{
    height: 250px;
    width: 250px;
    border-radius: 15px;
    border: solid 1px #fcfcfc19;
    object-fit: cover;
    display: block;
}

@media (max-width: 600px){
    #Posts{
        width: 90%;
        height: 500px;
    }

    li{
        width: 150px;
        height: 150px;

    }


    .img{
        width: 150px;
        height: 150px;
    }
}
</style>