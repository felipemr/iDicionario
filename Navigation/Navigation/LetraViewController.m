//
//  LetraAViewController.m
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Felipe M Ramos. All rights reserved.
//

#import "LetraViewController.h"

@implementation LetraViewController

@synthesize alfabeto,iView,botao,letraCaps,toolBar,palavra,letra,data,datePicker;

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
    data=[[UILabel alloc]initWithFrame:CGRectMake(self.view.center.x-150, self.view.center.y+30, 300, 150)];
    
    //setando as properties
    [botao setTitle:letra.palavra forState:UIControlStateNormal];
    [botao setFrame:CGRectMake(self.view.center.x, self.view.center.y+200, 0, 0)];
    [botao sizeToFit];
    
    
    
    _dateFormat=[[NSDateFormatter alloc]init];
    [_dateFormat setDateStyle:NSDateIntervalFormatterFullStyle];
    [_dateFormat setLocale:[NSLocale currentLocale]];
    
    [data setText:[NSString stringWithFormat:@"%@",[_dateFormat stringFromDate:letra.date]]];

    
    
    
    [iView setFrame:CGRectMake(self.view.center.x-125, self.view.center.y-175, 250, 0)];
    [iView.layer setBorderColor:cor.CGColor];
    [iView.layer setBorderWidth:2];
    iView.layer.masksToBounds=YES;
    iView.contentMode=UIViewContentModeScaleAspectFill;
    iView.layer.cornerRadius=125;
    
    
    [letraCaps setText:letra.letra];
    [letraCaps setFont:[UIFont fontWithName:@"Chalkduster" size:78]];
    [letraCaps setTextColor:[UIColor colorWithRed:.81 green:.89 blue:.73 alpha:1]];
    
    
    //toolBar
    toolBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, 45)];
    [toolBar setBackgroundColor:[UIColor blackColor]];
    
    UIBarButtonItem *edit=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editar)];
    UIBarButtonItem *eDate=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(changeDate)];
    UIBarButtonItem *search=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(search)];
    NSArray *barItens=@[edit,eDate,search];
    [toolBar setItems:barItens animated:YES];
    
    
    
    //uigestures
    UIPinchGestureRecognizer *pinchRecognizer=[[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinch:)];
    [self.view addGestureRecognizer:pinchRecognizer];
    
    
    
    [self hideContents];
    [self.view addSubview:botao];
    [self.view addSubview:iView];
    [self.view addSubview:letraCaps];
    [self.view addSubview:toolBar];
    [self.view addSubview:data];
}

 
-(void)viewWillAppear:(BOOL)animated{
    [UIView animateWithDuration:2 animations:^{
        [self ShowContents];
        [iView setFrame:CGRectMake(iView.frame.origin.x, iView.frame.origin.y+5, iView.frame.size.width, 150)];
//        iView.center=self.view.center;
    }];
}

#pragma mark - Selectors

-(void)editar{
    [botao setHidden:YES];
    palavra=[[UITextField alloc]initWithFrame:CGRectMake(self.view.center.x-50, 120, 100, 75)];
    palavra.delegate=self;
    [palavra setBackgroundColor:[UIColor greenColor]];
    palavra.text=botao.titleLabel.text;
//    palavra.center=self.view.center;
    [self.view addSubview:palavra];
    }

-(void)changeDate{
    [data setHidden:YES];
    datePicker=[[UIDatePicker alloc]initWithFrame:CGRectMake(self.view.center.x-150, self.view.center.y+25, 0, 0)];
    datePicker.datePickerMode=UIDatePickerModeDate;
    [self.view addSubview:datePicker];
}

-(void)search{
    UISearchBar *sBar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 109, self.view.bounds.size.width, 45)];
    [sBar setDelegate:self];
    [self.view addSubview:sBar];
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
    [palavra endEditing:YES];
    [botao setSelected:NO];
    
    
    [datePicker endEditing:YES];
    letra.date=[datePicker date];
    [data setText:[NSString stringWithFormat:@"%@",[_dateFormat stringFromDate:letra.date]]];
    [datePicker setHidden:YES];
    [data setHidden:NO];
    
    
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

#pragma - SearchBarDelegate

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    BOOL flag=NO;
    for (Letra *letter in alfabeto.arrayLetra) {
        if ([letter.palavra isEqualToString:searchBar.text]) {
            flag=YES;
            LetraViewController *achada=[[LetraViewController alloc]init];
            achada.letra=letter;
            [self.navigationController pushViewController:achada animated:YES];
        }
    }
    if (!flag) {
        [UIView animateKeyframesWithDuration:1 delay:0 options:UIViewKeyframeAnimationOptionAutoreverse | UIViewKeyframeAnimationOptionRepeat animations:^{
            [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.2 animations:^{
                searchBar.transform=CGAffineTransformMakeTranslation(5, 0);
            }];
            [UIView addKeyframeWithRelativeStartTime:0.2 relativeDuration:0.2 animations:^{
                searchBar.transform=CGAffineTransformMakeTranslation(-5, 0);
            }];
            [UIView addKeyframeWithRelativeStartTime:0.4 relativeDuration:0.2 animations:^{
                searchBar.transform=CGAffineTransformMakeTranslation(0, 0);
            }];
        } completion:nil];
        
    }
    
}
@end
