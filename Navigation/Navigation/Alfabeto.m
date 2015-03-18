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
    
    Letra *a = [[Letra alloc]initWithLetra:@"A" andPalavra:@"Arroz"];
    Letra *b = [[Letra alloc]initWithLetra:@"B" andPalavra:@"Bacon"];
    Letra *c = [[Letra alloc]initWithLetra:@"C" andPalavra:@"Cupcake"];
    Letra *d = [[Letra alloc]initWithLetra:@"D" andPalavra:@"Dijon"];
    Letra *e = [[Letra alloc]initWithLetra:@"E" andPalavra:@"Erva"];//eclair/estragao
    Letra *f = [[Letra alloc]initWithLetra:@"F" andPalavra:@"Felipe"];//farinha
    Letra *g = [[Letra alloc]initWithLetra:@"G" andPalavra:@"Guarana"];
    Letra *h = [[Letra alloc]initWithLetra:@"H" andPalavra:@"Homus"];
    Letra *i = [[Letra alloc]initWithLetra:@"I" andPalavra:@"Ima"];
    Letra *j = [[Letra alloc]initWithLetra:@"J" andPalavra:@"Java"];
    Letra *l = [[Letra alloc]initWithLetra:@"L" andPalavra:@"Louro"];
    Letra *m = [[Letra alloc]initWithLetra:@"M" andPalavra:@"Macaron"];
    Letra *n = [[Letra alloc]initWithLetra:@"N" andPalavra:@"Nori"];//niguiri/noodles
    Letra *o = [[Letra alloc]initWithLetra:@"O" andPalavra:@"Ovos"];
    Letra *p = [[Letra alloc]initWithLetra:@"P" andPalavra:@"Pão"];
    Letra *q = [[Letra alloc]initWithLetra:@"Q" andPalavra:@"Queijo"];
    Letra *r = [[Letra alloc]initWithLetra:@"R" andPalavra:@"Ratatouille"];
    Letra *s = [[Letra alloc]initWithLetra:@"S" andPalavra:@"Salada"];
    Letra *t = [[Letra alloc]initWithLetra:@"T" andPalavra:@"Trufa"];
    Letra *u = [[Letra alloc]initWithLetra:@"U" andPalavra:@"Udon"];
    Letra *v = [[Letra alloc]initWithLetra:@"V" andPalavra:@"Vinagrete"];
    Letra *x = [[Letra alloc]initWithLetra:@"X" andPalavra:@"Xerem"];
    Letra *z = [[Letra alloc]initWithLetra:@"Z" andPalavra:@"Zabaione"];
    
    [arrayLetra addObjectsFromArray:[NSArray arrayWithObjects:a,b,c,d,e,f,g,h,i,j,l,m,n,o,p,q,r,s,t,u,v,x,z, nil]];
    
    return self;
}


@end
