//
//  NoteTVCell.m
//  evernoteProject
//
//  Created by Jose Manuel Paredes Garcia on 25/11/16.
//  Copyright © 2016 Jose M Paredes. All rights reserved.
//

#import "NoteTVCell.h"

@interface NoteTVCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation NoteTVCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)updateCellWith:(ENNote *)note   {
    
    self.titleLabel.text = note.title;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
