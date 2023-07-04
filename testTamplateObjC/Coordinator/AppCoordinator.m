//
//  AppCoordinator.m
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 04.07.2023.
//

#import "AppCoordinator.h"
#import "DownloadMapsTableVC.h"
#import "RegionMapsTableVC.h"
#import "MapsDownloadService.h"

@interface AppCoordinator ()

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) MapsDownloadService *downloadManager;

@end


@implementation AppCoordinator

- (nonnull id)initWithWindow:(nonnull UIWindow *)window {
    self = [super init];
    if (self) {
        self.window = window;
    }
    return self;
}

- (void)start {
    DownloadMapsTableViewController *rootVC = DownloadMapsTableViewController.instatiate;
    
    XMLParser *parser = [[XMLParser alloc] init];
    MapsFileManager *mapsFileManager = [[MapsFileManager alloc] init];
    MapsDownloadService *downloadManager = [[MapsDownloadService alloc] init];
    
    DownloadMapsViewModel *viewModel = [[DownloadMapsViewModel alloc] initWithParser:parser fileManager:mapsFileManager downloadManager:downloadManager];
    
    viewModel.coordinator = self;
    rootVC.viewModel = viewModel;
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:rootVC];
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
}

- (void)goToRegion:(nonnull Region *)region {
    RegionMapsTableViewController *newVC = [RegionMapsTableViewController instatiate];
    MapsFileManager *mapsFileManager = [[MapsFileManager alloc] init];
    RegionMapsViewModel *regionMapsViewModel = [[RegionMapsViewModel alloc] initWithRegion:region fileManager:mapsFileManager downloadManager:self.downloadManager];
    newVC.viewModel = regionMapsViewModel;
    [self.navigationController pushViewController:newVC animated:false];
}
        
@end
