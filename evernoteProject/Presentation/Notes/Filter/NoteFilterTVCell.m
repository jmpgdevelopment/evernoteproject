//
//  NoteFilterTVCell.m
//  evernoteProject
//
//  Created by Jose Manuel Paredes Garcia on 26/11/16.
//  Copyright © 2016 Jose M Paredes. All rights reserved.
//

#import "NoteFilterTVCell.h"
#import "NoteFilter.h"

@interface NoteFilterTVCell ()

@property (weak, nonatomic) IBOutlet UILabel *filterOptionLabel;

@end

@implementation NoteFilterTVCell 

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)updateCellWith:(NoteFilter *)noteFilter    {
    self.filterOptionLabel.text = noteFilter.optionLabel;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
