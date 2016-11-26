//
//  NoteFilterTVCell.h
//  evernoteProject
//
//  Created by Jose Manuel Paredes Garcia on 26/11/16.
//  Copyright © 2016 Jose M Paredes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoteFilter.h"

@interface NoteFilterTVCell : UITableViewCell

- (void)updateCellWith:(NoteFilter *)noteFilter;

@end
