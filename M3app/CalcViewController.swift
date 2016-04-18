//
//  CalcViewController.swift
//  M3app
//
//  Created by Ian Vitor da Silva on 14/04/16.
//  Copyright © 2016 Ian Vitor da Silva. All rights reserved.
//

import UIKit

class CalcViewController: UIViewController {
    //Labels da view
    @IBOutlet var numerTextField: UITextField!
    @IBOutlet var quantidadeLabel: UILabel!
    @IBOutlet var mediaLabel: UILabel!
    @IBOutlet var medianaLabel: UILabel!
    @IBOutlet var maximoLabel: UILabel!
    @IBOutlet var minimoLabel: UILabel!
    @IBOutlet var varianciaLabel: UILabel!
    @IBOutlet var piLabel: UILabel!
    @IBOutlet var desvioLabel: UILabel!
    @IBOutlet var modaLabel: UILabel!
    @IBOutlet var probLabel: UILabel!
    @IBOutlet var prob2Label: UILabel!
    
    var array: [Float] = [] //Declara o array onde vai armazenar os dados
    
    var i: Int = 0 //Contador
    var j: Int = 0 //Contador
    var tamanhodovetor: Float = 0 //Declara o tamanho do vetor
    var totaldoconjunto: Float = 0 //Declara a soma do conjunto
    
    @IBAction func addNumberButton(sender: AnyObject) {
        let numero = Float (numerTextField.text!) //Variavel recebe o valor do usuário
        
        totaldoconjunto = totaldoconjunto + Float (numero!) //Valor é somado a variável
        
            array.insert(numero!, atIndex: i) //Insere o valor do usúario no vetor
        
            tamanhodovetor = tamanhodovetor + 1 //Declara o tamanho do vetor
            quantidadeLabel.text = String (tamanhodovetor) //Seta o valor do tamanho na tela
        
            //print(array[i]) //texte imprime o array
        
            i = i + 1 //Incremento no contador
        
            //print(totaldoconjunto)
        
            numerTextField.text = nil //Seta a text field como null
    }
    
    //Botao de resultado
    @IBAction func resultadoButton(sender: AnyObject) {
        let media = calcularMedia(totaldoconjunto, tamanhodovetor: tamanhodovetor)//Chamando a função da media
        mediaLabel.text = String (media) //Media aparece no app
        
        let mediana = Int (tamanhodovetor/2) //Declada a mediana
        mediana - 1
        let local = array[mediana] //Pega o valor da mediana
        medianaLabel.text = String (local) //Mediana aparece no app
        
        let numeroMax = array.maxElement()! //Pega o valor maximo
        maximoLabel.text = String (numeroMax) //Numero maximo aparece no app
        
        let numeroMin = array.minElement()! //Pega o valor minimo
        minimoLabel.text = String (numeroMin) //Numero minimo aparece no app
        
        var soma: Float = 0 //Declara variavel para incrementar variancia
        var variancia: Float = 0 //Declara variavel para incrementar variancia
        
        //Variancia
        while (j<array.count) { //Comando para calcular a variancia
            let potencia = (array[j] - media) * (array[j] - media) //Calcula a potencia
            soma = soma + potencia //Pega o valor da soma das potencias
            j++
        }
        variancia = soma / tamanhodovetor //Divide pela quantidade de numeros no conjunto
        varianciaLabel.text = String (variancia) // Variancia aparece no app
        
        j=0 //Zerar o j para alocar mais dados
        
        //Par ou impar
        var par: Float = 0 //Declara par
        var impar: Float = 0 //Declara impar
        
        while (j<array.count){ //Comando para contar os pares e impares do conjunto
            if (array[j] % 2 == 0){ //Ve se o resto da divisão é zero
                par = par + 1
            } else { //Caso contrario é um numero impar
                impar = impar + 1
            }
            j++
        }
        piLabel.text = "\(par)/\(impar)" // Par e impar aparece no app
        
        //Probabilidade
        var probPar: Float = 0 //Variavel pra armazenar
        var probImpar: Float = 0 //Variavel pra armazenar
        
        probPar = (par / tamanhodovetor)*100 //Calculo da probabilidade
        probImpar = (impar / tamanhodovetor)*100 //Calculo da probabilidade
        
        probLabel.text = String ("\(probPar)%") //Mostra a prob. de numeros pares no app
        prob2Label.text = String ("\(probImpar)%") //Mostra a prob. de numeros impares no app
        
        //Desvio Padrão
        let desviopadrao = sqrt(variancia) //Declara desvio padrao que é a raiz quadrada da variancia
        desvioLabel.text = String (desviopadrao) //Desvio padrão aparece na tela
        
        
        //Moda
        var frequency: [Float:Float] = [:] //Declara frequencia
        for x in array { //Funcao pra ver quantos numeros se repetem
            frequency[x] = (frequency[x] ?? 0) + 1
        }
        let moda = frequency.sort { $0.1 > $1.1 } //Pega o valor que mais se repete e quantidade de vezes
        modaLabel.text = String (moda) //Moda aparece no app
    }
    
    //Função que calcula a média
    func calcularMedia(totaldoconjunto: Float, tamanhodovetor: Float) -> Float{
        return totaldoconjunto/tamanhodovetor //Calculo de media
    }
    
    //Funcao que calcula a mediana
    func calcularMediana (tamanhodovetor: Float) -> Float {
        return tamanhodovetor/2 //Calculo de Mediana
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
