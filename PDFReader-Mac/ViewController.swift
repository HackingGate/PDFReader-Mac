//
//  ViewController.swift
//  PDFReader-Mac
//
//  Created by ERU on 2018/06/06.
//  Copyright © 2018 HackingGate. All rights reserved.
//

import Cocoa

protocol PDFDocumentDelegate {
    var documentURL: URL? { get set }
}

class ViewController: NSViewController {
    
    let showPDFViewSegue = NSStoryboardSegue.Identifier(rawValue: "ShowPDFView")
    
    var documentURL: URL? {
        didSet {
            performSegue(withIdentifier: showPDFViewSegue, sender: nil)
        }
    }

    @IBOutlet var dragAndDropView: DragAndDropView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dragAndDropView.delegate = self
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if segue.identifier == showPDFViewSegue {
            if let documentVC = segue.destinationController as? DocumentViewController {
                documentVC.documentURL = self.documentURL
            }
        }
    }

}

extension ViewController: PDFDocumentDelegate {

}

