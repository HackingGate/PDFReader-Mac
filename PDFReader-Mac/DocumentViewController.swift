//
//  DocumentViewController.swift
//  PDFReader-Mac
//
//  Created by ERU on 2018/06/06.
//  Copyright © 2018 HackingGate. All rights reserved.
//

import Cocoa
import Quartz

class DocumentViewController: NSViewController {
    var documentURL: URL?
    @IBOutlet weak var pdfView: PDFView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let documentURL = documentURL {
            let pdfDocument = PDFDocument(url: documentURL)
            pdfView.document = pdfDocument
            
            title = documentURL.lastPathComponent
        }
        
        
    }
    
    @IBAction func highlight(_ sender: NSButton) {
        let selections = pdfView.currentSelection?.selectionsByLine()
        
        selections?.forEach({ selection in
            guard let page = selection.pages.first else { return }
            let highlight = PDFAnnotation(bounds: selection.bounds(for: page), forType: .highlight, withProperties: nil)
            page.addAnnotation(highlight)
        })
        
        // save the document
        writeFile()
    }
    
    func writeFile() {
        if let documentURL = documentURL {
            pdfView.document?.write(toFile: documentURL.path)
        }
    }
}
