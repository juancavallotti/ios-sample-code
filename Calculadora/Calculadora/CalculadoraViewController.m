//
//  CalculadoraViewController.m
//  Calculadora
//
//  Created by Juan Alberto López Cavallotti on 08/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculadoraViewController.h"
#import "ModeloCalculadora.h"


#pragma mark - Interfaz Privada

@interface CalculadoraViewController() {
    BOOL divisionPorCero;
}

@property (weak, nonatomic) IBOutlet UILabel *display;

@property (nonatomic,strong) ModeloCalculadora* modelo;

@end


#pragma mark - Implementacion

@implementation CalculadoraViewController

@synthesize display = _display;
@synthesize modelo = _modelo;

- (void) imprimirEntrada {
    if (divisionPorCero) {
        self.display.text = @"Error / 0";
        divisionPorCero = NO;
    } else {
        self.display.text = [NSString stringWithFormat:@"%.0f",self.modelo.entrada];
    }
}

- (void)viewDidUnload
{
    [self setDisplay:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (IBAction)numeroIngresado:(UIButton *)sender {
    
    int nro = [sender.titleLabel.text intValue];
    [self.modelo ingresarNumero:nro];
    
    [self imprimirEntrada];
}
- (IBAction)operacion:(UIButton *)sender {
    
    char caracter = [sender.titleLabel.text characterAtIndex:0];
    [self.modelo operar:caracter];
}
- (IBAction)igual:(id)sender {
    
    [self.modelo igual];
    [self imprimirEntrada];
}

- (IBAction)limpiar:(id)sender {
    [self.modelo limpiar];
    [self imprimirEntrada];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return NO;
}

#pragma mark - Conexion con el modelo

-(void)divisionPorCero {
    divisionPorCero = YES;
}

-(ModeloCalculadora *)modelo {
    if (!_modelo) {
        _modelo = [[ModeloCalculadora alloc] init];
        _modelo.delegate = self;
    }
    return _modelo;
}

@end
