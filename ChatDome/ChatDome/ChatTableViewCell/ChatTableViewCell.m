//
//  ChatTableViewCell.m
//  zhangben
//
//  Created by TongHao on 14-10-27.
//  Copyright (c) 2014年 com.haohao575@163. All rights reserved.
//

#import "ChatTableViewCell.h"
@interface ChatTableViewCell()
@property (nonatomic, strong)UILabel *lable;
@property (nonatomic, strong)UIImageView *chatImageView;
@property (nonatomic, strong)UIView *returnView;
@property (nonatomic, strong)UILabel *lableDate;
@property (nonatomic,assign)NSInteger StyleInt;
@end

@implementation ChatTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier StyleInt:(NSInteger)styleInt{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.StyleInt = styleInt;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setStyleInt:(NSInteger)StyleInt{
    _StyleInt = StyleInt;
    [self addviewMe];
}
- (void)addviewMe
{
    self.userImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:self.userImageView];
    self.returnView = [[UIView alloc] initWithFrame:CGRectZero];
	self.returnView.backgroundColor = [UIColor clearColor];
	self.lableDate = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 9)];
    self.lableDate.textAlignment = NSTextAlignmentCenter;
    self.lableDate.font = [UIFont systemFontOfSize:10];
    UIImage *bubble = nil;
    if (self.StyleInt == t_MeCell) {
        bubble = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:t_Me_ImageName ofType:t_Me_ImageNameSuffix]];
    }else{
        bubble = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:t_You_ImageName ofType:t_You_ImageNameSuffix]];
    }
    //最重要的方法
	self.chatImageView = [[UIImageView alloc] initWithImage:[bubble stretchableImageWithLeftCapWidth:t_ShitImageWidth topCapHeight:t_ShitImageHeight]];
	UIFont *font = [UIFont systemFontOfSize:13];
	self.lable = [[UILabel alloc] initWithFrame:CGRectMake(13.0f, 14.0f, 0, 0)];
	self.lable.backgroundColor = [UIColor clearColor];
    
	self.lable.font = font;
	self.lable.numberOfLines = 0;
	self.lable.lineBreakMode = NSLineBreakByWordWrapping;
	self.chatImageView.frame = CGRectMake(0.0f, 10.0f, [UIScreen mainScreen].bounds.size.width / 2.0, 0);
    if (self.StyleInt == t_MeCell) {
        self.returnView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2.0 - 40, 0.0f, [UIScreen mainScreen].bounds.size.width / 2.0, 0);
        self.userImageView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 39, 0, 38, 38);
    }else{
        self.returnView.frame = CGRectMake(40.0f, 0.0f, [UIScreen mainScreen].bounds.size.width / 2.0, 0);
        self.userImageView.frame = CGRectMake(1, 0, 38, 38);
    }
    self.userImageView.layer.masksToBounds = YES;
    
    self.userImageView.layer.cornerRadius = 38 / 2;
	[self.returnView addSubview:self.chatImageView];
	[self.chatImageView addSubview:self.lable];
    [self.contentView addSubview:self.lableDate];
    self.returnView.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.returnView];
}

- (void)setChatString:(NSString *)chatString{
    _chatString = chatString;
    self.lable.text = chatString;
    [self setViewFrame:[self addCapitalLettersString:chatString]];
}
- (void)setViewFrame:(CGRect)rect{
    self.lable.frame = CGRectMake(self.lable.frame.origin.x,self.lable.frame.origin.y, rect.size.width + 5, rect.size.height + 5);
    if (self.StyleInt == t_MeCell) {
        self.chatImageView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2.0 - rect.size.width - 33.0f,self.chatImageView.frame.origin.y, rect.size.width + 33.0f, rect.size.height + 30.0f);
        self.returnView.frame = CGRectMake(self.returnView.frame.origin.x,self.returnView.frame.origin.y, rect.size.width + 33.0f, rect.size.height + 45.f);
    }else{
         self.chatImageView.frame = CGRectMake(self.chatImageView.frame.origin.x,self.chatImageView.frame.origin.y, rect.size.width + 33.0f, rect.size.height + 30.0f);
        self.returnView.frame = CGRectMake(self.returnView.frame.origin.x,self.returnView.frame.origin.y, rect.size.width + 33.0f, rect.size.height + 45.f);
    }
    self.userImageView.frame = CGRectMake(self.userImageView.frame.origin.x, rect.size.height, self.userImageView.frame.size.width, self.userImageView.frame.size.height);
    
}
- (void)setDate:(NSDate *)date{
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    formater.timeZone = [NSTimeZone systemTimeZone];//无效
    [formater setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    NSString *timestr = [formater stringFromDate: date];
    self.lableDate.text = timestr;
}
- (CGRect)addCapitalLettersString:(NSString *)str{
    CGRect rect = [ChatTableViewCell addCapitalLetterStringChat:str];
    return rect;
}
+ (CGRect)addCapitalLetterStringChat:(NSString *)str{
    CGRect rect = [str boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width / 2.0, 5000.0f) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:13.] forKey:NSFontAttributeName] context:nil];
    return rect;
}
+ (CGFloat)addChatTableViewCellHeightString:(NSString *)str{
    CGRect rect = [ChatTableViewCell addCapitalLetterStringChat:str];
    return rect.size.height + 45.0f;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
