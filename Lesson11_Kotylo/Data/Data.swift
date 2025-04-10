//
//  DataStruct.swift
//  Lesson11_Kotylo
//
//  Created by Кирилл Котыло on 8.04.25.
//

import Foundation

struct Data {

    let columnOne = [
        CustomButton(ButtonEnum.Clear),
        CustomButton(ButtonEnum.Seven),
        CustomButton(ButtonEnum.Four),
        CustomButton(ButtonEnum.One),
        CustomButton(ButtonEnum.Culc)
    ]
    let columnTwo = [
        CustomButton(ButtonEnum.PlusMinus),
        CustomButton(ButtonEnum.Eight),
        CustomButton(ButtonEnum.Five),
        CustomButton(ButtonEnum.Two),
        CustomButton(ButtonEnum.Zero)
    ]
    let columnThree = [
        CustomButton(ButtonEnum.Percent),
        CustomButton(ButtonEnum.Nine),
        CustomButton(ButtonEnum.Six),
        CustomButton(ButtonEnum.Three),
        CustomButton(ButtonEnum.Point)
    ]
    let columnFour = [
        CustomButton(ButtonEnum.Divide),
        CustomButton(ButtonEnum.Multiply),
        CustomButton(ButtonEnum.Minus),
        CustomButton(ButtonEnum.Plus),
        CustomButton(ButtonEnum.Equal)
    ]
    
}
