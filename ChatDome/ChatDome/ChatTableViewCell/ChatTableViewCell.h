//
//  ChatTableViewCell.h
//  zhangben
//
//  Created by TongHao on 14-10-27.
//  Copyright (c) 2014年 com.haohao575@163. All rights reserved.
//

#import <UIKit/UIKit.h>
#define t_Me_ImageName @"bubble-default-outgoing-selected"
#define t_Me_ImageNameSuffix @"png"
#define t_You_ImageName @"bubble-default-incoming-green"
#define t_You_ImageNameSuffix @"png"
#define t_MeCell 0 //cell样式自己
#define t_YouCell 1 //cell样式其他人
#define t_ShitImageWidth 20.0f //图片拉伸位置
#define t_ShitImageHeight 15.0f
@interface ChatTableViewCell : UITableViewCell
@property (nonatomic, strong)UIImageView *userImageView; //用户头像
@property (nonatomic, copy)NSString *chatString; //聊天内容
@property (nonatomic, copy)NSDate *date; //时间
//使用此方法创建cell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier StyleInt:(NSInteger)styleInt;
//使用此方法获取cell高度
+ (CGFloat)addChatTableViewCellHeightString:(NSString *)str;
@end
