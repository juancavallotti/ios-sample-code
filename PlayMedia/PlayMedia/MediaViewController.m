//
//  MediaViewController.m
//  PlayMedia
//
//  Created by Juan Alberto López Cavallotti on 15/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MediaViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <QuartzCore/QuartzCore.h>

@interface MediaViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) UIImage* selectedImage;

-(void) tomarFoto;
-(void) aplicarEfecto;
@end

@implementation MediaViewController
@synthesize imageView = _imageView;
@synthesize selectedImage = _selectedImage;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setImageView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

//boton de acciones.
- (IBAction)actionsButton:(UIBarButtonItem *)sender {
    
    //crear un action sheet
    UIActionSheet *as = [[UIActionSheet alloc] initWithTitle:@"Fotos!" 
                                                    delegate:self 
                                           cancelButtonTitle:@"Cancelar" 
                                      destructiveButtonTitle:nil 
                                           otherButtonTitles:@"Buscar Foto", 
                         @"Aplicar Efecto",
                         nil];
    
    //[as showInView:self.view];
    [as showFromTabBar:self.tabBarController.tabBar];
}


//Implementacion de las acciones del action sheet.
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //NSLog(@"Indice: %d", buttonIndex);
    
    if (buttonIndex == actionSheet.cancelButtonIndex) {
        //cancelado
        return;
    }
    
    switch (buttonIndex) {
        case 0:
            [self tomarFoto];
            break;
        case 1:
            [self aplicarEfecto];
            break;
        default:
            break;
    }
}

-(void) tomarFoto {
    NSLog(@"Tomar foto!!");
    
    //checkear que este disponible, gralmente la biblioteca de fotos lo esta.
    BOOL disponible = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary];
    
    if (!disponible) {
        NSLog(@"La biblioteca de fotos no se encuentra disponible");
        return;
    }
    
    //crear el image picker controller.
    UIImagePickerController* pickerController = [[UIImagePickerController alloc] init];
    
    //esta clase recibe los resultados
    pickerController.delegate = self;
    
    //definir que es de tipo biblioteca de fotos
    pickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    //definir que queremos solo imagenes, no video.
    NSString *mediaType = (NSString *) kUTTypeImage;
    pickerController.mediaTypes = [NSArray arrayWithObject:mediaType];
    
    //permitir edicion luego de seleccionar la foto.
    //pickerController.allowsEditing = YES;
    
    //presentarlo!
    //[self presentModalViewController:pickerController animated:YES];
    [self.tabBarController presentModalViewController:pickerController animated:YES];
}

//configurar la imagen para que se muestre en la pantalla.
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    self.imageView.image = image;
    self.selectedImage = image;
    
    //[self dismissModalViewControllerAnimated:YES];
    [self.tabBarController dismissModalViewControllerAnimated:YES];
}

-(void) aplicarEfecto {
    //NSLog(@"Aplicar efecto!!");
    
    if (!self.selectedImage) {
        NSLog(@"No hay imagen!!");
    }
    
    //listar los filtros para una determinada categoria.
    NSArray* array = [CIFilter filterNamesInCategory:kCICategoryStylize];
    for (NSString* str in array) {
        NSLog(@"%@", str);
    }
    
    
    //convertir la imagen a core image
    NSData* data = UIImagePNGRepresentation(self.selectedImage);
    CIImage *imagen = [CIImage imageWithData:data];
    
    
    //configurar uno de los filtros.
    
    //filtro de sepia
//    CIFilter* filter = [CIFilter filterWithName:@"CISepiaTone" 
//                                  keysAndValues:kCIInputImageKey, imagen
//                        ,@"inputIntensity", [NSNumber numberWithFloat:0.9]
//                        , nil];
    CIFilter* filter = [CIFilter filterWithName:@"CIColorInvert"
                                  keysAndValues:kCIInputImageKey, imagen
                        //,@"inputScale", [NSNumber numberWithFloat:4.0]
                        , nil];

    
    //aplicar el filtro a la imagen
    CIImage* imagenSalida = [filter outputImage];
    
    //obtener un contexto de core image
    CIContext *context = [CIContext contextWithOptions:nil];
    
    //convertir la imagen de salida a UIImage
    CGImageRef ref = [context createCGImage:imagenSalida fromRect:[imagen extent]];
    UIImage* imgSal = [UIImage imageWithCGImage:ref];
    self.imageView.image = imgSal;
    
    CGImageRelease(ref);
    
}

@end
