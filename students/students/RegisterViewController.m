#import "RegisterViewController.h"
#import "ViewController.h"


@interface RegisterViewController ()<UITextFieldDelegate>
@property NSInteger a ;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bizhi.jpeg"]];
    
    _imageview1 = [[UITextField alloc]initWithFrame:CGRectMake(40, 300, 300, 50)];
    _imageview2 = [[UITextField alloc]initWithFrame:CGRectMake(40,380 , 300, 50)];
    _imageview3 = [[UITextField alloc]initWithFrame:CGRectMake(40,460, 300, 50)];
    _imageview1.leftViewMode = UITextFieldViewModeAlways;
    _imageview2.leftViewMode = UITextFieldViewModeAlways;
    _imageview3.leftViewMode = UITextFieldViewModeAlways;
    
    _imageview1.backgroundColor = [UIColor whiteColor];
    _imageview2.backgroundColor = [UIColor whiteColor];
    _imageview3.backgroundColor = [UIColor whiteColor];
    
    _imageview1.delegate = self;
    _imageview2.delegate = self;
    _imageview3.delegate = self;
    [self.view addSubview:_imageview1];
    [self.view addSubview:_imageview2];
    [self.view addSubview:_imageview3];
    // lableview.backgroundColor = [UIColor redColor]
    UIButton *zhucebutton = [[UIButton alloc]initWithFrame:CGRectMake(100, 530, 200, 50)];
    [zhucebutton setTitle:@"注册完成" forState:UIControlStateNormal];
    
    zhucebutton.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    [self.view addSubview:zhucebutton];
    [zhucebutton addTarget:self action:@selector(zhuce) forControlEvents:UIControlEventTouchUpInside];

    _imageview1.tag = 1;
    _imageview2.tag = 2;
    _imageview3.tag = 3;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{           _a = textField.tag;
    self.view.frame = CGRectMake(0, -150, self.view.frame.size.width, self.view.frame.size.height) ;
    return YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{   if(_a == textField.tag)
    self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) ;
else{
    
}
    return YES;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_imageview1 resignFirstResponder];
    [_imageview2 resignFirstResponder];
    [_imageview3 resignFirstResponder];
}
-(void)zhuce
{
    [self.delegate put:_imageview2.text and: _imageview3.text];
    [self dismissViewControllerAnimated:YES completion:nil];
//    [self.navigationController popViewControllerAnimated:YES];
}
@end
