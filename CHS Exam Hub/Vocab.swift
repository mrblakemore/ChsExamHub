//
//  Vocab.swift
//  
//
//  Created by Robby Blakemore on 12/6/17.
//

import Foundation


struct Vocab
{
    var word : String
    var definition : String
    var pos :  PartOfSpeech
    
    init(w: String, d: String, p: PartOfSpeech)
    {
        word = w
        definition = d
        pos = p
    }
    
    func getWord() -> String{
        return word
    }
    
    func getDefinition() -> String{
        return definition
    }
    
    func getPos() -> PartOfSpeech{
        return pos
    }
    
}

enum PartOfSpeech {
    case noun, verb, adjective
    
}
