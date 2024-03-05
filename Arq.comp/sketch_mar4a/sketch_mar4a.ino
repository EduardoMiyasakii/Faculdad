int pinoSensor = 0; // saída do sensor na A0
int valorLido = 0; //Varíavel auxiliar
float temperatura = 0; // variável que armazenará a temperatura lida
int linha = 0; //varíavel que se refere as linhas do excel
void setup() {
  Serial.begin(9600);//inicia a comunicação inicial a 9600 bauds
  Serial.println("CLEARDATA"); // reset comunicação serial
  Serial.println("LABEL,hora,temperatura,linha"); //nomeia a coluna
  // put your setup code here, to run once:
}

void loop() { //funçao que será feita continuamente
valorLido = anaLogRead(Pinosensor); //leitura analógica da porta A0
temperatura = (valorlido * 0.00488); // 5 volts/1023 = 0.0048 precisão do A/D
temperatura = temperatura * 100 //converte milivolts para celsius - cada 10mV == 1 grau C
linha ++ // incrementando linha para que a leitura pule 
Serial.println("DATA,TIME"); // inicia a impressão de dados,fica sempre iniciando
Serial.println("temperatura");
Serial.println(",");
Serial.println(linha);
 

if (linha>100) // loop para limitar a quantidade de dados
{
  linha = 0;
  Serial.println("ROW,SET,2"); // alimentação das linhas sempre com os dados iniciados
}
 delay(1000); //tempo 5 seg para realizar outra leitura
  // put your main code here, to run repeatedly:

}
