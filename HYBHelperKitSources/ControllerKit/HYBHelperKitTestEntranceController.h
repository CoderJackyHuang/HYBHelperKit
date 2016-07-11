//
//  HYBHelperKitTestEntranceController.h
//  HYBHelperKit
//
//  Created by huangyibiao on 16/7/1.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HYBHelperKit.h"

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	The model for HYBHelperKitTestEntranceController, we use it to add test controller
 *  to the test center.
 */
@interface HYBHelperKitTestEntranceModel : NSObject

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	The view controller's Class
 */
@property (nonatomic, unsafe_unretained) Class vcClass;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	The title to show in the list, if it is nil, it will show the class name.
 */
@property (nonatomic, copy) NSString *title;

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Use this to create a model will be more convenience.
 *
 *	@param vcClass	The view controller's Class
 *	@param title		The title
 *
 *	@return The HYBHelperKitTestEntranceModel instance.
 */
+ (instancetype)modelWithClass:(Class)vcClass title:(NSString *)title;

@end

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	When a team is going to develop a project, usually we will divide
 *  works into more detail task and assign to different team members.
 *
 *  And the question is? We don't have test entrance, before each task 
 *  links together. So, here I try to support a common test center entrance
 *  view controller, and each team member can use it to add current controller
 *  entrance.
 *
 *  @Note Auto push to the next veiw controller when select an item. 
 */
@interface HYBHelperKitTestEntranceController : HYBHelperKitBaseController

/**
 *	@author https://github.com/CoderJackyHuang
 *
 *	Designed initialized.
 *
 *	@param items	To get HYBHelperKitTestEntranceModel items to show in the list.
 *
 *	@return The HYBHelperKitTestEntranceController instance.
 */
- (instancetype)initWithItems:(NSArray<HYBHelperKitTestEntranceModel *> *(^)(void))items;

@end
