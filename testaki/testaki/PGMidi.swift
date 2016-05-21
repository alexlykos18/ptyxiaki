//
//  main.swift
//  pgtests
//
//  Created by Orestis on 21/02/2015.
//  Copyright (c) 2015 Horsehead. All rights reserved.
//

import Foundation
import "testaki-Bridging-Header.h"

// Do MIDI Processing Here
// Also Delegate for Midi Events such as destination added
// Do MIDI Processing Here
// Also Delegate for Midi Events such as destination added

// Do MIDI Processing Here
// Also Delegate for Midi Events such as destination added
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


print("Hello, World!")

let midi: PGMidi = PGMidi() //diavazei ola ta sources k destinations tou systimatos//

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


var c = myclass()
midi.delegate = c;

// attach to all sources.
for source in midi.sources
{
    print("added delegate on higher priority thread")
    source.addDelegate(c)
}

while(true){}

func sendRandomNotesToAll()
{
    // send some notes
    let date = NSDate()
    srandom(UInt32(date.timeIntervalSince1970))
    for i in 1...10
    {
        let note = 60 + random() % 30
        
        var noteOn: [UInt8] = [0x90, UInt8(note), 127]
        let sizeOfNoteOn = UInt32(noteOn.count * sizeof(uint8))
        var noteOff = [0x80, UInt8(note), 0]
        let sizeOfNoteOff = sizeOfNoteOn
        
        var sleepnote: Int = 1 + (random()%140)/100
        NSThread.sleepForTimeInterval(NSTimeInterval(sleepnote))
        midi.destinations[0].sendBytes(&noteOn, size: sizeOfNoteOn)
        NSThread.sleepForTimeInterval(0.8)
        midi.destinations[0].sendBytes(&noteOff, size: sizeOfNoteOn)
    }
}




