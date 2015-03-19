//
//  LetraAViewController.m
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Felipe M Ramos. All rights reserved.
//

#import "LetraViewController.h"

@implementation LetraViewController

@synthesize alfabeto,iView,botao,letraCaps,toolBar,palavra,letra;

#pragma viewDelegate methods
-(void) viewDidLoad {
    [super viewDidLoad];
    //instacia do alfabeto e da Letra da View
    alfabeto=[Alfabeto instancia];
    letra=alfabeto.arrayLetra[self.index];
    
    
    self.navigationController.tabBarItem.title=[NSString stringWithFormat:@"%@",letra.letra];

    
    //config de nav bar
    self.title = letra.letra;
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    
    
    //init de properties
    UIImage *ima=[UIImage imageNamed:@"skywalk11.jpg"];
    iView=[[UIImageView alloc]initWithImage:ima];
    UIColor *cor=[UIColor colorWithRed:0.25 green:.25 blue:.25 alpha:1] ;
    
    
    botao = [UIButton buttonWithType:UIButtonTypeSystem];
    letraCaps=[[UILabel alloc]initWithFrame:CGRectMake(50, 180, 60, 75)];
    
    
    //setando as properties
    [botao setTitle:letra.palavra forState:UIControlStateNormal];
    [botao setFrame:CGRectMake(self.view.center.x, self.view.center.y+200, 0, 0)];
    [botao sizeToFit];
//    botao.center = self.view.center;
    
    
    
    [iView setFrame:CGRectMake(self.view.center.x-125, self.view.center.y-150, 250, 0)];
    [iView.layer setBorderColor:cor.CGColor];
    [iView.layer setBorderWidth:2];
    iView.layer.masksToBounds=YES;
    iView.contentMode=UIViewContentModeScaleAspectFill;
    iView.layer.cornerRadius=125;
    
    
    [letraCaps setText:letra.letra];
    [letraCaps setFont:[UIFont fontWithName:@"Chalkduster" size:78]];
    [letraCaps setTextColor:[UIColor colorWithRed:.81 green:.89 blue:.73 alpha:1]];
    
    
    //toolBar
    toolBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 65, self.view.bounds.size.width, 45)];
    [toolBar setBackgroundColor:[UIColor blackColor]];
    UIBarButtonItem *edit=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editar)];
    NSArray *barItens=@[edit];
    [toolBar setItems:barItens animated:YES];
    
    
    //uigestures
    UIPinchGestureRecognizer *pinchRecognizer=[[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinch:)];
    [self.view addGestureRecognizer:pinchRecognizer];
    
    
    
    [self hideContents];
    [self.view addSubview:botao];
    [self.view addSubview:iView];
    [self.view addSubview:letraCaps];
    [self.view addSubview:toolBar];
}

 
-(void)viewWillAppear:(BOOL)animated{
    [UIView animateWithDuration:2 animations:^{
        [self ShowContents];
        [iView setFrame:CGRectMake(iView.frame.origin.x, iView.frame.origin.y, iView.frame.size.width, 150)];
        iView.center=self.view.center;
    }];
}

#pragma mark - UItextField

-(void)editar{
    [botao setHidden:YES];
    palavra=[[UITextField alloc]initWithFrame:CGRectMake(50, 75, 60, 75)];
    palavra.delegate=self;
    [palavra setBackgroundColor:[UIColor greenColor]];
    palavra.text=botao.titleLabel.text;
    palavra.center=self.view.center;
    [self.view addSubview:palavra];
    }

-(void)textFieldDidEndEditing:(UITextField *)textField{
    [palavra removeFromSuperview];
    NSString *newPalavra=textField.text;
    [letra setPalavra:newPalavra];
    [botao setTitle:newPalavra forState:UIControlStateNormal];
    [botao.titleLabel sizeToFit];
    [botao sizeToFit];
    [botao setHidden:NO];
}

#pragma nav controls
-(void)next:(id)sender {
    [UIView animateWithDuration:1 animations:^{
        [self hideContents];
        
    } completion:^(BOOL finished) {
        LetraViewController *proximo =[[LetraViewController alloc]init];
        proximo.index=self.index+1;//bug curioso ao colocar index++
        if (proximo.index>=alfabeto.arrayLetra.count) {
            [self.navigationController popToRootViewControllerAnimated:YES];//manda pra primeira view
        }
        
        [self.navigationController pushViewController:proximo animated:YES];
    }];
    
    
}

#pragma selectors
-(void)pinch:(id)sender{
    UIPinchGestureRecognizer *pinch=sender;
    
//    if([(pinch state] == UIGestureRecognizerStateBegan) {
//        _lastScale = 1.0;
//    }
//    CGFloat scale = 1.0 - (_lastScale - pinch.scale);

    if (_iViewState) {
        [UIView animateWithDuration:0 animations:^{
            iView.transform=CGAffineTransformMakeScale(pinch.scale, pinch.scale);
        }];
    }
    
//    if (pinch.state == UIGestureRecognizerStateEnded) {
//        _lastScale=scale;
//        [iView setFrame:CGRectMake(iView.frame.origin.x, iView.frame.origin.y, iView.frame.size.width*scale, iView.frame.size.height*scale)];
//    }
}


#pragma Class Methods

-(void)hideContents{
    letraCaps.alpha=0;
    botao.alpha=0;
    iView.alpha=0;
    toolBar.alpha=0;
}
-(void)ShowContents{
    letraCaps.alpha=1;
    botao.alpha=1;
    iView.alpha=1;
    toolBar.alpha=1;
}

#pragma Touch Events
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [palavra endEditing:YES];
    [botao setSelected:NO];
    UITouch *toque=[touches anyObject];//objeto toque
    CGPoint localToque=[toque locationInView:self.view];//local onde estamos tocando
    if (CGRectContainsPoint(iView.frame, localToque)) {
        _iViewState=YES;
        
    }
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *toque=[touches anyObject];//objeto toque
    CGPoint localToque=[toque locationInView:self.view];//local onde estamos tocando
    
    if (_iViewState) {
        [UIView animateWithDuration:0 animations:^{
            iView.transform=CGAffineTransformMakeTranslation(localToque.x-iView.center.x, localToque.y-iView.center.y);
        } ];
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    _iViewState=NO;
}
@end
