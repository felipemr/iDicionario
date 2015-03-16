//
//  Alfabeto.m
//  Navigation
//
//  Created by Felipe Marques Ramos on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "Alfabeto.h"

@implementation Alfabeto
@synthesize arrayLetra;

static Alfabeto *alfabeto=nil;

+(Alfabeto *)instancia{
    if (alfabeto==nil) {
        alfabeto=[[Alfabeto alloc]init];
    }
    return alfabeto;
}

-(instancetype)init{
    self=[super init];
    
    arrayLetra=[[NSMutableArray alloc]init];
    
    Letra *a = [[Letra alloc]initWithLetra:@"a" andPalavra:@"amor"];
    Letra *b = [[Letra alloc]initWithLetra:@"b" andPalavra:@"bola"];
    Letra *c = [[Letra alloc]initWithLetra:@"c" andPalavra:@"celular"];
    
    [arrayLetra addObjectsFromArray:[NSArray arrayWithObjects:a,b,c, nil]];
    
    return self;
}


@end
