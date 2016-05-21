//
//  ViewController.swift
//  testaki
//
//  Created by Alexandros Lykostratis on 16/03/16.
//  Copyright © 2016 Alexlykos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Hello, World!")
        
        
        midi.networkEnabled = true;
        
        print("Sources :" + String(midi.sources.count))
        
        print("Destinations:" + String(midi.destinations.count))
        
        
        for i in midi.sources
        {
            print("Source: " + String(i.name))
        }
        
        for i in midi.destinations
        {
            print("Destination: " + String(i.name))
        }
        
        
        let c = myclass()
        midi.delegate = c;
        
        // attach to all sources.
        //for source in midi.sources
        //{
        //    print("added delegate on higher priority thread")
        //    source.addDelegate(c)
        //}
        
        
        
    }
    
    
    
    
    
    let midi: PGMidi = PGMidi() //diavazei ola ta sources k destinations tou systimatos//

    
    
    
    func sendMidiNotes(note: Int)
    {
        // send some notes
        let date = NSDate()
        //srandom(UInt32(date.timeIntervalSince1970))
        //for i in 1...10{
        //let note = 60 + random() % 30
        
        var noteOn: [UInt8] = [0x90, UInt8(note), 127]
        let sizeOfNoteOn = UInt32(noteOn.count * sizeof(UInt8))
        var noteOff = [0x80, UInt8(note), 0]
        let sizeOfNoteOff = sizeOfNoteOn
        
        let sleepnote: Int = 1 + (random()%140)/100
        NSThread.sleepForTimeInterval(NSTimeInterval(sleepnote))
        midi.destinations[0].sendBytes(&noteOn, size: sizeOfNoteOn)
        NSThread.sleepForTimeInterval(0.8)
        midi.destinations[0].sendBytes(&noteOff, size: sizeOfNoteOn)
        //}
    }

    
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Kick_Pad(sender: UIButton) {
        // send kick MIDI note!!!
        var note: Int = 36 //middle C = 36
        sendMidiNotes(note)
        print("Kick Button was tapped")
    }
    
    @IBAction func Snare_Pad(sender: UIButton) {
        // send snare MIDI note!!!
        sendMidiNotes(38)
        print("Snare Button was tapped")
    }

    @IBAction func Hihat_Open_Pad(sender: UIButton) {
        // send hihat open MIDI note!!!
        sendMidiNotes(46)
        print("Hihat Open Button was tapped")
    }
    
    @IBAction func Hihat_Pad(sender: UIButton) {
        // send hihat MIDI note!!!
        sendMidiNotes(42)
        print("Hihat Button was tapped")
    }
    
    @IBAction func Tom1_Pad(sender: UIButton) {
        // send tom1 MIDI note!!!
        sendMidiNotes(48)
        print("Tom1 Button was tapped")
    }
    
    @IBAction func Tom2_Pad(sender: UIButton) {
        // send tom2 MIDI note!!!
        sendMidiNotes(47)
        print("Tom2 Button was tapped")
    }
    
    @IBAction func Tom3_Pad(sender: UIButton) {
        // send tom3 MIDI note!!!
        sendMidiNotes(43)
        print("Tom3 Button was tapped")
    }
    
    
}

class myclass: PGMidiSourceDelegate, PGMidiDelegate
{
    @objc func midiSource(input: PGMidiSource, midiReceived: UnsafePointer<MIDIPacketList>)
    {
        print("I am the delegate nice to meat you;)")
    }
    
    @objc func midi(midi: PGMidi!, destinationAdded destination: PGMidiDestination!) {
        
    }
    
    @objc func midi(midi: PGMidi!, destinationRemoved destination: PGMidiDestination!) {
        
    }
    
    @objc func midi(midi: PGMidi!, sourceAdded source: PGMidiSource!) {
        
    }
    
    @objc func midi(midi: PGMidi!, sourceRemoved source: PGMidiSource!) {
        
    }
}


//MARK: @IBAction func taskOne(sender: UIButton) {
            // do something
//MARK: }

//MARK: @IBAction func taskTwo(sender: UIButton) {
            // do something else
//MARK:}