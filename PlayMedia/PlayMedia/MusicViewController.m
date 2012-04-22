//
//  MusicViewController.m
//  PlayMedia
//
//  Created by Juan Alberto López Cavallotti on 15/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MusicViewController.h"


@interface MusicViewController ()

@property (nonatomic, strong) MPMusicPlayerController* musicPlayer;

-(void) playMusicForArtist:(NSString*) artist;
-(void) updatePlaybackInfo;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistLabel;

@end

@implementation MusicViewController
@synthesize titleLabel = _titleLabel;
@synthesize artistLabel = _artistLabel;
@synthesize musicPlayer = _musicPlayer;

-(MPMusicPlayerController *)musicPlayer {
    if (!_musicPlayer) {
        _musicPlayer = [MPMusicPlayerController applicationMusicPlayer];
        [_musicPlayer setQueueWithQuery:[MPMediaQuery songsQuery]];
    }
    return _musicPlayer;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setTitleLabel:nil];
    [self setArtistLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField 
{
    [textField resignFirstResponder];
    [self playMusicForArtist:textField.text];
    return YES;
}

-(void)updatePlaybackInfo 
{
    MPMediaItem *currentlyPlaying = self.musicPlayer.nowPlayingItem;
    self.artistLabel.text = [currentlyPlaying valueForKey:MPMediaItemPropertyArtist];
    self.titleLabel.text = [currentlyPlaying valueForKey:MPMediaItemPropertyTitle];
}

-(IBAction)playMusic:(id)sender 
{
    [self.musicPlayer play];
    [self updatePlaybackInfo];
}

-(IBAction)stopMusic:(id)sender 
{
    [self.musicPlayer stop];
    [self updatePlaybackInfo];
}

-(IBAction)prev:(id)sender
{
    [self.musicPlayer skipToPreviousItem];
    [self updatePlaybackInfo];
}

-(IBAction)next:(id)sender
{
    [self.musicPlayer skipToNextItem];
    [self updatePlaybackInfo];
}

-(IBAction)pickMusic:(id)sender
{
    MPMediaPickerController *mpc = [[MPMediaPickerController alloc] initWithMediaTypes:MPMediaTypeMusic];
    mpc.delegate = self;
    mpc.allowsPickingMultipleItems = YES;
    
    [self.tabBarController presentModalViewController:mpc animated:YES];
}


-(void)mediaPicker:(MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection 
{
    //configurar el reproductor con los items seleccionados.
    [self.musicPlayer setQueueWithItemCollection:mediaItemCollection];
    //reproducir lo nuevo
    [self playMusic:nil];
    [self.tabBarController dismissModalViewControllerAnimated:YES];
}


-(void)playMusicForArtist:(NSString *)artist 
{
    //configurar el predicado de busqueda.
    MPMediaPropertyPredicate *pred = [MPMediaPropertyPredicate predicateWithValue:artist forProperty:MPMediaItemPropertyArtist comparisonType:MPMediaPredicateComparisonContains];
    
    //configurar un conjunto de predicados
    NSSet* filters = [NSSet setWithObject:pred];
    
    //realizar la consulta.
    MPMediaQuery *query = [[MPMediaQuery alloc] initWithFilterPredicates:filters];
    
    //configurar el reproductor
    [self.musicPlayer setQueueWithQuery:query];
    
    //reproducir lo nuevo
    [self playMusic:nil];
}
@end
