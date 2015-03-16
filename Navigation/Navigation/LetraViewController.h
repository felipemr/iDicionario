//
//  LetraAViewController.h
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Alfabeto.h"
#import "Letra.h"

@interface LetraViewController : UIViewController

@property Alfabeto *alfabeto;
@property int index;
@property UIImageView *img;
@property UIButton *but;

@end
