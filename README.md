# PDFReader-Mac Application

This sample shows a issue of [Apple PDFKit](https://developer.apple.com/documentation/pdfkit) when making changes to PDF files. 

## Overview

This example has a Highlight text feature, select a text, tap "Highlight" on Touch Bar, changes will automatically save.

## Issue 

`PDFDocument.write(toFile:)` ([document](https://developer.apple.com/documentation/pdfkit/pdfdocument/1436086-write)) breaks vertical writting PDF documents. 

## Steps to reproduce

Find a vertical writting PDF document that text can select vertically. 

Download the [example doucment](https://tatsu-zine.com/samples/aozora/wagahaiwa_nekodearu.pdf).

Check if document text can be select vertically. 

![select_vertically](https://i.imgur.com/5CTxYO2.png)

Open this document in PDFReader-Mac.

Select a text, tap "Hightlight" on Touch Bar. 

Close and open file again.

You can see vertical text selection is broken. 

![broken](https://i.imgur.com/7YacQIp.png)
