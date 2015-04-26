//
//  Resources.h
//  BPcontrol
//
//  Created by Adrian Carrera on 26/4/15.
//  Copyright (c) 2015 Adrian Carrera. All rights reserved.
//

#define BPcontrol_Resources_h
#ifndef Resources_h
#define Resources_h

#ifdef DEBUG
#define DLog( s, ... ) NSLog( @"<%p %@:(%d)> %@", self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define DLog( s, ... )
#endif

#define RGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define ROJO RGB(179, 10, 21)
#define GRIS RGB(169, 169, 169)
#define GRIS_CLARO RGB(216, 216, 216)

//#define STRTRAD(key, comment) NSLocalizedStringFromTable(key, [LanguageController getCurrentLanguage], comment)
#define STRTRAD(key, comment) comment

// Return nil when __INDEX__ is beyond the bounds of the array
#define NSArrayObjectMaybeNil(__ARRAY__, __INDEX__) ((__INDEX__ >= [__ARRAY__ count]) ? nil : [__ARRAY__ objectAtIndex:__INDEX__])

// Manually expand an array into an argument list
#define NSArrayToVariableArgumentsList(__ARRAYNAME__)\
NSArrayObjectMaybeNil(__ARRAYNAME__, 0),\
NSArrayObjectMaybeNil(__ARRAYNAME__, 1),\
NSArrayObjectMaybeNil(__ARRAYNAME__, 2),\
NSArrayObjectMaybeNil(__ARRAYNAME__, 3),\
NSArrayObjectMaybeNil(__ARRAYNAME__, 4),\
NSArrayObjectMaybeNil(__ARRAYNAME__, 5),\
NSArrayObjectMaybeNil(__ARRAYNAME__, 6),\
NSArrayObjectMaybeNil(__ARRAYNAME__, 7),\
NSArrayObjectMaybeNil(__ARRAYNAME__, 8),\
NSArrayObjectMaybeNil(__ARRAYNAME__, 9),\
nil

#define MUSEO_100         @"Museo-100"
#define MUSEO_300         @"Museo-300"
#define MUSEO_500         @"Museo-500"
#define MUSEO_700         @"Museo-700"
#define MUSEO_900         @"Museo-900"

#define MUSEO_ITALIC_100         @"Museo-100Italic"
#define MUSEO_ITALIC_300         @"Museo-300Italic"
#define MUSEO_ITALIC_500         @"Museo-500Italic"
#define MUSEO_ITALIC_700         @"Museo-700Italic"
#define MUSEO_ITALIC_900         @"Museo-900Italic"

#define GourgramItemsArray @[@"chauqetillaunisex", @"cuchara", @"delantal unisex", @"gorro", @"guante"]

#define kDictJsonKey @"dictJsonKey"
#define kUpdateViewsKey @"updateViewsKey"

#define URL_FACEBOOK     @"https://www.facebook.com/"
#define URL_FACEBOOK_APP @"fb://profile/107718629298104"
#define URL_TWITTER      @"https://twitter.com/"
#define URL_INSTAGRAM    @"http://instagram.com//"
#define URL_GOOGLEPLUS   @"https://plus.google.com/"

#define kFavoritesFileName @"favorites.plist"

typedef void (^CompletionBlock)(NSError *error, id object);

#define NumMenuOptions 4
typedef NS_ENUM(NSUInteger, MenuOptionType) {
    MenuOptionWeb,
    MenuOptionChefs,
    MenuOptionCursos,
    MenuOptionTrucos,
};

typedef NS_ENUM(NSUInteger, TVCollectionViewCellType) {
    HomeTuCanal,
    HomeCategory,
    HomeVideo,
};

typedef NS_ENUM(NSUInteger, HomeType) {
    HomeInitial,
    HomeSection,
    HomeSubSection,
    HomeDetail,
    HomeFavorites,
};

typedef NS_ENUM(NSUInteger, HomeTopOptionsType) {
    HomeTopTuCanal,
    HomeTopVideos,
    HomeTopGourgram,
    HomeTopEnTv,
};

#endif
