//
//  Generated by pegged 0.4.1
//  Fork: https://github.com/hydrixos/pegged
//

#import <Foundation/Foundation.h>



/*!
 @abstract The ASTParser public interface
 */
@interface ASTParser : NSObject



/*!
 @abstract Parses the given string and passes the return value of the start rule as output argument.
 @discussion Returns YES on match.
 */
- (BOOL)parseString:(NSString *)string usingResult:(id *)result;

/*!
 @abstract Parses the given string.
 @discussion Returns YES on match.
 */
- (BOOL)parseString:(NSString *)string;

@end



/*!
 @abstract Methods available for parser actions
 */
@interface ASTParser (ParserActionHelper)


#pragma mark - Parser state

/*!
 @abstract The start index of the current capture
 */
@property (readonly) NSUInteger captureStart;

/*!
 @abstract The end index of the current capture
 */
@property (readonly) NSUInteger captureEnd;

/*!
 @abstract The currently parsed string
 */
@property (readonly) NSString* string;



#pragma mark - Action helpers

/*!
 @abstract Provides a result for the current rule
 */
- (void)pushResult:(id)result;

/*!
 @abstract Accesses the next result of a sub-rule
 */
- (id)nextResult;

/*!
 @abstract Accesses the result of a sub-rule with a certain index
 */
- (id)resultAtIndex:(NSInteger)index;

/*!
 @abstract Provies all sub-rule results as array.
 */
- (NSArray *)allResults;

/*!
 @abstract Provides the count of results.
 */
- (NSInteger)resultCount;

@end