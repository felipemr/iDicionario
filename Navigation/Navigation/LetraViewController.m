//
//  LetraAViewController.m
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "LetraViewController.h"

@implementation LetraViewController

@synthesize alfabeto;

-(void) viewDidLoad {
    [super viewDidLoad];
    alfabeto=[Alfabeto instancia];
    Letra *l=alfabeto.arrayLetra[self.index];
    self.title = l.letra;
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    
    UIButton *botao = [UIButton
                                        buttonWithType:UIButtonTypeSystem];
    [botao
     setTitle:l.palavra
     forState:UIControlStateNormal];
    [botao sizeToFit];
    botao.center = self.view.center;
    UIImage *ima=[UIImage imageNamed:@"skywalk11.jpg"];
    UIImageView *Iview=[[UIImageView alloc] init];
    [Iview setFrame:CGRectMake(self.view.center.x-75, self.view.center.y-120, 150, 100)];
    [Iview setBackgroundColor:[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1]];
    [Iview setImage:ima];
    _img=Iview;
    _but=botao;
    _but.alpha=0;
    [self.view addSubview:_but];
    _img.alpha=0.0;
    [self.view addSubview:_img];
 
}

-(void)viewWillAppear:(BOOL)animated{
    [UIView animateWithDuration:2 animations:^{
        _img.alpha=1;
        _but.alpha=1;
    }];
}


-(void)next:(id)sender {
    [UIView animateWithDuration:1 animations:^{
        _img.alpha=0;
        _but.alpha=0;
        
    } completion:^(BOOL finished) {
        LetraViewController *proximo =[[LetraViewController alloc]init];
        proximo.index=self.index+1;
        if (proximo.index>=alfabeto.arrayLetra.count) {
            
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
        
        [self.navigationController pushViewController:proximo animated:YES];
    }];
    
    
}




@end
