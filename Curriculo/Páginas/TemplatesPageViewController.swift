//
//  TemplatesViewController.swift
//  Curriculo
//
//  Created by Carolina Ortega on 27/09/21.
//

import UIKit

class TemplatesPageViewController: UIViewController {
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var botaoAnterior: UIBarButtonItem!
    @IBOutlet var botaoConcluir: UIBarButtonItem!
    @IBOutlet var primeiroModelo: UIButton!
    @IBOutlet var segundoModelo: UIButton!
    //Dicionário
    let defaults = UserDefaults.standard
    var dictionary: [String : Any] = [:]  //Dictionary which you want to save
    //    let dictValue = UserDefaults.standard.value(forKey: "DictValue") //Retrieving the value from user default
    
    
    @IBOutlet var cancelarBotao: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Navegação
        self.navigationItem.setHidesBackButton(true, animated: false)
        botaoAnterior.style = .plain
        botaoAnterior.target = self
        botaoAnterior.action = #selector(changeViewController)
        
        cancelarBotao.action = #selector(cancelarAcao)
        cancelarBotao.target = self
        cancelarBotao.style = .plain
        
        primeiroModelo.addTarget(self, action: #selector(acaoModelo1), for: .touchUpInside)
        segundoModelo.addTarget(self, action: #selector(acaoModelo2), for: .touchUpInside)
        //Dicionário
        if let userDataDictionary = defaults.dictionary(forKey: "DictValue"){
            dictionary = userDataDictionary
        }
        
        
    }

    //Navegação
    @objc func changeViewController(){
        
        let viewcontrollers = self.navigationController?.viewControllers
        
        viewcontrollers?.forEach({ (vc) in
            if  let inventoryListVC = vc as? QuintaPageViewController {
                self.navigationController!.popToViewController(inventoryListVC, animated: true)
            }
        })
    }
<<<<<<< Updated upstream
    @objc func backViewController(){
        let viewcontrollers = self.navigationController?.viewControllers
        
        viewcontrollers?.forEach({ (vc) in
            if  let inventoryListVC = vc as? BemvindosViewController {
                self.navigationController!.popToViewController(inventoryListVC, animated: true)
            }
        })
    }
    @objc func cancelarAcao(){
        
        let ac = UIAlertController(title: "Tem certeza?", message: "Cancelando você perderá todas as informações inseridas", preferredStyle: .alert)
        ac.view.tintColor = UIColor(named: "Ciano")
        ac.addAction(UIAlertAction(title: "Sim", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) in
            self.backViewController()
        }))
        ac.addAction(UIAlertAction(title: "Não", style: UIAlertAction.Style.cancel, handler: {(action:UIAlertAction!) in
            
            
        }))
        present(ac,animated: true)
    }
    
    @objc func acaoModelo1(){
        if !primeiroModelo.isSelected{
            primeiroModelo.setImage(UIImage(named: "modelo1Selected.png"), for: .normal)
            segundoModelo.setImage(UIImage(named: "modelo2.png"), for: .normal)
            segundoModelo.isSelected = false
            self.dictionary["Modelo"] = "Modelo 1 escolhido"
            print(dictionary)
            
            
        } else{
            primeiroModelo.setImage(UIImage(named: "modelo1.png"), for: .normal)
            
        }
        primeiroModelo.isSelected = !primeiroModelo.isSelected
        
    }
    
    @objc func acaoModelo2(){
        if !segundoModelo.isSelected{
            segundoModelo.setImage(UIImage(named: "modelo2Selected.png"), for: .normal)
            primeiroModelo.setImage(UIImage(named: "modelo1.png"), for: .normal)
            primeiroModelo.isSelected = false
            self.dictionary["Modelo"] = "Modelo 2 escolhido"
            print(dictionary)
        } else{
            segundoModelo.setImage(UIImage(named: "modelo2.png"), for: .normal)
            
        }
        segundoModelo.isSelected = !segundoModelo.isSelected
        
    }
<<<<<<< Updated upstream
=======
    @objc func shareAction() {
      // 1
      guard
        let title = flyerTextEntry.text,
        let body = bodyTextView.text,
        let contact = contactTextView.text,
        let email = emailTextView.text,
        let local = localTextView.text,
        let links = linksTextView.text

        else {
          // 2
          let alert = UIAlertController(title: "All Information Not Provided", message: "You must supply all information to create a flyer.", preferredStyle: .alert)
          alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
          present(alert, animated: true, completion: nil)
          return
      }
      
      // 3
      let pdfCreator = PDFCreator(title: title, body: body, contact: contact, email: email, local: local, links: links)
      let pdfData = pdfCreator.createFlyer()
      let vc = UIActivityViewController(activityItems: [pdfData], applicationActivities: [])
      present(vc, animated: true, completion: nil)
    }

>>>>>>> Stashed changes


=======
>>>>>>> Stashed changes
}

