<template>
    <div class="main">
        <div id="header"><h2>Tradutor</h2></div>
        
        <div id="conteudo-traduzir" ref="contTraduzir">

            <div class="lado-traduzir">
                <h3 class="textos-h3">Protuguês</h3>

                <div class="area-de-texto">
                    <textarea ref="conteudoTexto" v-model="textoPortugues" class="texto" placeholder="Digite sua mensagem..."></textarea>
                    <div class="icones">
                        <img @click="tocarAudioPortugues()" class="icone" src="../assets/audio.svg" >
                        <img @click="copiarTextoPortugues()" class="icone" src="../assets/copy.svg"  >
                    </div>
                </div>
                
                <div class="botao">
                    <button @click="traduzirParaDino()">Traduzir</button>
                </div>
            </div>

            <div @click="trocarTradutor()" id="seta"><img src="../assets/seta.png" height="30px" width="30px" alt=""></div>

            <div class="lado-traduzir">
                <h3 class="textos-h3">Dino</h3>
                <div class="area-de-texto">
                    <textarea v-model="textoDino" class="texto" placeholder="Digite sua mensagem..."></textarea>
                    <div class="icones">
                        <img @click="tocarAudioDino()" class="icone" src="../assets/audio.svg" >
                        <img @click="copiarTextoDino()" class="icone" src="../assets/copy.svg"  >
                    </div>
                </div>
                <div class="botao">
                    <button @click="traduzirParaPortugues()">Traduzir</button>
                </div>
            </div>
            
            

        </div>

        <div id="conteudo-traduzir-mobile" ref="contTraduzirMobile">

            <div class="lado-traduzir">
                <h3 class="textos-h3">Protuguês</h3>
                <div class="area-de-texto">
                    <textarea v-model="textoPortugues" class="texto" placeholder="Digite sua mensagem..."></textarea>
                    <div class="icones">
                        <img @click="tocarAudioPortugues()" class="icone" src="../assets/audio.svg" >
                        <img @click="copiarTextoPortugues()" class="icone" src="../assets/copy.svg"  >
                    </div>
                </div>
                <div class="botao">
                    <button @click="traduzirParaDino()">Traduzir</button>
                </div>
            </div>

            <div @click="trocarTradutorMobile()" id="seta"><img src="../assets/seta.png" height="30px" width="30px" alt=""></div>

            <div class="lado-traduzir">
                <h3 class="textos-h3">Dino</h3>
                <div class="area-de-texto">
                    <textarea v-model="textoDino" class="texto" placeholder="Digite sua mensagem..."></textarea>
                    <div class="icones">
                        <img @click="tocarAudioDino()" class="icone" src="../assets/audio.svg" >
                        <img @click="copiarTextoDino()" class="icone" src="../assets/copy.svg"  >
                    </div>
                </div>
                <div class="botao">
                    <button @click="traduzirParaPortugues()">Traduzir</button>
                </div>
            </div>

        </div>
    </div>
</template>

<script>

export default{
    name:'Tradutor',
    data() {
        return {
            textoPortugues: '',
            textoDino: ''
        };
    },
    methods:{
        trocarTradutor(){
            const container = this.$refs.contTraduzir;
            const direcaoAtual = container.style.flexDirection;

            container.style.flexDirection = direcaoAtual === 'row' ? 'row-reverse' : 'row';

        },

        trocarTradutorMobile(){
            const container2 = this.$refs.contTraduzirMobile;
            const direcaoAtual2 = container2.style.flexDirection;

            container2.style.flexDirection = direcaoAtual2 === 'column' ? 'column-reverse' : 'column'
        },

        async traduzirParaDino() {
            if (!this.textoPortugues.trim()) {
                alert("Digite uma mensagem em Português!");
                return;
            }

            try {
                const response = await fetch(`http://192.168.0.107:8000/traduzir-portugues-para-dino/${encodeURIComponent(this.textoPortugues)}`, {
                    method: 'POST'
                });
                const data = await response.json();
                this.textoDino = data.dino;
            } catch (error) {
                console.error("Erro ao traduzir para Dino:", error);
                alert("Erro ao se conectar com a API.");
            }
        },

        async traduzirParaPortugues() {
            if (!this.textoDino.trim()) {
                alert("Digite uma mensagem em Dino!");
                return;
            }

            try {
                const response = await fetch(`http://192.168.0.107:8000/traduzir-dino-para-portugues/${encodeURIComponent(this.textoDino)}`, {
                    method: 'POST'
                });
                const data = await response.json();
                this.textoPortugues = data.portugues;
            } catch (error) {
                console.error("Erro ao traduzir para Português:", error);
                alert("Erro ao se conectar com a API.");
            }
        },

        copiarTextoPortugues() {
            const texto = this.textoPortugues; // já está no v-model

            if (navigator.clipboard && navigator.clipboard.writeText) {
                navigator.clipboard.writeText(texto)
                    .catch(err => console.error("Erro ao copiar:", err));
            } else {
                // Fallback para navegadores antigos
                const textarea = document.createElement("textarea");
                textarea.value = texto;
                textarea.style.position = "fixed";
                textarea.style.opacity = "0";
                document.body.appendChild(textarea);
                textarea.focus();
                textarea.select();
                try {
                    document.execCommand("copy");
                } catch (err) {
                    console.error("Erro ao copiar (fallback):", err);
                }
                document.body.removeChild(textarea);
            }
        },

        copiarTextoDino() {
            const texto = this.textoDino; // já está no v-model

            if (navigator.clipboard && navigator.clipboard.writeText) {
                navigator.clipboard.writeText(texto)
                    .catch(err => console.error("Erro ao copiar:", err));
            } else {
                // Fallback para navegadores antigos
                const textarea = document.createElement("textarea");
                textarea.value = texto;
                textarea.style.position = "fixed";
                textarea.style.opacity = "0";
                document.body.appendChild(textarea);
                textarea.focus();
                textarea.select();
                try {
                    document.execCommand("copy");
                } catch (err) {
                    console.error("Erro ao copiar (fallback):", err);
                }
                document.body.removeChild(textarea);
            }
        },

            async tocarAudioPortugues() {
                const texto = this.textoPortugues
                try {
                    // Faz a requisição pro backend
                    const response = await fetch(`http://192.168.0.107:8000/audio-portugues/${encodeURIComponent(texto)}`,{
                        method: 'POST'
                    });

                    const audioBlob = await response.blob();

                    // Se já tiver um URL antigo, libera a memória
                    if (this.audioUrl) URL.revokeObjectURL(this.audioUrl);

                    // Cria um novo URL
                    this.audioUrl = URL.createObjectURL(audioBlob);

                    // Cria o áudio e toca
                    const audio = new Audio(this.audioUrl);
                    audio.play();
                } catch (error) {
                    console.error("Erro ao reproduzir áudio:", error);
                }

        },

        async tocarAudioDino() {
                const texto = this.textoDino
                try {
                    // Faz a requisição pro backend
                    const response = await fetch(`http://192.168.0.107:8000/audio-dino/${encodeURIComponent(texto)}`,{
                        method: 'POST'
                    });

                    const audioBlob = await response.blob();

                    // Se já tiver um URL antigo, libera a memória
                    if (this.audioUrl) URL.revokeObjectURL(this.audioUrl);

                    // Cria um novo URL
                    this.audioUrl = URL.createObjectURL(audioBlob);

                    // Cria o áudio e toca
                    const audio = new Audio(this.audioUrl);
                    audio.play();
                } catch (error) {
                    console.error("Erro ao reproduzir áudio:", error);
                }

        },

    }
}
</script>

<style scope>
.main{
    display: flex;
    text-align: center;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    gap: 10px;
    width: 70%;
    height: 350px;
    background-color: #262626;
    border-radius: 15px;
    box-sizing: border-box;
    box-shadow: 10px 9px 30px 0px rgba(0, 0, 0, 0.288);
    border: solid 1px #fcfcfc19;
}

#conteudo-traduzir{
    display: flex;
    flex-direction: row;
    align-items: center;
    gap: 20px;
    height: auto;
}

#seta{
    width: 30px;
    height: 30px;
    cursor: pointer;
}

.lado-traduzir{
    display: flex;
    flex-direction: column;
    gap: 10px;
}
.texto{
    width: 320px;
    height: 150px;
    background-color: rgb(50, 50, 50);
    color: #ffffffcd;
    resize: none;
    border: none;
    border-radius: 15px;
    box-sizing: border-box;
    padding: 5px;
    padding-bottom: 33px;
    box-shadow: 3px 3px 5px 0px rgba(0, 0, 0, 0.142);
    border: solid 1px #3030306e;


}

.textos-h3{
    color: #ffffff;
    font-weight: 300;
    display: flex;
    justify-content: left;
}

h2{
    font-weight: 400;
    color: #ffffff;
}

::placeholder{
    color: #ffffff39;
    font-size: 14px;
}

.botao{
    width: 100%;
    display: flex;
    flex-direction: row;
    justify-content: right;
}

button{
    width: 150px;
    height: 30px;
    color: rgb(50, 50, 50);
    background-color: #ffffffcd;
    border: none;
    border-radius: 10px;
    cursor: pointer;
    transition: all 0.3s ease;
}

button:hover{
    background-color: #ffffff;
    color: rgb(50, 50, 50);
}

#conteudo-traduzir-mobile{
    display: none;
}

.area-de-texto{
    width: 320px;
    height: 150px;
    display: flex;
    flex-direction: column;
    box-sizing: border-box; 
    position: relative;

}

.icones{
    width: 320px;
    height: 33px;
    display: flex;
    flex-direction: row;
    gap: 8px;
    align-items: center;
    justify-content: right;
    box-sizing: border-box;
    padding-right: 10px;
    position: absolute;
    bottom: 0;
    border-radius: 0px 0px 15px 15px;
    background-color: rgb(50, 50, 50);
}

.icone{
    width: 25px;
    height: 25px;
    cursor: pointer;
    opacity: 0.25;
    transition: all 0.3s ease;
}

.icone:hover{
    opacity: 0.75;
    transform: scale(1.05);
}

@media (max-width: 600px){
        .main{
            width: 90%;
            height: auto;   
            justify-content: space-around; 
            box-sizing: border-box;
            padding: 20px;
        }
        
        #conteudo-traduzir{
            display: none;
        }

        .texto{
            width: 270px;
            height: 150px;
        }

        .area-de-texto{
            width: 270px;
        }

        .icones{
            width: 270px;
        }


        /* textos */
        .textos-h3{
            font-size: 15px;
        }

        h2{
            font-weight: 400;
            font-size: 20px;
        }
        /* textos */

        #conteudo-traduzir-mobile{
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            width: auto;
            height: auto;
            gap: 20px;
        }
    }
</style>