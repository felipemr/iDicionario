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
    
    Letra *a = [[Letra alloc]initWithLetra:@"a" andPalavra:@"Amor"];
    Letra *b = [[Letra alloc]initWithLetra:@"b" andPalavra:@"Bola"];
    Letra *c = [[Letra alloc]initWithLetra:@"c" andPalavra:@"Celular"];
    Letra *d = [[Letra alloc]initWithLetra:@"d" andPalavra:@"Dado"];
    Letra *e = [[Letra alloc]initWithLetra:@"e" andPalavra:@"Elefante"];
    Letra *f = [[Letra alloc]initWithLetra:@"f" andPalavra:@"Felipe"];
    Letra *g = [[Letra alloc]initWithLetra:@"g" andPalavra:@"Gato"];
    Letra *h = [[Letra alloc]initWithLetra:@"h" andPalavra:@"Hotel"];
    Letra *i = [[Letra alloc]initWithLetra:@"i" andPalavra:@"Ima"];
    Letra *j = [[Letra alloc]initWithLetra:@"j" andPalavra:@"Java"];
    Letra *l = [[Letra alloc]initWithLetra:@"l" andPalavra:@"lapis"];
    Letra *m = [[Letra alloc]initWithLetra:@"m" andPalavra:@"Moqueca"];
    Letra *n = [[Letra alloc]initWithLetra:@"n" andPalavra:@"Navio"];
    Letra *o = [[Letra alloc]initWithLetra:@"o" andPalavra:@"Orelhão"];
    Letra *p = [[Letra alloc]initWithLetra:@"p" andPalavra:@"Pato"];
    Letra *q = [[Letra alloc]initWithLetra:@"q" andPalavra:@"Queijo"];
    Letra *r = [[Letra alloc]initWithLetra:@"r" andPalavra:@"Rato"];
    Letra *s = [[Letra alloc]initWithLetra:@"s" andPalavra:@"sapo"];
    Letra *t = [[Letra alloc]initWithLetra:@"t" andPalavra:@"Tatu"];
    Letra *u = [[Letra alloc]initWithLetra:@"u" andPalavra:@"uva"];
    Letra *v = [[Letra alloc]initWithLetra:@"v" andPalavra:@"vaca"];
    Letra *x = [[Letra alloc]initWithLetra:@"x" andPalavra:@"xadrez"];
    Letra *z = [[Letra alloc]initWithLetra:@"z" andPalavra:@"zebra"];
    
    [arrayLetra addObjectsFromArray:[NSArray arrayWithObjects:a,b,c,d,e,f,g,h,i,j,l,m,n,o,p,q,r,s,t,u,v,x,z, nil]];
    
    return self;
}


@end
