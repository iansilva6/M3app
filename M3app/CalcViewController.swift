//
//  CalcViewController.swift
//  M3app
//
//  Created by Ian Vitor da Silva on 14/04/16.
//  Copyright © 2016 Ian Vitor da Silva. All rights reserved.
//

import UIKit

class CalcViewController: UIViewController {
    @IBOutlet var numerTextField: UITextField!
    @IBOutlet var quantidadeLabel: UILabel!
    @IBOutlet var mediaLabel: UILabel!
    @IBOutlet var medianaLabel: UILabel!
    @IBOutlet var maximoLabel: UILabel!
    @IBOutlet var minimoLabel: UILabel!
    @IBOutlet var varianciaLabel: UILabel!
    
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
        let media = calcularMedia(totaldoconjunto, tamanhodovetor: tamanhodovetor)
        mediaLabel.text = String (media)
        
        let mediana = Int (tamanhodovetor/2)
        mediana - 1
        let local = array[mediana]
        medianaLabel.text = String (local)
        
        let numeroMax = array.maxElement()!
        maximoLabel.text = String (numeroMax)
        
        let numeroMin = array.minElement()!
        minimoLabel.text = String (numeroMin)
        
        var soma: Float = 0
        var variancia: Float = 0
        
        while (j<array.count) {
            print(array[j])
            let potencia = (array[j] - media) * (array[j] - media)
            soma = soma + potencia
            j++
        }
        variancia = soma / tamanhodovetor
        varianciaLabel.text = String (variancia)
    }
    
    //Função que calcula a média
    func calcularMedia(totaldoconjunto: Float, tamanhodovetor: Float) -> Float{
        return totaldoconjunto/tamanhodovetor
    }
    
    //Funcao que calcula a mediana
    func calcularMediana (tamanhodovetor: Float) -> Float {
        return tamanhodovetor/2
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
