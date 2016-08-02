//
//  ViewController.m
//  Sl_CoreData
//
//  Created by Emily on 8/1/16.
//  Copyright © 2016 com.emily. All rights reserved.
//


#import "ViewController.h"
#import <CoreData/CoreData.h>
@interface ViewController ()

@end

@implementation ViewController
@synthesize members;

-(NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication]delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if(self.members){
        [self.firstnameoutlet setText:[self.members valueForKey:@"text1"]];
        [self.lastnameoutlet setText:[self.members valueForKey:@"text2"]];
        [self.titleoutlet setText:[self.members valueForKey:@"text3"]];
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveData:(id)sender {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (self.members){
        [self.members setValue:self.firstnameoutlet.text forKey:@"text1"];
          [self.members setValue:self.lastnameoutlet.text forKey:@"text2"];
          [self.members setValue:self.titleoutlet.text forKey:@"text3"];
    } else {
    
    NSManagedObject *newMember = [NSEntityDescription insertNewObjectForEntityForName:@"Members" inManagedObjectContext:context];
    [newMember setValue:self.firstnameoutlet.text forKey:@"text1"];
    [newMember setValue:self.lastnameoutlet.text forKey:@"text2"];
    [newMember setValue:self.titleoutlet.text forKey:@"text3"];
        
    }
    
    NSError *error = nil;
    if (![context save:&error]){
        NSLog(@"%@ %@", error, [error localizedDescription]);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)dismissKeyboard:(id)sender {
    [self resignFirstResponder];
}
@end
