//
//  LetraAViewController.h
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Felipe M Ramos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Alfabeto.h"
#import "Letra.h"

@interface LetraViewController : UIViewController<UITextFieldDelegate,UISearchBarDelegate>

@property Alfabeto *alfabeto;
@property Letra *letra;
@property int index;
@property UILabel *letraCaps;
@property UILabel *data;
@property UIImageView *iView;
@property BOOL iViewState;
@property CGFloat lastScale;
@property UITextField *palavra;
@property UIButton *botao,*imgBotao;
@property UIToolbar *toolBar;
@property UIDatePicker *datePicker;
@property NSDateFormatter *dateFormat;





-(void)hideContents;
-(void)ShowContents;


@end
