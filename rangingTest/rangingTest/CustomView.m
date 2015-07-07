//
//  CustomView.m
//
//  Code generated using QuartzCode 1.33.3 on 6/7/15.
//  www.quartzcodeapp.com
//

#import "CustomView.h"
#import "QCMethod.h"

@interface CustomView ()

@property (nonatomic, assign) BOOL  updateLayerValueForCompletedAnimation;
@property (nonatomic, strong) NSMapTable * completionBlocks;
@property (nonatomic, strong) NSMutableDictionary * layers;


@end

@implementation CustomView

#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[self setupProperties];
		[self setupLayers];
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self) {
		[self setupProperties];
		[self setupLayers];
	}
	return self;
}



- (void)setupProperties{
	self.completionBlocks = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsOpaqueMemory valueOptions:NSPointerFunctionsStrongMemory];;
	self.layers = [NSMutableDictionary dictionary];
	
}

- (void)setupLayers{
	CALayer * Group = [CALayer layer];
	Group.frame = CGRectMake(34, 5, 32, 43);
	[self.layer addSublayer:Group];
	self.layers[@"Group"] = Group;
	{
		CAShapeLayer * rectangle = [CAShapeLayer layer];
		rectangle.frame = CGRectMake(10, 15, 13, 28);
		rectangle.path = [self rectanglePath].CGPath;
		[Group addSublayer:rectangle];
		self.layers[@"rectangle"] = rectangle;
		CAShapeLayer * polygon = [CAShapeLayer layer];
		polygon.frame = CGRectMake(0, 0, 32, 20);
		polygon.path = [self polygonPath].CGPath;
		[Group addSublayer:polygon];
		self.layers[@"polygon"] = polygon;
	}
	
	[self resetLayerPropertiesForLayerIdentifiers:nil];
}

- (void)resetLayerPropertiesForLayerIdentifiers:(NSArray *)layerIds{
	[CATransaction begin];
	[CATransaction setDisableActions:YES];
	
	if(!layerIds || [layerIds containsObject:@"Group"]){
		CALayer * Group = self.layers[@"Group"];
		Group.anchorPoint = CGPointMake(0.5, 1);
		
	}
	if(!layerIds || [layerIds containsObject:@"rectangle"]){
		CAShapeLayer * rectangle = self.layers[@"rectangle"];
		rectangle.fillColor = [UIColor colorWithRed:0.706 green: 0.137 blue:0.267 alpha:1].CGColor;
		rectangle.lineWidth = 0;
	}
	if(!layerIds || [layerIds containsObject:@"polygon"]){
		CAShapeLayer * polygon = self.layers[@"polygon"];
		polygon.fillColor = [UIColor colorWithRed:0.706 green: 0.137 blue:0.267 alpha:1].CGColor;
		polygon.lineWidth = 0;
	}
	
	[CATransaction commit];
}

#pragma mark - Animation Setup

- (void)addUntitled1Animation{
	NSString * fillMode = kCAFillModeForwards;
	
	////An infinity animation
	
	////Group animation
	CAKeyframeAnimation * GroupTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
	GroupTransformAnim.values         = @[[NSValue valueWithCATransform3D:CATransform3DIdentity], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 0.5, 1)]];
	GroupTransformAnim.keyTimes       = @[@0, @1];
	GroupTransformAnim.duration       = 0.3;
	GroupTransformAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	GroupTransformAnim.autoreverses   = YES;
	
	CAAnimationGroup * GroupUntitled1Anim = [QCMethod groupAnimations:@[GroupTransformAnim] fillMode:fillMode];
	GroupUntitled1Anim.repeatCount = INFINITY;
	[self.layers[@"Group"] addAnimation:GroupUntitled1Anim forKey:@"GroupUntitled1Anim"];
}

#pragma mark - Animation Cleanup

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
	void (^completionBlock)(BOOL) = [self.completionBlocks objectForKey:anim];;
	if (completionBlock){
		[self.completionBlocks removeObjectForKey:anim];
		if ((flag && self.updateLayerValueForCompletedAnimation) || [[anim valueForKey:@"needEndAnim"] boolValue]){
			[self updateLayerValuesForAnimationId:[anim valueForKey:@"animId"]];
			[self removeAnimationsForAnimationId:[anim valueForKey:@"animId"]];
		}
		completionBlock(flag);
	}
}

- (void)updateLayerValuesForAnimationId:(NSString *)identifier{
	if([identifier isEqualToString:@"Untitled1"]){
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"Group"] animationForKey:@"GroupUntitled1Anim"] theLayer:self.layers[@"Group"]];
	}
}

- (void)removeAnimationsForAnimationId:(NSString *)identifier{
	if([identifier isEqualToString:@"Untitled1"]){
		[self.layers[@"Group"] removeAnimationForKey:@"GroupUntitled1Anim"];
	}
}

- (void)removeAllAnimations{
	[self.layers enumerateKeysAndObjectsUsingBlock:^(id key, CALayer *layer, BOOL *stop) {
		[layer removeAllAnimations];
	}];
}

#pragma mark - Bezier Path

- (UIBezierPath*)rectanglePath{
	UIBezierPath*  rectanglePath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 13, 28)];
	return rectanglePath;
}

- (UIBezierPath*)polygonPath{
	UIBezierPath *polygonPath = [UIBezierPath bezierPath];
	[polygonPath moveToPoint:CGPointMake(15.851, -0.318)];
	[polygonPath addLineToPoint:CGPointMake(0, 20)];
	[polygonPath addLineToPoint:CGPointMake(31.701, 20)];
	[polygonPath closePath];
	[polygonPath moveToPoint:CGPointMake(15.851, -0.318)];
	
	return polygonPath;
}


@end