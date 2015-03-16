//
//  Letra.m
//  Navigation
//
//  Created by Felipe Marques Ramos on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "Letra.h"

@implementation Letra

@synthesize palavra;

-(instancetype)initWithLetra:(NSString *)letra andPalavra:(NSString *)palavrinha{
    self=[super init];
    
    self.letra=letra;
    self.palavra=palavrinha;
    
    return self;
}

@end
