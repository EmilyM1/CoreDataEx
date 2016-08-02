//
//  ViewController.h
//  Sl_CoreData
//
//  Created by Emily on 8/1/16.
//  Copyright © 2016 com.emily. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *firstnameoutlet;
@property (weak, nonatomic) IBOutlet UITextField *lastnameoutlet;
@property (weak, nonatomic) IBOutlet UITextField *titleoutlet;

@property (strong) NSManagedObjectModel *members;
- (IBAction)saveData:(id)sender;
- (IBAction)dismissKeyboard:(id)sender;

@end
