<template>
    <div id="Mensagens">
        <div id="mensagens">
            <h1 id="emdino">{{ dados.mensagem_criptografada }}</h1>
            <h2 id="em-portugues">{{ dados.mensagem_descriptografada }}</h2>
        </div>
        <div id="mandar-mensagens">
            <label for="">Deixe sua mensagem:</label>
            <div id="area-de-mandar">
                <textarea v-model="mensagem" name="" id="" placeholder="Escreva sua mensgem..."></textarea>
                <button @click="enviarMensagem()">Enviar</button>
            </div>
        </div>
    </div>

</template>

<script>
import axios from 'axios'

export default {
  name: 'Mensagem',
  data() {
    return {
      mensagem: '',
      dados: {
        mensagem_criptografada: '',
        mensagem_descriptografada: ''
      }
    }
  },

  methods: {
    async enviarMensagem() {
      if (!this.mensagem.trim()) {
        alert("Digite uma mensagem antes de enviar.")
        return
      }

      try {
        await axios.post(`http://192.168.0.104:8000/atualizar-mensagem/${encodeURIComponent(this.mensagem)}`)
        await this.puxarMensagem()
        this.mensagem = ''  // limpa o campo após enviar
      } catch (error) {
        console.error("Erro ao enviar mensagem:", error)
      }
    },

    async puxarMensagem() {
      try {
        const res = await axios.get('http://192.168.0.104:8000/mensagem')
        const mensagens = res.data

        if (mensagens.length > 0) {
          const ultima = mensagens[mensagens.length - 1]
          this.dados = {
            mensagem_criptografada: ultima.dino,
            mensagem_descriptografada: ultima.portugues
          }
        }
      } catch (error) {
        console.error("Erro ao puxar mensagem:", error)
      }
    }
  },

  mounted() {
    this.puxarMensagem() // pega a última mensagem ao abrir a página
  }
}
</script>

<style scoped>
#Mensagens{
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    width: 70%;
    height: 700px;
    background-color: #262626;
    border-radius: 15px;
    margin-bottom: 50px;
    gap: 60px;
    padding-top: 30px;
    padding-bottom: 30px;
    box-shadow: 10px 9px 30px 0px rgba(0, 0, 0, 0.288);
    border: solid 1px #fcfcfc19;
}

#mensagens{
    display: flex;
    align-items: center;
    flex-direction: column;
    width: 100%;
    gap: 10px;
    height: auto;
}



h1{
    white-space: normal;
    word-wrap: break-word;
    overflow-wrap: break-word;
    overflow: hidden;
    width: 90%;
    max-width: 90%;
    max-height: 250px;
    display: flex;
    justify-content: center;

    font-weight: 600;
    color: #ffffff;
    font-size: 40px;
    overflow-y: auto;
}

h2{
    word-wrap: break-word;
    overflow-wrap: break-word;
    white-space: normal;
    overflow: hidden;

    width: 90%;
    max-width: 90%;
    height: auto;
    max-height: 100px;

    display: flex;
    justify-content: center;
    text-align: center;


    font-weight: 300;
    color: #ffffff8b;
    font-size: 25px;
    overflow-y: auto;

}


#mandar-mensagens{
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 90%;
    gap: 5px;
}

label{
    font-size: 16px;
    font-weight: 400;
    color: #22234294;
}

#area-de-mandar{
    display: flex;
    justify-content: center;
    flex-direction: row;
    gap: 20px;
    width: 90%;
    margin-bottom: 10px;
}

textarea{
    width: 500px;
    height: 45px;
    background-color: rgb(50, 50, 50);
    color: #ffffff;
    resize: none;
    border: none;
    border-radius: 5px;
    padding: 5px;
    overflow-x: hidden;
    overflow-y: auto;
    border: solid 1px #fcfcfc19;
}

button{
    width: 180px;
    height: 51px;
    color: rgb(50, 50, 50);
    background-color: #ffffffcd;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: all 0.3s ease;
}

button:hover{
    background-color: rgb(255, 255, 255);
    color: rgb(50, 50, 50);
}


::placeholder{
    color: #ffffffcd;
    transform: scale(1.03);
    padding-left: 5px;
}

@media (max-width: 600px){
    #Mensagens{
        width: 90%;
        height: 400px;
        justify-content: space-evenly;
    }

    h1{
        font-size: 40px;
    }

    h2{
        font-size: 20px;
    }

    #area-de-mandar{
        flex-direction: column;
        align-items: center;

    }

    textarea{
        width: 100%;
        height: 80px;
    }
}

</style>