//
//  CNLabel.h
//  BV_WeiBo
//
//  Created by mac on 16/1/8.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CNTextView : UITextView

@end

@interface CNLabel : UIView<UITextViewDelegate>{
    
    CNTextView *_textView;
}

@property (nonatomic, copy)NSString *text;

@property (nonatomic, retain)NSDictionary *textAttributes;

@end

@interface CNTextAttachMent : NSTextAttachment

@end

