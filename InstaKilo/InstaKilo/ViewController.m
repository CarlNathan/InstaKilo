//
//  ViewController.m
//  InstaKilo
//
//  Created by Carl Udren on 1/27/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "ViewController.h"
#import "aCollectionViewCell.h"
#import "HeaderCollectionReusableView.h"
#import "DataModel.h"

@interface ViewController () <UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) UICollectionViewFlowLayout *layoutAll;
@property (strong, nonatomic) UISegmentedControl *segmentControl;
@property (strong, nonatomic) DataModel *dataModel;
@property (strong, nonatomic) NSArray *sectionKeys;
@property (strong, nonatomic) NSArray *keys;
@property (strong, nonatomic) NSDictionary *imageDictionary;
//@property (strong, nonatomic) NSArray *location

@end

@implementation ViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //add photos
    
    self.dataModel = [[DataModel alloc] initWithContent];
    self.sectionKeys = [[NSArray alloc] init];
    self.sectionKeys = [self.dataModel.dictionary allKeys];
    self.keys = [[NSArray alloc] init];
    self.imageDictionary = [[NSDictionary alloc] init];
    self.segmentControl = [[UISegmentedControl alloc] initWithItems:self.sectionKeys];
    self.segmentControl.center = CGPointMake(self.view.bounds.size.width/2, 30);
    [self.segmentControl addTarget:self action:@selector(setupData:) forControlEvents: UIControlEventValueChanged];
    self.segmentControl.selectedSegmentIndex = 0;
    self.segmentControl.userInteractionEnabled = YES;
    [self.view addSubview:self.segmentControl];
    [self setupData:self.segmentControl];
    // Layout - all
    
    self.layoutAll = [[UICollectionViewFlowLayout alloc] init];
    self.layoutAll.minimumInteritemSpacing = 20;
    self.layoutAll.minimumInteritemSpacing = 20;
    self.layoutAll.itemSize = CGSizeMake(self.view.frame.size.width / 2 - 30, self.view.frame.size.height / 3);
    self.layoutAll.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 50);
    self.layoutAll.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);

    
    // Collection View
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(self.view.bounds.origin.x + 10, self.view.bounds.origin.y + 50, self.view.bounds.size.width - 20, self.view.bounds.size.height - 50) collectionViewLayout:self.layoutAll];
    [self.collectionView registerClass:[aCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView registerClass:[HeaderCollectionReusableView class] forSupplementaryViewOfKind: UICollectionElementKindSectionHeader withReuseIdentifier: @"CollectionHeader"];
    [self.collectionView setDataSource:self];
    [self.collectionView setDelegate:self];
    self.collectionView.backgroundColor = [UIColor grayColor];
    self.collectionView.userInteractionEnabled = YES;
    [self.view addSubview:self.collectionView];
    
    self.view.backgroundColor = [UIColor blackColor];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.keys.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[self.imageDictionary objectForKey:self.keys[section] ] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    aCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    cell.backgroundColor = [UIColor redColor];
    NSArray *array = self.imageDictionary[self.keys[indexPath.section]];
    cell.imageView.image = [UIImage imageNamed:array[indexPath.row]];
    
    return cell;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
         HeaderCollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"CollectionHeader" forIndexPath:indexPath];
        header.sectionTitle.text = self.keys[indexPath.section];
        return header;
    } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
        return [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"CollectionFooter" forIndexPath:indexPath];
    }
    return nil;
}


- (void) collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@", indexPath);
}

- (void) setupData: (UISegmentedControl *) sender {
    NSInteger i = sender.selectedSegmentIndex;
    NSString *key = self.sectionKeys[i];
    self.imageDictionary = [self.dataModel getPhotos:key];
    self.keys = [self.imageDictionary allKeys];
    [self.collectionView reloadData];
}

@end
