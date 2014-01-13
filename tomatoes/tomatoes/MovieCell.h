//
//  MovieCell.h
//  tomatoes
//
//  Created by Thanawat Kaewka on 1/12/14.
//  Copyright (c) 2014 thanawat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UIImageView * posterImageView;
@property (nonatomic, weak) IBOutlet UILabel *movieTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *movieSummaryLabel;
@property (nonatomic, weak) IBOutlet UILabel *movieCastLabel;


@end
