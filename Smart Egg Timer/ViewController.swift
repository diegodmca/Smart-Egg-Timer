//
//  ViewController.swift
//  Smart Egg Timer
//
//            Created by Diego Carvalho on 28/05/22.
//
import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let tempos = ["Mole": 60,"Médio": 420,"Duro": 660]
    var timer = Timer()
    var player: AVAudioPlayer!
    var totalTempo = 0
    var segundosPassados = 0
    
    @IBOutlet weak var barraProgresso: UIProgressView!
    @IBOutlet weak var titulo: UILabel!
    @IBAction func tipoSelecionado(_ sender: UIButton) {
        timer.invalidate()
        let selecao = sender.currentTitle!
        titulo.text = selecao
        totalTempo = tempos[selecao]!
        barraProgresso.progress = 0.0
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(atualizaContador), userInfo: nil, repeats: true)
    }
   @objc func atualizaContador (){
       if segundosPassados < totalTempo	{
           segundosPassados += 1
           barraProgresso.progress = Float(segundosPassados) / Float(totalTempo)
       }else {
           timer.invalidate()
           titulo.text = "Terminou!"
                      
           let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                       player = try! AVAudioPlayer(contentsOf: url!)
           player.play()
       }
       
    }
    
  }
