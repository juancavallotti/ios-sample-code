//
//  ContactosModelo.m
//  FilesPractice
//
//  Created by Juan Alberto López Cavallotti on 02/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ContactosModelo.h"

//interfaz privada

@interface ContactosModelo ()

@property (nonatomic, strong) NSMutableDictionary* datos;
@property (nonatomic, strong) NSURL* urlArchivo;

@end


//implementacion

@implementation ContactosModelo

@synthesize datos = _datos, urlArchivo = _urlArchivo;


#pragma mark - gestion del archivo de datos.
-(void) iniciarArchivo {
    
    //obtener el file manager
    NSFileManager* mgr = [NSFileManager defaultManager];
    
    //obtener el directorio de application support y si no existe crearlo
    NSError* err = nil;
    
    NSURL* url = [mgr URLForDirectory:NSApplicationSupportDirectory
                             inDomain:NSUserDomainMask 
                    appropriateForURL:nil 
                               create:YES 
                                error:&err];
    if (err) {
        NSLog(@"Error al leer el archivo de datos");
    }
    
    //crear la url del archivo de datos
    url = [url URLByAppendingPathComponent:@"datos.xml"];
    
    //leer los archivos en un diccionario mutable
    self.datos = [NSMutableDictionary dictionaryWithContentsOfURL:url];
    
    //no se pudo cargar el archivo
    if (!self.datos) {
        self.datos = [[NSMutableDictionary alloc] init];
    }
    
    //ta todo bien entonces guardamos la url del archivo
    self.urlArchivo = url;
}


-(void) almacenarArchivo {
    BOOL resultado = [self.datos writeToURL:self.urlArchivo atomically:NO];
    
    if (!resultado) {
        NSLog(@"No pude guardar el archivo de datos");
    }
    
}

#pragma mark - Inicializacion

- (id)init
{
    self = [super init];
    if (self) {
        [self iniciarArchivo];
    }
    return self;
}

#pragma mark - Operaciones con el modelo


-(BOOL) agregarContacto:(NSString *) nombre conNacimiento:(NSDate *) nacimiento {
    
    //podemos validar y retornar NO
    
    [self.datos setObject:nacimiento forKey:nombre];
    [self almacenarArchivo];
    return YES;
}


-(BOOL) eliminarContacto:(NSString *) nombre {
    
    //podemos validar y retornar NO
    
    [self.datos removeObjectForKey:nombre];
    [self almacenarArchivo];
    return YES;
}

-(NSDictionary *) listaContactos {
    //no queremos que modifiquen los datos por lo que 
    //devolvemos la copia no mutable
    return [self.datos copy];
}

@end
