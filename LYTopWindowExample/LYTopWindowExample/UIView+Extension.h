//
//  UIView+Extension.h
//  LY
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;

/**
 *  判断屏幕上的self是否和anotherView有重叠
 */
- (BOOL)intersectWithView:(UIView *)anotherView;

- (NSString *)getNametag;

- (void)setNametag:(NSString *)theNametag;

- (UIView *)viewNamed:(NSString *)aName;

@end
