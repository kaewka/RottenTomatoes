//
//  MovieListViewController.m
//  tomatoes
//
//  Created by Thanawat Kaewka on 1/12/14.
//  Copyright (c) 2014 thanawat. All rights reserved.
//

#import "MovieListViewController.h"
#import "MovieCell.h"
#import "Movie.h"

@interface MovieListViewController ()

@property (nonatomic, strong) NSArray *movies;

@end

@implementation MovieListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.movies = [NSArray array];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=g9au4hv6khv6wzvzgt55gpqs";
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            self.movies = [object valueForKeyPath:@"movies"];
            NSLog(@"%@", object);
            [self.tableView reloadData];
        }];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MovieCell";
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSDictionary *movieDict = [self.movies objectAtIndex:indexPath.row];
    Movie *movie = [[Movie alloc] initWithDictionary:movieDict];
    
    cell.movieTitleLabel.text = movie.title;
    cell.posterImageView.image = [UIImage imageWithData: [movie getImageData]];
    cell.movieSummaryLabel.text = movie.summary;
    cell.movieSummaryLabel.numberOfLines = 3;
    cell.movieCastLabel.text = [movie getCastWithSeparator: @", "];

    return cell;
}

@end
