//
//  ViewController.m
//  KittyGram
//
//  Created by Ryan Tiltz on 6/10/14.
//  Copyright (c) 2014 Ryan Tiltz. All rights reserved.
//

#import "ViewController.h"
#import "Kitten.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
   self.parseClassName = @"Kitten";
    [super viewDidLoad];

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[PFUser currentUser] save];
    
    Kitten *kitten = (Kitten *)[self objectAtIndexPath:indexPath];
    PFObject *lick = [PFObject objectWithClassName:@"Lick"];
    [lick setObject:kitten forKey:@"kitten"];
    [lick setObject:[PFUser currentUser] forKey:@"user"];
    [lick saveInBackground];

    PFQuery *query = [PFQuery queryWithClassName:@"Lick"];
    [query whereKey:@"user" equalTo:[PFUser currentUser]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        NSLog(@"%@, %@", objects,error);

    }];
    
}
- (PFTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(Kitten *)kitten
{
    PFTableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath object:kitten];
    cell.imageView.file = kitten.image;
    [cell.imageView loadInBackground];
    return cell;
}
@end
