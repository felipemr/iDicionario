//
//  Letra.h
//  Navigation
//
//  Created by Felipe Marques Ramos on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Letra : NSObject

@property NSString *letra,*palavra;
@property UIImage *img;


-(instancetype)initWithLetra:(NSString *)letra andPalavra:(NSString *)palavra;

@end
